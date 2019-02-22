{*
 * $Revision: 16387 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}
      <div id="gsContent">
        <div class="gbBlock gcBackground1">
            <div style="float:left;width: 70%;">
                {if !empty($theme.item.title)}
                <h2>{$theme.item.title|markup|regex_replace:"/[0-9]/s":""|regex_replace:"/_x+$/":""|regex_replace:"/_/s":""} </h2>
                {/if}
                {if !empty($theme.item.description)}
                <p class="giDescription">
                    {$theme.item.description|markup}
                </p>
                {/if}
            </div>
            <div style="float:right;width: 30%;text-align:right;">
                {g->block type="core.ItemInfo"
                item=$theme.item
                showDate=true
                showOwner=$theme.params.showImageOwner
                class="giInfo"}
            </div>
            <br class="clear"/>
        </div>

        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbNavigator">
          {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
        </div>
        {/if}

        <div id="gsImageView" class="gbBlock" align="center">
            {if !empty($theme.imageViews)}
            {capture name="fallback"}
            <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`" forceFullUrl=true forceSessionId=true}">
                { g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
            </a>
            {/capture}
            {if $image.viewInline}
            {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback}
            {else}
            {g->text text="There is nothing to view for this item."}
            {/if}
            {/if}
        </div>
        <div class="gsContentDetail gcBorder1">
          <div class="gbNavigatorMicroThums">
            {g->theme include="navigatorMicroThumbs.tpl"}
          </div>
        </div>

	{if $theme.pageUrl.view != 'core.ShowItem' && $theme.params.dynamicLinks == 'jumplink'}
	<div class="gbBlock">
	  <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`"}">
	    {g->text text="View in original album"}
	  </a>
	</div>
	{/if}

        {* Download link for item in original format *}
        {if !empty($theme.sourceImage) && $theme.sourceImage.mimeType != $theme.item.mimeType}
        <div class="gbBlock">
          <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
            {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1}
          </a>
        </div>
        {/if}

        {* Show any other photo blocks (comments, exif etc) *}
        {foreach from=$theme.params.photoBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}

        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbNavigator">
          {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
        </div>
        {/if}

	{* Our emergency edit link, if the user removes all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="sidebar,photo"}
      </div>
<div class="clear">
    <!-- ClearFix -->
</div>
{if $user.isAdmin}
{if !empty($theme.params.sidebarBlocks)}
{g->theme include="sidebar.tpl"}
<script type="text/javascript">
 {* hide the sidebar if there's nothing in it *}
 // <![CDATA[
 var el = document.getElementById("gsSidebar");
 var text = el.innerText;  // IE
 if (!text) text = el.textContent; // Firefox
 if (!text || !text.match(/\S/)) el.style.display = 'none';
 // ]]>  
</script>
{/if}
{/if}