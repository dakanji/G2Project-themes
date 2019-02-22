// JavaScript Document #2007/01/03


// Fade In Script by Louis St-Amour (CSpotkill@CSpotkill.com) based on code from clagnut.com
// Released under the GPL as a part of Gallery 2 (http://gallery.menalto.com/)

if (document.getElementById) {
	document.write("<style type='text/css'>.giThumbImage img {visibility:hidden;} #gsSingleImageId img {visibility:hidden;} </style>");
}

function start() {
	if (SidebarFound = document.getElementById('gsSidebar')) {
		DivColl = SidebarFound.getElementsByTagName('div')
		for (var t = 0; t < DivColl.length; t++) {
			var divClass = DivColl[t].className;
			if (divClass == 'giThumbImage') {
				var anchorCollTemp = DivColl[t].getElementsByTagName('a');
				var imageCollTemp  = anchorCollTemp[0].getElementsByTagName('img');
				var theimage       = imageCollTemp[0];
				theimage.id        = 'gbSidebarImage';
				CheckIfComplete('gbSidebarImage',1);
			}
		}
	}
	if (SingleImageDiv = document.getElementById('gsSingleImageId')) {
		var imageCollTemp = SingleImageDiv.getElementsByTagName('img');
		var theimage      = imageCollTemp[0];
		theimage.id       = 'gTheSingleImage';
		CheckIfComplete('gTheSingleImage',1);
	}
	if (ThumbMatrix = document.getElementById('gbThumbMatrix')) {
		rowColl         = ThumbMatrix.getElementsByTagName('tr');
		var ImageNumber = 0;
		for (var r = 0; r < rowColl.length; r++) {
			var itemColl = rowColl[r].getElementsByTagName('td');
			for (var i = 0; i < itemColl.length; i++) {
				var itemClass = itemColl[i].className;
				if (itemClass == 'gbItemImage' || itemClass == 'gbItemAlbum') {
					ImageNumber++;
					var div      = itemColl[i].getElementsByTagName('div');
					var images   = div[0].getElementsByTagName('img');
					var theimage = images[0];
					theimage.id  = 'gbImageNo' + ImageNumber;
					CheckIfComplete('gbImageNo' + ImageNumber, ImageNumber);
				}
			}
		}
	}
}

function CheckIfComplete(ImageId,ImageNumber) {
	ImageObj = document.getElementById(ImageId);
	if (ImageObj.complete == false) {
		window.setTimeout("CheckIfComplete('" + ImageId + "')", 100);
	} else {
		startFade(ImageId,ImageNumber);
	}
}

function startFade(imageId,ImageNumber) {
	var ImageFromId = document.getElementById(imageId);
	setOpacity(ImageFromId, 0);
	ImageFromId.style.visibility = 'visible';
	window.setTimeout("fadeIn('" + imageId + "', 0)", (ImageNumber * 600));
}

function fadeIn(objId,opacity) {
	if (document.getElementById) {
		obj = document.getElementById(objId);
		if (opacity <= 100) {
			setOpacity(obj, opacity);
			opacity += 5;
			window.setTimeout("fadeIn('" + objId + "'," + opacity + ")", 100);
		}
	}
}

function setOpacity(obj, opacity) {
	opacity = (opacity == 100) ? 99.999 : opacity;
	
	// IE/Win
	obj.style.filter = "alpha(opacity:" + opacity + ")";
	
	// Safari<1.2, Konqueror
	obj.style.KHTMLOpacity = opacity / 100;
	
	// Older Mozilla and Firefox
	obj.style.MozOpacity = opacity / 100;
	
	// Safari 1.2, newer Firefox and Mozilla, CSS3
	obj.style.opacity = opacity / 100;
}


var type = "IE";    //Variable used to hold the browser name

BrowserSniffer();

