/* Sidebar Container Object */
var gsSidebar;

/* Item Hover Panel Object */
var itemHover;

/* Dynamically generated hover title/body information */
var itemHoverTitles = new Array();
var itemHoverBodies = new Array();


/* Initialize the Simplified theme */
function initTheme() {
	initSidebar();
	initHoverItems();
}



/* Initialize the Sidebar */
function initSidebar() {
	gsSidebar = YAHOO.util.Dom.get("gsSidebar");

	/* Attach event to 'Show Sidebar' link */
	YAHOO.util.Event.addListener("showSidebarLink", "click", showSidebar);
	/* Attach event to close button link */
	YAHOO.util.Event.addListener("sidebarClose", "click", hideSidebar);
}

/* Attached to 'Show Sidebar' href click event */
function showSidebar(e) {
	YAHOO.util.Event.preventDefault(e);

	/* don't show sidebar while getting dimensions */
	YAHOO.util.Dom.setStyle(gsSidebar, "visibility", "hidden");

	/* Save original dimensions (must be block to get dimensions, hence the hidden above */
	/* We also get dimensions when sidebar is at 0,0. It could be off screen sometimes and */
	/* we'd end up getting the wrong original size (it'd be shrunk by the browser) */
	YAHOO.util.Dom.setX(gsSidebar, 0);
	YAHOO.util.Dom.setY(gsSidebar, 0);
	YAHOO.util.Dom.setStyle(gsSidebar, "display", "block");
	var sidebarRegion = YAHOO.util.Dom.getRegion(gsSidebar);
	var origHeight    = sidebarRegion.bottom - sidebarRegion.top;
	var origWidth     = sidebarRegion.right - sidebarRegion.left;

	/* Set maximum width */
	if (origWidth > 280) {
		origWidth = 280;
	}

	/* Move sidebar to mouse click location */
	YAHOO.util.Dom.setX(gsSidebar, YAHOO.util.Event.getPageX(e) - origWidth);
	YAHOO.util.Dom.setY(gsSidebar, YAHOO.util.Event.getPageY(e));

	/* Set size of containers to auto width to see if we can leave them auto */
	/* We can't leave auto if we are scrolled right because browser shrinks sidebar */
	YAHOO.util.Dom.setStyle(gsSidebar, "width", "auto");

	/* Get size after move (we check difference after animation further below) */
	var newSidebarRegion = YAHOO.util.Dom.getRegion(gsSidebar);
	var newWidth         = newSidebarRegion.right - newSidebarRegion.left;

	/* Shrink to 0x0 and make visible */
	YAHOO.util.Dom.setStyle(gsSidebar, "height", "0px");
	YAHOO.util.Dom.setStyle(gsSidebar, "width", "0px");
	YAHOO.util.Dom.setStyle(gsSidebar, "visibility", "visible");
	/* Set spacer width to prevent contents from moving during resize */
	YAHOO.util.Dom.setStyle("gsSidebarSpacer", "width", origWidth + "px");

	/* create anonymous function to reset width/height's when animation is complete */
	var autoSize = function () {
		if (newWidth != origWidth) {
			/* New width could be smaller if we are scrolled right and squish the div */
			/* New width could be larger if originally larger than maximum width and we shrunk it */
			YAHOO.util.Dom.setStyle(gsSidebar, "height", "auto");
			YAHOO.util.Dom.setStyle(gsSidebar, "width", origWidth + "px");
		} else {
			YAHOO.util.Dom.setStyle(gsSidebar, "height", "auto");
			YAHOO.util.Dom.setStyle(gsSidebar, "width", "auto");
			YAHOO.util.Dom.setStyle("gsSidebarSpacer", "width", "auto");
		}
	}

	/* resize to the original width/height */
	var resizeSidebar = new YAHOO.util.Anim(gsSidebar, { width: { to: origWidth }, height: { to: origHeight } }, 0.5, YAHOO.util.Easing.backOut);
	resizeSidebar.onComplete.subscribe(autoSize);
	resizeSidebar.animate();
}

/* Attached to 'X' href click event */
function hideSidebar(e) {
	YAHOO.util.Event.preventDefault(e);

	/* create anonymous function to hide sidebar when animation is complete */
	var hideSidebar = function () {
		YAHOO.util.Dom.setStyle(gsSidebar, "display", "none");
		YAHOO.util.Dom.setStyle(gsSidebar, "opacity", 1);
	}

	var fadeOut = new YAHOO.util.Anim(gsSidebar, { opacity: { to: 0 } }, 0.25, YAHOO.util.Easing.easeOut);
	fadeOut.onComplete.subscribe(hideSidebar);
	fadeOut.animate();
}



/* Allows page to add hover data to memory */
function addHoverDataMap(id, title, body) {
	itemHoverTitles[id] = title;
	itemHoverBodies[id] = body;
}

/* Initialize the item hover container and add all item hover events */
function initHoverItems() {
	itemHover = new YAHOO.widget.Panel(
		"itemHover",
		{
			visible: false,
			width: "200px",
			zIndex: 100,
			constraintoviewport: false,
			close: false,
			draggable: false,
			underlay: "none"
		}
	);

	/* listen to events on all specified objects */
	thumbHovers = YAHOO.util.Dom.getElementsByClassName("simplifiedHover", "td", "gsThumbMatrix");

	YAHOO.util.Event.addListener(thumbHovers, "mouseover", showItemHover);
	YAHOO.util.Event.addListener(thumbHovers, "mouseout", hideItemHover);
}

/* Called onmouseover, gets title and body of hover element and registers event mousemove */
function showItemHover(e) {
	var dataIndex = this.id.substr(16) * 1;

	itemHover.setHeader(itemHoverTitles[dataIndex]);
	itemHover.setBody(itemHoverBodies[dataIndex]);
	itemHover.setFooter('');
	itemHover.render();

	itemHover.cfg.setProperty("x", YAHOO.util.Event.getPageX(e) - 100);
	itemHover.cfg.setProperty("y", YAHOO.util.Event.getPageY(e) + 30);
	itemHover.show();

	YAHOO.util.Event.addListener(this, "mousemove", updateItemHover);
}

/* Called onmousemove, updates location of hover element */
function updateItemHover(e) {
	itemHover.cfg.setProperty("x", YAHOO.util.Event.getPageX(e) - 100);
	itemHover.cfg.setProperty("y", YAHOO.util.Event.getPageY(e) + 30);
}

/* Called onmouseout, kills mousemove listener and hides hover element */
function hideItemHover(e) {
	YAHOO.util.Event.removeListener(this, "mousemove", updateItemHover);

	itemHover.hide();
}



/* Attach theme initialization function to page load event */
YAHOO.util.Event.addListener(window, "load", initTheme);
