/**
 * @version $Revision: 910 $
 * @author Chris Smith <chris@jacko.com>
 */
function printfire() {
	/*
	if (document.createEvent)
	{
	printfire.args = arguments;
	var ev = document.createEvent("Events");
	ev.initEvent("printfire", false, true);
	dispatchEvent(ev);
	}
	*/
}

var Debaser = {


	drawerIsOpen : false,
	toolsIsOpen : false,

	// is_ie : false,
	// is_safari : false,
	// init : function() {
	//     this.is_ie = document.all ? true : false;
	//     var ua = navigator.userAgent.toLowerCase();
	//     this.is_safari = ua.indexOf('safari') + 1 ? true : false;
	// },

	/* ------------- utilities */
	hideElementById : function (id) {
		document.getElementById(id).style.display = "none";
	},
	showElementById : function (id) {
		document.getElementById(id).style.display = "block";
	},

	showSidebar : function (specialEffects) {

		YAHOO.util.Dom.setStyle('dSidebar', 'opacity', 0.8);
	
		var pRegion     = YAHOO.util.Dom.getRegion("gsSidebarInner");
		var attributes  = { height: {to: (pRegion.bottom - pRegion.top)} };
		var anim        = new YAHOO.util.Anim('gsSidebar', attributes, 0.3, YAHOO.util.Easing.easeOut);
		var attributes2 = { top: {by: 1000} };
		var anim2       = new YAHOO.util.Anim('gsSidebarInner', attributes2, 0.5, YAHOO.util.Easing.easeOut);
		anim.animate();
		anim2.animate();
	
		Debaser.hideElementById("gsShowSidebar");
		Debaser.showElementById("gsHideSidebar");
	},
	hideSidebar : function (specialEffects) {
	
		var attributes  = { height: {to: 0} };
		var anim        = new YAHOO.util.Anim('gsSidebar', attributes, 0.5, YAHOO.util.Easing.easeOut);
		var attributes2 = { top: {by: -1000} };
		var anim2       = new YAHOO.util.Anim('gsSidebarInner', attributes2, 0.3, YAHOO.util.Easing.easeOut);
		anim.onComplete.subscribe(
			function () {
				YAHOO.util.Dom.setStyle('dSidebar', 'opacity', 1.0);}
		);
		anim.animate();
		anim2.animate();
	
		Debaser.hideElementById("gsHideSidebar");
		Debaser.showElementById("gsShowSidebar");
	},
	xshowSidebar : function (specialEffects) {
		printfire("showSidebar");
		YAHOO.util.Dom.setStyle('gsSidebar', 'opacity', 0.9);
		Debaser.showElementById("gsSidebar");
		if (specialEffects) {
			// first effect. Slide it open.
			var attributes  = { left: {to: 8} };
			var anim        = new YAHOO.util.Anim('gsSidebar', attributes, 0.40, YAHOO.util.Easing.easeOut);
			var attributes2 = { left: { to: 0 } };
			var anim2       = new YAHOO.util.Anim('gsSidebarInner', attributes2, 0.5, YAHOO.util.Easing.easeOut);
			anim.animate();
			anim2.animate();

			// second effect (as an onComplete): fade in
			/*
			var anim2function = function() {
			Debaser.showElementById("gsSidebarInner");
				//var attributes = { opacity: { from:0, to: 1 } };
				var attributes = { left: { to: 0 } };
			var anim = new YAHOO.util.Anim('gsSidebarInner', attributes, 0.5, YAHOO.util.Easing.easeNone);
			anim.animate();
			};
			anim.onComplete.subscribe(anim2function);
			anim.animate();
			*/
		} else {
			Debaser.showElementById("gsSidebarInner");
		}
		Debaser.hideElementById("gsShowSidebar");
		Debaser.showElementById("gsHideSidebar");

	},
	xhideSidebar : function (specialEffects) {
		printfire("hideSidebar");
		if (specialEffects) {
			// first effect: fade out
			var attributes  = { left: { to: 200 } };
			var anim        = new YAHOO.util.Anim('gsSidebarInner', attributes, 0.4, YAHOO.util.Easing.easeIn);
			var attributes2 = { left: {to: -200} };
			var anim2       = new YAHOO.util.Anim('gsSidebar', attributes2, 0.5, YAHOO.util.Easing.easeIn);
			anim.animate();
			anim2.animate();

			// second effect (as onComplete): slide away
			/*
			var anim2function = function() {
			//var attributes = { opacity: { to: 0 } };
			var attributes = { left: {to: -200} };
			var anim = new YAHOO.util.Anim('gsSidebar', attributes, 1, YAHOO.util.Easing.easeOut);

			var anim3function = function() {
			//Debaser.hideElementById("gsSidebarInner");
			//Debaser.hideElementById("gsSidebar");
			}
			anim.onComplete.subscribe(anim3function);
			anim.animate();
			};
			anim.onComplete.subscribe(anim2function);
			anim.animate();
			*/
		} else {
			Debaser.hideElementById("gsSidebarInner");
			Debaser.hideElementById("gsSidebar");
		}
		Debaser.hideElementById("gsHideSidebar");
		Debaser.showElementById("gsShowSidebar");
	},
	fadeIn : function (id, random) {
		printfire("fadeIn [" + id + "]");
		var time = 1;
		if (random) {
			time = Math.round(Math.random());
		}
		var attributes = { opacity: { from: 0, to: 1 } };
		var anim       = new YAHOO.util.Anim(id, attributes, time, YAHOO.util.Easing.easeNone);
		anim.animate();
	},
	getEventToElement :function (ev) {
		var is_ie = document.all ? true : false;
		if (is_ie) {
			//return window.event.toElement;
			return ev.toElement;
		} else {
			return ev.relatedTarget;
		}
	},

	elementContainsElement : function (container, containee) {
		var isParent = false;
		do {
			if (container == containee) {
				isParent = true;
				break;
			}
			containee = containee.parentNode;
		} while (containee != null);
		return isParent;
	},
	initDrawer : function (id) {
		printfire("initDrawer [" + id + "]");
		var pRegion     = YAHOO.util.Dom.getRegion("box_" + id + "_photo");
		var attributes  = { opacity: { to: 0.8 }, top: { to: (pRegion.bottom - pRegion.top)} };
		var attributes2 = { opacity: { to: 0.8 }, top: { to: (pRegion.bottom - pRegion.top)} };
		var anim        = new YAHOO.util.Anim("box_" + id + "_drawer_info", attributes, 0.5, YAHOO.util.Easing.easeOut);
		var anim2       = new YAHOO.util.Anim("box_" + id + "_drawer_tools", attributes2, 0.5, YAHOO.util.Easing.easeOut);
		anim.animate();
		anim2.animate();
	
		YAHOO.util.Dom.setStyle("box_" + id + "_drawer_info", "cursor", "hand");

	},
	infoDrawer : function (ev, id) {
		printfire("descDrawer [" + id + "]");
		var drawerId = "box_" + id + "_drawer_info";
		if (!Debaser.drawerIsOpen) {
			var dRegion    = YAHOO.util.Dom.getRegion(drawerId);
			var attributes = { top: { by: (dRegion.top - dRegion.bottom) } };
			var anim       = new YAHOO.util.Anim(drawerId, attributes, 0.5, YAHOO.util.Easing.easeOut);
			anim.animate();
			Debaser.drawerIsOpen = true;
		}

	},
	toolsDrawer : function (ev, id) {
		printfire("toolsDrawer [" + id + "]");
		var descId       = "box_" + id + "_drawer_info";
		var toolsId      = "box_" + id + "_drawer_tools";
		var dRegionDesc  = YAHOO.util.Dom.getRegion(descId);
		var dRegionTools = YAHOO.util.Dom.getRegion(toolsId);

		var attributes = { top: { by: (dRegionDesc.bottom - dRegionDesc.top) } };
		var anim       = new YAHOO.util.Anim(descId, attributes, 0.5, YAHOO.util.Easing.easeOut);
		anim.animate();
		var attributes2 = { top: { by: (dRegionTools.top - dRegionTools.bottom) } };
		var anim2       = new YAHOO.util.Anim(toolsId, attributes2, 0.5, YAHOO.util.Easing.easeIn);
		anim2.animate();
		Debaser.toolsIsOpen = true;

		// The info panel underneath might have an onClick. don't let that happen.
		YAHOO.util.Event.stopEvent(ev);
	},
	closeDrawer : function (id) {
		printfire("closeDrawer [" + id + "]");
		/*
		var descId = "box_" + id + "_drawer_info";
		var toolsId = "box_" + id + "_drawer_tools";
		var dRegionDesc = YAHOO.util.Dom.getRegion(descId);
		var dRegionTools = YAHOO.util.Dom.getRegion(toolsId);

		var attributes = { top: { by: (dRegion.bottom - dRegion.top) } };
		var anim = new YAHOO.util.Anim(descId, attributes, 0.5, YAHOO.util.Easing.easeOut);
		anim.animate();
		var attributes2 = { top: { by: (dRegion.top - dRegion.bottom) } };
		var anim2 = new YAHOO.util.Anim(toolsId, attributes2, 0.5, YAHOO.util.Easing.easeIn);
		anim2.animate();
		*/
	},
	closeDrawers : function (ev, id) {
		var tPhoto    = "box_" + id + "_photo";
		var toElement = Debaser.getEventToElement(ev);
		// check to makke sure we really left the outer element ('this' is the element the event is attached to)
		if (Debaser.elementContainsElement(this, toElement)) {
			return;
		} else {
			Debaser.initDrawer(id);
			Debaser.drawerIsOpen = false;
			Debaser.toolsIsOpen  = false;
		}
	},
	goToUrl : function (ev, url) {
		window.location = url;
	}
};
/*



	hideSidebar : function(specialEffects) {
		if (specialEffects) {
			new Rico.Effect.FadeTo( 'gsSidebarInner', 0.0, 200, 10, {complete:function() { new Rico.Effect.Size( 'gsSidebar', 1, null, 500, 10, {complete:function () {Debaser.hideElementById('gsSidebar');}});}});
		} else {
			Debaser.hideElementById("gsSidebarInner");
			Debaser.hideElementById('gsSidebar');
		}

		this.hideElementById("gsHideSidebar");
		this.showElementById("gsShowSidebar");
	},
	showSidebar : function(specialEffects) {
		this.showElementById("gsSidebar");
		if (specialEffects) {
			this.setOpacity('gsSidebarInner', 0.0);
			new Rico.Effect.Size( 'gsSidebar', 200, null, 500, 10, {complete:function() {Debaser.showElementById("gsSidebarInner"); new Rico.Effect.FadeTo( 'gsSidebarInner', 1.0, 200, 10, null);}});
		} else {
			Debaser.showElementById("gsSidebarInner");
		}

		this.hideElementById("gsShowSidebar");
		this.showElementById("gsHideSidebar");

	},
	setOpacity : function(id, newOpacity) {
	  $(id).style.filter = "alpha(opacity:"+Math.round(newOpacity*100)+")";
	  $(id).style.opacity = newOpacity; /*//*/
	},
	fadeIn : function (id, random) {
		var time  = 1000;
		var steps = 5;
		if (random) {
			steps += Math.round(Math.random() * 10);
		}
		this.setOpacity(id, 0.1);
		new Rico.Effect.FadeTo(id, 1.0, time, steps, null);
	}

	}
	Debaser.init();
	*/
