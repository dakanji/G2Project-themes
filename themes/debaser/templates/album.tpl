{*
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
         <div id="dPageInfo" class="gbBlock gcBackground1">
          <table style="width: 100%">
            <tr valign="top">
              <td style="width: 200px;">

        {if ($theme.totalPages != 1) }
         <div id="dNavigator" class="gbNavigator gcBorder2">

        {if !empty($theme.jumpRange)}
        <div id="gsPages" class="gbBlock gcBackground2 gbPager">
          {g->theme include="blocks/Pager.tpl"}
        </div>
        {/if}
        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbPagerButtons">
          {g->theme include="blocks/Navigator.tpl" navigator=$theme.navigator}
        </div>
        {/if}
        
        </div>
        {/if}
              </td>

              <td width="10">
              </td>
              <td>
                {if !empty($theme.item.title)}
                <h2> {$theme.item.title|markup} </h2>
                {/if}
                {if !empty($theme.item.description)}
                <p class="giDescription">
                  {$theme.item.description|markup}
                </p>
                {/if}
              </td>
              <td style="width: 200px;">
                {g->block type="core.ItemInfo"
                          item=$theme.item
                          showDate=true
                          showSize=true
                          showOwner=false
                          class="giInfo"}
              </td>
            </tr>
          </table>
        </div>

<table width="100%" cellspacing="0" cellpadding="0">

    <tr valign="top">
	<td width="220">
	<div id="dSidebar" class="gcBackground2 giInfo" style="margin:2px 0px;position:absolute; width: 220px; z-index:1000">
	    <div id="gsShowSidebar">
	    <a href='#' style='text-decoration:none'>- - show sidebar - -</a> 
	    </div>
	    <div id="gsHideSidebar">
	    <a href='#' style='text-decoration:none'>- - hide sidebar - -</a> 
	    </div>

	    {if !empty($theme.params.sidebarBlocks)}
	    {g->theme include="sidebar.tpl"}
	    {/if}

	</div>
	</td>
	<td>
	<div id="dSidebarBlank" class="giInfo gcBorder1 gcBackground2" style="margin:2px 0px 2px 2px;">
	&nbsp;
	</div>
	</td>
    </tr>
</table>

<script type="text/javascript">
{if $theme.params.roundedCorners}
    Nifty("div#dSidebar", "small transparent");
    Nifty("div#dSidebarBlank", "small transparent");
    Nifty("div#dNavigator", "small transparent");
    Nifty("div#dPageInfo", "small transparent");
{/if}
YAHOO.util.Event.onAvailable("gsHideSidebar", Debaser.hideElementById, "gsHideSidebar");
YAHOO.util.Event.addListener("gsShowSidebar", "click", Debaser.showSidebar, {if $theme.params.specialEffects}true{else}false{/if});
YAHOO.util.Event.addListener("gsHideSidebar", "click", Debaser.hideSidebar, {if $theme.params.specialEffects}true{else}false{/if});
</script>

<table width="100%" cellspacing="0" cellpadding="1">

  <tr valign="top">
    <td>
      <div id="gsContent" class="gcBorder1">


        {if !count($theme.children)}
        <div class="gbBlock giDescription gbEmptyAlbum">
          <h1 class="emptyAlbum">
	    {g->text text="This album is empty."}
	    {if isset($theme.permissions.core_addDataItem)}
	    <br/>
              <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
	    {/if}
          </h1>
        </div>
        {else}

        {assign var="childrenInColumnCount" value=0}
        <div class="gbBlock">
<center>
<br\><br\>
          <table id="gsThumbMatrix" width="10%">

	    <tr valign="top">
	      {assign var="colCount" value=`$theme.params.columns`}
	      {section name=col start=0 loop=`$colCount`}
		<td>
	        {assign var="childIndex" value=0}
                {foreach from=$theme.children item=child}
		{if $childIndex % $colCount == $smarty.section.col.index}  

<center>
<table width="10%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="gcBackground3">
    <div id="box_{$child.id}" 
	    class="dBox gcBackgroundItemImage {if $child.canContainChildren}giAlbumCell gcBackground1{else}giItemCell gcBackground2{/if}">
	<div id="box_{$child.id}_photo" class="dBoxPhoto" 
	    style="height:{$child.thumbnail.height}px;width:{$child.thumbnail.width}px;">
	    <div>
	    {if $child.canContainChildren}
	    {assign var=frameType value="albumFrame"}
	    {else}
	    {assign var=frameType value="itemFrame"}
	    {/if}
	    {if isset($theme.params.$frameType) && isset($child.thumbnail)}
	      {g->container type="imageframe.ImageFrame" frame=$theme.params.$frameType}
	      <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}"
		    >{g->image id="%ID%" item=$child image=$child.thumbnail class="%CLASS% giThumbnail"}</a>
	      {/g->container}
	    {elseif isset($child.thumbnail)}
	      <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}"
		    >{g->image item=$child image=$child.thumbnail class="giThumbnail"}</a>
	    {else}
	      <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}"
		    class="giMissingThumbnail"> {g->text text="no thumbnail"} </a>
	    {/if}
	    </div>
	    <div id="box_{$child.id}_drawer_info" style="width:{$child.thumbnail.width-10}px;"
		    class="dBoxDrawerInfo gcBackgroundItemImage {if $child.canContainChildren}gcBackground1{else}gcBackground2{/if}">
		{if !empty($child.title) && !preg_match('/^IMG_/', $child.title) && !$theme.params.showThumbTitles}
		<div class="giTitle">
		  {if $child.canContainChildren}
		  {g->text text="Album: %s" arg1=$child.title|markup}
		  {else}
		  {$child.title|markup}
		  {/if}
		</div>
		{/if}
		{if !empty($child.summary)  && !preg_match('/^IMG_/', $child.summary) }
		<div class="giDescription">
		  {$child.summary|markup|entitytruncate:256}
		</div>
		{/if}

		{if ($theme.item.canContainChildren && $theme.params.showAlbumOwner) ||
		    (!$theme.item.canContainChildren && $theme.params.showImageOwner)}
		{assign var="showOwner" value=true}
		{else}
		{assign var="showOwner" value=false}
		{/if}
		{g->block type="core.ItemInfo" item=$child showDate=true showOwner=$showOwner showSize=true
		      showViewCount=true showSummaries=true class="giInfo"}
		<hr size="1" width="90%">
	    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">[view item]</a>
	    {if count($child.itemLinks)>0}
	    <a id="box_{$child.id}_drawer_toolopen" href="#">[item options]</a>
	    {/if}
	    </div>
	    <div id="box_{$child.id}_drawer_tools" style="width:{$child.thumbnail.width-10}px;"
		    class="dBoxDrawerTools gcBackgroundItemImage {if $child.canContainChildren}gcBackground1{else}gcBackground2{/if}">
		{g->theme include="blocks/ItemLinks.tpl" item=$child links=$child.itemLinks useDropdown=false}
	    </div>
	</div>

	      {if !empty($child.title) && !preg_match('/^IMG_/', $child.title)  && $theme.params.showThumbTitles}
	      <div class="giTitle">
		{if $child.canContainChildren}
		{g->text text="%s" arg1=$child.title|markup}
		{else}
		{$child.title|markup}
		{/if}
	      </div>
	      {/if}
    </div>
