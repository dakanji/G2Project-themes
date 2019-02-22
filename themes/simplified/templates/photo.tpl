{*
 * $Revision: 996 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}

{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

<table cellspacing="0" cellpadding="0" border="0" id="gsItemContainer">
  <tr>
    <td id="gsHeader" class="gcLinkStyle1"
        style="width: {if $image.width < 640}640px{else}{$image.width}px{/if};">
      <div class="gbBreadCrumb">
        {g->block type="core.BreadCrumb"}
      </div>
      <div id="gbShowSidebar">
        <a id="showSidebarLink" href="#">
	  {g->text text="Show Sidebar"}
	</a>
      </div>
    </td>
  </tr>

  <tr>
    <td id="gsImageContainer" class="gcBackground1"
        style="width: {if $image.width < 640}640px{else}{$image.width}px{/if}; {if $image.height == 0}height: 150px;{/if}">
      <div id="gsImageView">
        {if !empty($theme.imageViews)}
	  {capture name="fallback"}
	  <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"
	                   forceFullUrl=true forceSessionId=true}"
	     id="downloadItem">
	    {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
	  </a>
	  {/capture}

	  {if ($image.viewInline)}
	    {if (count($theme.imageViews) > 1) && !empty($image.width)}
	      {assign var="nextLargestWidth" value=2147483647}
	      {assign var="nextLargestIndex" value=$theme.imageViewsIndex}
	      {section name=largerImage loop=$theme.imageViews}
		{if !empty($theme.imageViews[largerImage].width)}
		  {if ($theme.imageViews[largerImage].width > $image.width) &&
		      ($theme.imageViews[largerImage].width < $nextLargestWidth)}
		    {assign var="nextLargestWidth" value=$theme.imageViews[largerImage].width}
		    {assign var="nextLargestIndex" value=$smarty.section.largerImage.index}
		  {/if}
		{/if}
	      {/section}
	    {/if}

	    {if isset($nextLargestIndex) && ($nextLargestIndex != $theme.imageViewsIndex)}
	      <a href="{g->url params=$theme.pageUrl arg1="itemId=`$theme.item.id`"
	       arg2="imageViewsIndex=`$nextLargestIndex`"}">
		{g->image item=$theme.item image=$image fallback=$smarty.capture.fallback}
	      </a>
	    {else}
	      {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback}
	    {/if}
	  {else}
	    {$smarty.capture.fallback}
	  {/if}
	{else}
          {g->text text="There is nothing to view for this item."}
	{/if}
      </div>
    </td>
  </tr>

  <tr>
    <td id="gsFooter" style="width: {if $image.width < 640}640px{else}{$image.width}px{/if};">
      <div id="giDescription" class="gcLinkStyle1">
        {if !empty($theme.item.description)}
          {$theme.item.description|markup}
        {elseif !empty($theme.item.summary)}
          {$theme.item.summary|markup}
	{else}
	  &nbsp;
        {/if}
      </div>

      {if !empty($theme.navigator)}
	<div id="gbNavigator" class="gcLinkStyle1">
	  {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
	</div>
      {/if}
    </td>
  </tr>

  {if count($theme.params.photoBlocks)}
    <tr>
      <td id="gsBottomBlock">
	{* Show any other photo blocks (comments, exif etc) *}
	{foreach from=$theme.params.photoBlocks item=block}
	  {g->block type=$block.0 params=$block.1}
	{/foreach}
      </td>
    </tr>
  {/if}

</table>
