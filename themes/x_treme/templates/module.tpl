{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
{*{$theme.moduleTemplate}
*}

{if $theme.moduleTemplate != "modules/panorama/templates/Panorama.tpl" && $theme.moduleTemplate != "modules/panoramajs/templates/PanoramaJs.tpl" && $theme.moduleTemplate != "modules/map/templates/ShowMap.tpl" && $theme.moduleTemplate != "modules/ecard/templates/SendEcard.tpl"}
{assign var='moduleWidth' value=1}
{/if}

{assign var=itemId value=$theme.item.id}
{capture assign="ImageBlock"}{g->block type="imageblock.ImageBlock" blocks="specificItem" showDate=0 showOwner=0 showViews=0 showTitle=1 showHeading=0 useDefaults=0}{/capture}


<table cellspacing="0" cellpadding="0" align="center" border="0" {if !empty($moduleWidth)}width="100%"{/if}>
  <tr valign="top">



    {* sidebar *}
    {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {if $sidebar == 'static'}
      <table style="text-align:left">
        <tr valign="top">
          <td>
	  {g->theme include="sidebar.tpl"}
          </td>
        </tr>
      </table>
      {/if}
      {if $sidebar == 'floating'}
	{literal}
    	<script type="text/JavaScript"> 
      	//<![CDATA[
      	<!--
	divSidebar = {/literal}"<div id=\"floatingSidebar\" onmousedown=\"dragStart(event, 'floatingSidebar')\" class=\"BlockOpacity\" style=\"cursor:move;\">"{literal};
	function sidebarT(){document.write(divSidebar);}
	sidebarT();
      	//-->
      	//]]>
    	</script>
 	{/literal}

      <table>
	<tr>
	  <td>
	{literal}
	<script type="text/JavaScript">
	//<![CDATA[
	<!--
	divSidebarClose = {/literal}"<table class=\"gcBorder2 gcBackground2\"><tr><td class=\"gcBorder1 gcBackground1\"><div onmousedown=\"dragStart(event, 'floatingSidebar')\" class=\"BlockMove\" style=\"text-align:right\"><a onmouseover=\"toggleLyr('floatingSidebar')\" title=\"{g->text text='Close'}\" class=\"icon tLink-close\"><img src='{$imageURL_base}blank.gif' alt='{g->text text='Close'}'\/><\/a><\/div><\/td><\/tr><tr><td class=\"gcBorder1\">"{literal};
	function sidebarClose(){document.write(divSidebarClose);}
	sidebarClose();
	//-->
	//]]>
	</script>
	{/literal}
	  {g->theme include="sidebar.tpl"}
	{literal}
	<script type="text/JavaScript">
        //<![CDATA[
        <!--
	divSidebarCloseEnd = {/literal}"<\/td><\/tr><\/table>"{literal};
	function sidebarCloseEnd(){document.write(divSidebarCloseEnd);}
	sidebarCloseEnd();
        //-->
        //]]>
        </script>
        {/literal}

          </td>
	</tr>
      </table>

	{literal}
	<script type="text/JavaScript">
        //<![CDATA[
        <!--
	divSidebarEnd = {/literal}"<\/div>"{literal};
	function sidebarEnd(){document.write(divSidebarEnd);}
	sidebarEnd();
        //-->
        //]]>
        </script>
        {/literal}
      {/if}

    <script type="text/javascript">
      {* hide the sidebar if there's nothing in it *}
      // <![CDATA[
      var el = document.getElementById("floatingSidebar");

      {* fix this ---  var text = el.innerText;  // IE  *}
      var text = 'unknown';
      if (el) text = el.innerText; // IE

      if (!text) text = el.textContent; // Firefox
      if (!text || !text.match(/\S/)) el.style.display = 'none';
      // ]]>
    </script>

    </td>
    {/if}
    {* /sidebar *}


    {if !empty($ImageBlock) & ($theme.moduleTemplate == "modules/comment/templates/AddComment.tpl" || $theme.moduleTemplate == "modules/comment/templates/EditComment.tpl" || $theme.moduleTemplate == "modules/ecard/templates/SendEcard.tpl")}
    <td valign="top">
      <table border="0" style="margin:10px">
        <tr>
          <td style="text-align:left">
    	    {if ($theme.moduleTemplate == "modules/comment/templates/AddComment.tpl" || $theme.moduleTemplate == "modules/comment/templates/EditComment.tpl")}
            {g->text text="You are commenting:"}
	    {/if}
    	    {if $theme.moduleTemplate == "modules/ecard/templates/SendEcard.tpl"}
            {g->text text="Send this item as eCard:"}
	    {/if}	
            <br/><br/>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">
            {$ImageBlock}
          </td>
        </tr>
      </table>
    </td>
    {/if}

    <td>
      {if $theme.moduleTemplate == "modules/panoramajs/templates/PanoramaJs.tpl"}
 	<table align="center" border="0"><tr><td>
      {/if}
      {include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {if $theme.moduleTemplate == "modules/panoramajs/templates/PanoramaJs.tpl"}
	</td></tr></table>
      {/if}
      <br/>
    </td>
  </tr>
  <tr>
    <td></td><td>
      <a href="javascript:history.back()" style="text-align:center; height:50px;">
  {literal}
  <script type="text/JavaScript">
  //<![CDATA[
  <!--
  back = {/literal}"&lt;&lt; Back"{literal};
  function historyBack(){document.write(back);}
  historyBack();
  //-->
  //]]>
  </script>
  {/literal}
      </a>

    </td>
  </tr>
</table>
<br/>

