{
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

        <div id="dPageInfo" class="gbBlock gcBackground1">
          <table width="100%">
            <tr valign="top">
              <td style="width: 200px;">
        {if !empty($theme.jumpRange)}
        <div id="gsPages" class="gbBlock gcBackground2 gbPager">
          {g->theme include="blocks/Pager.tpl"}
        </div>
        {/if}
        {if !empty($theme.navigator)}
        <div id="dNavigator" class="gbBlock gcBackground2 gbNavigator gcBorder2">
          {g->theme include="blocks/Navigator.tpl" navigator=$theme.navigator}
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
                {g->block type="core.ItemInfo" item=$theme.item showDate=true showOwner=true class="giInfo"}
                {g->block type="core.PhotoSizes" class="giInfo" }
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
        <div style="text-align: center;" id="gsImageView" class="gbBlock">
<center>
<br />
        <table width="10%">
        <tr valign="top">
        <td class="gcBackground3">

          <div id="photo_box" class="gcBackground2">
          <div id="photo_inner_box" style="padding: 5px;">
          {if !empty($theme.imageViews)}
	    {capture name="fallback"}
	    <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
	      {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
	    </a>
	    {/capture}

	    {if ($image.viewInline)}
	      {if isset($theme.photoFrame)}
		{g->container type="imageframe.ImageFrame" frame=$theme.photoFrame}
		  {g->image id="%ID%" item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%"}
		{/g->container}
	      {else}
		{g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="giThumbnail"}
	      {/if}
	    {else}
	      {$smarty.capture.fallback}
	    {/if}
          {else}
            {g->text text="There is nothing to view for this item."}
          {/if}
        
        {* Download link for item in original format *}
        {if !empty($theme.sourceImage) && $theme.sourceImage.mimeType != $theme.item.mimeType}
        <div class="gbBlock">
          <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
            {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1}
          </a>
        </div>
        {/if}

        <div id="item_drawer" style="padding: 2px;" class="gcBackground2">
        <a href="#" onClick='Debaser.toggleDrawer("item_drawer_hidden", "item_drawer"); return false;'>[-]</a>
        {* Show any other photo blocks (comments, exif etc) *}
        {foreach from=$theme.params.photoBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {foreachelse}
          no extra photo properties.
        {/foreach}
        </div>
        <div id="item_drawer_hidden" style="padding: 2px;" class="gcBackground2">
        <a href="#" onClick='Debaser.toggleDrawer("item_drawer", "item_drawer_hidden"); return false;'>[+]</a>
        </div>

        </div>
        </div>

<script type="text/javascript">
  <!--
{if $theme.params.specialEffects}
//Debaser.fadeIn('photo_inner_box', true);
{/if}
{if $theme.params.roundedCorners}
    Nifty("div#photo_box", "small transparent");
{/if}
  Debaser.hideElementById('item_drawer');
  //-->
</script>
        </td>
        </tr>
        </table>

</center>

        </div>

        {* Our emergency edit link, if the user all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkPhotoBlocks=true}
      </div>
    </td>

  </tr>
</table>