//detects the capabilities of the browser
function BrowserSniffer() {
	if (navigator.userAgent.indexOf("Opera") != -1 && document.getElementById) {
		type = "OP";
	}
	//Opera
	else if (document.all) {
		type = "IE";
	}
	//Internet Explorer e.g. IE4 upwards
	else if (document.layers) {
		type = "NN";
	}
	//Netscape Communicator 4
	else if (!document.all && document.getElementById) {
		type = "MO";
	}
	//Mozila e.g. Netscape 6 upwards
	else {
		type = "IE";        //I assume it will not get here
	}
}

//Displays the generic browser type
function whatBrows() {
	window.alert("Browser is : " + type);
}

//Puts the contents of str into the layer id
//id is the name of the layer
//str is the required content
//Works with all browsers except Opera
function ChangeContent(id, str) {
	if (type == "IE") {
		document.all[id].innerHTML = str;
	}
	if (type == "NN") {
		document.layers[id].document.open();
		document.layers[id].document.write(str);
		document.layers[id].document.close();
	}
	if (type == "MO" || type == "OP") {
		document.getElementById(id).innerHTML = str;
	}
}

//Show and hide a layer
//id is the name of the layer
//action is either hidden or visible
//Seems to work with all versions NN4 plus other browsers
function ShowLayer(id, action){
	if (type == "IE") {
		eval("document.all." + id + ".style.visibility='" + action + "'");
	}
	if (type == "NN") {
		eval("document." + id + ".visibility='" + action + "'");
	}
	if (type == "MO" || type == "OP") {
		eval(
			"document.getElementById('" + id + "').style.visibility='" + action + "'"
		);
	}
}

function showLyr(id){
	if (type == "IE") {
		eval("document.all." + id + ".style.visibility='visible'");
	}
	if (type == "NN") {
		eval("document." + id + ".visibility='visible'");
	}
	if (type == "MO" || type == "OP") {
		eval(
			"document.getElementById('" + id + "').style.visibility='visible'"
		);
	}
}
function hideLyr(id){
	if (type == "IE") {
		eval("document.all." + id + ".style.visibility='hidden'");
	}
	if (type == "NN") {
		eval("document." + id + ".visibility='hidden'");
	}
	if (type == "MO" || type == "OP") {
		eval(
			"document.getElementById('" + id + "').style.visibility='hidden'"
		);
	}
}
function toggleLyr(id){
	if (type == "IE") {
		if (document.all[id].style.visibility == "visible") {
			document.all[id].style.visibility = "hidden";
		} else {
			document.all[id].style.visibility = "visible";
		}
	}
	if (type == "MN") {
		if (document.layers[id].style.visibility == "visible") {
			document.layers[id].style.visibility = "hidden";
		} else {
			document.layers[id].style.visibility = "visible";
		}
	}
	if (type == "MO" || type == "OP") {
		if (document.getElementById(id).style.visibility == "visible") {
			document.getElementById(id).style.visibility = "hidden";
		} else {
			document.getElementById(id).style.visibility = "visible";
		}
	}

}

function showLyrD(id){
	if (type == "IE") {
		eval("document.all." + id + ".style.display=''");
	}
	if (type == "NN") {
		eval("document." + id + ".display=''");
	}
	if (type == "MO" || type == "OP") {
		eval(
			"document.getElementById('" + id + "').style.display=''"
		);
	}
}
function hideLyrD(id){
	if (type == "IE") {
		eval("document.all." + id + ".style.display='none'");
	}
	if (type == "NN") {
		eval("document." + id + ".display='none'");
	}
	if (type == "MO" || type == "OP") {
		eval(
			"document.getElementById('" + id + "').style.display='none'"
		);
	}
}

function toggleLyrD(id){
	if (type == "IE") {
		if (document.all[id].style.display == "block") {
			document.all[id].style.display = "none";
		} else {
			document.all[id].style.display = "block";
		}
	}
	if (type == "MN") {
		if (document.layers[id].style.display == "block") {
			document.layers[id].style.display = "none";
		} else {
			document.layers[id].style.display = "block";
		}
	}
	if (type == "MO" || type == "OP") {
		if (document.getElementById(id).style.display == "block") {
			document.getElementById(id).style.display = "none";
		} else {
			document.getElementById(id).style.display = "block";
		}
	}
}