</td>
</tr>
</table>
</center>
</div>

<script type="text/javascript">
YAHOO.util.Event.onAvailable("box_{$child.id}_photo", Debaser.initDrawer, {$child.id});
YAHOO.util.Event.addListener("box_{$child.id}", "mouseover", Debaser.infoDrawer, {$child.id});
YAHOO.util.Event.addListener("box_{$child.id}", "mouseout", Debaser.closeDrawers, {$child.id});
YAHOO.util.Event.addListener("box_{$child.id}_drawer_toolopen", "click", Debaser.toolsDrawer, {$child.id});
{if count($child.itemLinks)>0}
YAHOO.util.Event.addListener("box_{$child.id}_drawer_info", "click", Debaser.goToUrl, "{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}");
{/if}
{if $theme.params.roundedCorners}
    Nifty("div#box_{$child.id}", "small transparent");
{/if}
</script>
		{/if}
	        {assign var="childIndex" value=`$childIndex+1`}
		{/foreach}
		</td>
	      {/section}
 	    </tr>
            

{if count($theme.params.albumBlocks)>0 }
            <tr>
                <td  align="left" colspan="{$colCount}">
        {* Show any other album blocks (comments, etc) *}
        {foreach from=$theme.params.albumBlocks item=block}
        <div id="lower_block_box" class="gcBackground3" style="margin: 0px 0px;"><div style="padding: 4px; margin: 4px 0px;">
          {g->block type=$block.0 params=$block.1}
        </div></div>
        {/foreach}
<script type="text/javascript">
  <!--
//Rico.Corner.round('lower_block_box', {literal}{color:"transparent", compact: true, bgColor:"fromParent"}{/literal});
  //-->
</script>

                </td>
            </tr>
{/if}
          </table>
<br\><br\>
</center>
        </div>
        {/if}


        {* Our emergency edit link, if the user all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkAlbumBlocks=true}
      </div>
    </td>

  </tr>
</table>

