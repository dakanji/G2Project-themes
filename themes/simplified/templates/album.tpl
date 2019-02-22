{*
 * $Revision: 996 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}

<div id="itemHover" class="gcBackground2">
	<div class="hd"></div><div class="bd"></div>
</div>
<table cellspacing="0" cellpadding="0" border="0" id="gsItemContainer">
  <tr>
    <td id="gsHeader" class="gcLinkStyle1">
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
    <td>
      {assign var="childrenInColumnCount" value=0}
      {assign var="currentRow" value=1}
      {assign var="childrenCount" value=0}
      <table id="gsThumbMatrix" class="gcBackground1">
        <tr>
          {foreach from=$theme.children item=child}


          {if ($childrenInColumnCount == $theme.params.columns)}
            </tr>
            <tr>
            {assign var="childrenInColumnCount" value=0}
	    {assign var="currentRow" value="`$currentRow+1`"}
          {/if}
	  {assign var=childrenInColumnCount value="`$childrenInColumnCount+1`"}
	  {assign var=childrenCount value="`$childrenCount+1`"}


	  {if $child.canContainChildren && !empty($child.title)}
	    {capture name=album}{g->text text="Album: %s" arg1=$child.title}{/capture}
	    {assign var=tooltipTitle value="`$smarty.capture.album`"|markup}
	  {elseif $child.canContainChildren && empty($child.title)}
	    {capture name=album}{g->text text="Album"}{/capture}
	    {assign var=tooltipTitle value="`$smarty.capture.album`"|markup}
	  {elseif !empty($child.title)}
	    {assign var=tooltipTitle value="`$child.title`"|markup}
	  {elseif !empty($child.pathComponent)}
	    {assign var=tooltipTitle value="`$child.pathComponent`"|markup}
	  {else}
	    {assign var=tooltipTitle value=""}
	  {/if}

	  {if !empty($child.summary)}
	    {assign var=tooltipText value="`$child.summary`"|markup}
	  {else}
	    {assign var=tooltipText value=""}
	  {/if}

	  {if ($child.canContainChildren && $theme.params.showAlbumOwner) ||
	      (!$child.canContainChildren && $theme.params.showImageOwner)}
	    {assign var="showOwner" value=true}
	  {else}
	    {assign var="showOwner" value=false}
	  {/if}

	  {capture name=itemInfo}
	  {g->block type="core.ItemInfo" item=$child showDate=true showOwner=$showOwner showSize=true showViewCount=true showSummaries=true class="giInfo"}
	  {/capture}
	  {assign var=tooltipText value="`$tooltipText` `$smarty.capture.itemInfo`"|replace:'"':'\''}
	  <td class="itemContainer" style="width: {$theme.params.albumThumbnailSize}px;">
	  <table>
	  <tr>
            <td id="simplifiedHover_{$childrenCount}" class="{if $child.canContainChildren}giAlbumCell{else}giItemCell{/if} simplifiedHover">
	      <script type="text/javascript">
	        /* <![CDATA[ */
		addHoverDataMap({$childrenCount}, '{$tooltipTitle|escape:"javascript"}', '{$tooltipText|escape:"javascript"}');
		/* ]]> */
	      </script>
	      {if isset($child.thumbnail)}
	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">
		  {if isset($child.maxAlbumThumbSize)}
		    {g->image item=$child image=$child.thumbnail class="giThumbnail" maxSize=$child.maxAlbumThumbSize}
		  {else}
		    {g->image item=$child image=$child.thumbnail class="giThumbnail"}
		  {/if}
	        </a>
	      {else}
	        <div class="giNoThumbnailAlbum" style="width: {$theme.params.albumThumbnailSize-24}px; height: {$theme.params.maxRowSizes[$currentRow]-24}px;">
		  <table>
		  <tr>
		  <td>
	            <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">
	              {g->text text="no thumbnail"}
	            </a>
		  </td>
		  </tr>
		  </table>
		</div>
	      {/if}
            </td>
	  </tr>
	  </table>

	  {if $child.canContainChildren && !empty($child.title)}
	    <table>
	    <tr>
	      <td class="itemDescription" style="width: {$theme.params.albumThumbnailSize}px;">
	        {$child.title}
	      </td>
	    </tr>
	    </table>
	  {/if}
	  
	  </td>
	  {/foreach}

	  {section name="flush" start=$childrenInColumnCount loop=$theme.params.columns}
	  <td style="width: {$theme.params.albumThumbnailSize}px; height: {$theme.params.maxRowSizes[$currentRow]}px;">&nbsp;</td>
	  {/section}
        </tr>
      </table>
    </td>
  </tr>

  <tr>
    <td id="gsFooter">
      <div id="giDescription">
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

  {if count($theme.params.albumBlocks)}
    <tr>
      <td id="gsBottomBlock">
        {* Show any other photo blocks (comments, exif etc) *}
        {foreach from=$theme.params.albumBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}
      </td>
    </tr>
  {/if}

</table>