// Layer Move Script based on the example of Brainjar from www.brainjar.com/dhtml/drag

// Determine browser and version.
function Browser() {
	var ua, s, i;

	this.isIE    = false;
	this.isNS    = false;
	this.version = null;

	ua = navigator.userAgent;

	s = "MSIE";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isIE    = true;
		this.version = parseFloat(ua.substr(i + s.length));
		return;
	}
	s = "Netscape6/";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isNS    = true;
		this.version = parseFloat(ua.substr(i + s.length));
		return;
	}
	// Treat any other "Gecko" browser as NS 6.1.
	s = "Gecko";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isNS    = true;
		this.version = 6.1;
		return;
	}
}
var browser = new Browser();

// Global object to hold drag information.
var dragObj    = new Object();
dragObj.zIndex = 0;

function dragStart(event, id) {
	var el;
	var x, y;

	// If an element id was given, find it. Otherwise use the element being
	// clicked on.
	if (id) {
		dragObj.elNode = document.getElementById(id);
	} else {
		if (browser.isIE) {
			dragObj.elNode = window.event.srcElement;
		}
		if (browser.isNS) {
			dragObj.elNode = event.target;
		}
		// If this is a text node, use its parent element.
		if (dragObj.elNode.nodeType == 3) {
			dragObj.elNode = dragObj.elNode.parentNode;
		}
	}

	// Get cursor position with respect to the page.
	if (browser.isIE) {
		x = window.event.clientX + document.documentElement.scrollLeft + document.body.scrollLeft;
		y = window.event.clientY + document.documentElement.scrollTop + document.body.scrollTop;
	}
	if (browser.isNS) {
		x = event.clientX + window.scrollX;
		y = event.clientY + window.scrollY;
	}

	// Save starting positions of cursor and element.
	dragObj.cursorStartX = x;
	dragObj.cursorStartY = y;
	dragObj.elStartLeft  = parseInt(dragObj.elNode.style.left, 10);
	dragObj.elStartTop   = parseInt(dragObj.elNode.style.top,  10);

	if (isNaN(dragObj.elStartLeft)) {
		dragObj.elStartLeft = 0;
	}
	if (isNaN(dragObj.elStartTop)) {
		dragObj.elStartTop = 0;
	}

	// Update element's z-index.
	dragObj.elNode.style.zIndex = ++dragObj.zIndex;

	// Capture mousemove and mouseup events on the page.
	if (browser.isIE) {
		document.attachEvent("onmousemove", dragGo);
		document.attachEvent("onmouseup",   dragStop);
		window.event.cancelBubble = true;
		window.event.returnValue  = false;
	}
	if (browser.isNS) {
		document.addEventListener("mousemove", dragGo,   true);
		document.addEventListener("mouseup",   dragStop, true);
		event.preventDefault();
	}
}

function dragGo(event) {
	var x, y;

	// Get cursor position with respect to the page.
	if (browser.isIE) {
		x = window.event.clientX + document.documentElement.scrollLeft + document.body.scrollLeft;
		y = window.event.clientY + document.documentElement.scrollTop + document.body.scrollTop;
	}
	if (browser.isNS) {
		x = event.clientX + window.scrollX;
		y = event.clientY + window.scrollY;
	}

	// Move drag element by the same amount the cursor has moved.
	dragObj.elNode.style.left = (dragObj.elStartLeft + x - dragObj.cursorStartX) + "px";
	dragObj.elNode.style.top  = (dragObj.elStartTop + y - dragObj.cursorStartY) + "px";

	if (browser.isIE) {
		window.event.cancelBubble = true;
		window.event.returnValue  = false;
	}
	if (browser.isNS) {
		event.preventDefault();
	}
}

function dragStop(event) {
	// Stop capturing mousemove and mouseup events.
	if (browser.isIE) {
		document.detachEvent("onmousemove", dragGo);
		document.detachEvent("onmouseup",   dragStop);
	}
	if (browser.isNS) {
		document.removeEventListener("mousemove", dragGo,   true);
		document.removeEventListener("mouseup",   dragStop, true);
	}
}


var hide = true;
function showhide(obj)
{
	var x              = new getObj('testP');
	hide               = !hide;
	x.style.visibility = (hide) ? 'hidden' : 'visible';
	setLyr(obj,'testP');
}

function setLyr(obj,lyr,ofY,ofX)
{
	var newX = findPosX(obj);
	var newY = findPosY(obj);
	if (lyr == 'testP') {
		newY -= 50;
	}
	var x = new getObj(lyr);

	expY = newY + (ofY);
	expX = newX + (ofX);

	x.style.top  = expY + 'px';
	x.style.left = expX + 'px';
}

function findPosX(obj)
{
	var curleft = 0;
	if (obj.offsetParent) {
		while (obj.offsetParent) {
			curleft += obj.offsetLeft
			obj      = obj.offsetParent;
		}
	} else if (obj.x) {
		curleft += obj.x;
	}
	return curleft;
}

function findPosY(obj)
{
	var curtop      = 0;
	var printstring = '';
	if (obj.offsetParent) {
		while (obj.offsetParent) {
			printstring += ' element ' + obj.tagName + ' has ' + obj.offsetTop;
			curtop      += obj.offsetTop
			obj          = obj.offsetParent;
		}
	} else if (obj.y) {
		curtop += obj.y;
	}
	window.status = printstring;
	return curtop;
}

var menu;
var theTop = 30;
var old    = theTop;

//window.onload = function () {
//	menu = new getObj('menu');
//	movemenu();
//}

function movemenu()
{
	if (window.innerHeight) {
		  pos = window.pageYOffset
	} else if (document.documentElement && document.documentElement.scrollTop) {
		pos = document.documentElement.scrollTop
	} else if (document.body) {
		  pos = document.body.scrollTop
	}
	if (pos < theTop) {
		pos = theTop;
	} else {
		pos += 30;
	}
	if (pos == old) {
		menu.style.top = pos;
	}
	old  = pos;
	temp = setTimeout('movemenu()',500);
}

function getObj(name)
{
	if (document.getElementById) {
		this.obj   = document.getElementById(name);
		this.style = document.getElementById(name).style;
	} else if (document.all) {
		this.obj   = document.all[name];
		this.style = document.all[name].style;
	} else if (document.layers) {
		this.obj   = document.layers[name];
		this.style = document.layers[name];
	}
}


function nrc(e) {
	if (document.all) {
		if (event.button == 2) {
			return false;
		}
	}
	if (document.layers) {
		if (e.which == 3) {
			return false;
		}
	}
}


function rcalert(e) {
	if (document.all) {
		if (event.button == 2) {
			alert(msgmouse);
			return false;
		}
	}
	if (document.layers) {
		if (e.which == 3) {
			alert(msgmouse);
			return false;
		}
	}
}


function sidebarrc(e) {
	if (document.all) {
		if (event.button == 2) {
			a = toggleLyr('floatingSidebar');
			return false;
		}
	}
	if (document.layers) {
		if (e.which == 3) {
			a = toggleLyr('floatingSidebar');
			return false;
		}
	}
}

function sidebarnrc(e) {
	if (document.all) {
		if (event.button == 2) {
			a = toggleLyr('floatingSidebar');
			return false;
		}
	}
	if (document.layers) {
		if (e.which == 3) {
			a = toggleLyr('floatingSidebar');
			return false;
		}
	}
}

function sidebarrcalert(e) {
	if (document.all) {
		if (event.button == 2) {
			a = ShowLayer('floatingSidebar','visible');
			alert(msgmouse);
			return false;
		}
	}
	if (document.layers) {
		if (e.which == 3) {
			a = toggleLyr('floatingSidebar');
			alert(msgmouse);
			return false;
		}
	}
}

if (document.layers) {
	document.captureEvents(Event.MOUSEDOWN);
}


