{*
 * $Revision: 1011 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<table width="100%" cellspacing="0" cellpadding="0">
  <tr valign="top">
    {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {g->theme include="sidebar.tpl"}
    </td>
    {/if}
    <td>

        {g->block type="core.GuestPreview" class="gbBlock gcBorder2"}

        {* Start - Our emergency edit link, if the user all blocks containing edit links *}
	       {g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkAlbumBlocks=true}
        {* End - Our emergency edit link, if the user all blocks containing edit links *}


        {* Start - Album Description *}
        {if !empty($theme.item.description)}
        <div id="photo-info">
          <div class="gallery-content">
            <div class="giDescription gcBackground2">
              {$theme.item.description|markup} 
                {if isset($theme.pageUrl.keyword)}
                  {g->text text=" - "} <span class="keyword">{$theme.pageUrl.keyword}</span>
                {/if}
            </div>
          </div>
        </div>
        {/if}
        {* End - Album Description *}


        {if !count($theme.children)}
        <div class="gbBlock giDescription gbEmptyAlbum">
          <h3 class="emptyAlbum">
	    {g->text text="This album is empty."}
	    {if isset($theme.permissions.core_addDataItem)}
	    <br/>
              <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
	    {/if}
          </h3>
        </div>
        {else}

        {assign var="childrenInColumnCount" value=0}
        <div class="gbBlock">
          <table id="gsThumbMatrix" width="100%">
            <tr valign="top">
              {foreach from=$theme.children item=child}

              {* Move to a new row *}
              {if ($childrenInColumnCount == $theme.params.columns)}
            </tr>
            <tr valign="top">
              {assign var="childrenInColumnCount" value=0}
              {/if}

              {assign var=childrenInColumnCount value="`$childrenInColumnCount+1`"}
              <td class="{if $child.canContainChildren}giAlbumCell gcBackground3{else}giItemCell{/if}"
                  style="width: {$theme.columnWidthPct}%">
                <div class="gallery-thumb">
                  {if isset($child.thumbnail)}
		    <a href="{g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}">
		      {g->image item=$child image=$child.thumbnail class="giThumbnail"}
		    </a>
                  {else}
		    <a href="{g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}"
                       class="giMissingThumbnail">
		      {g->text text="no thumbnail"}
		    </a>
                  {/if}
                </div>

                {g->block type="core.ItemLinks" item=$child links=$child.itemLinks}

                {if !empty($child.title) && ($child.canContainChildren || $theme.params.showSummaries)}
                <div class="giTitle">
                  {$child.title|markup}
                </div>
                {/if}

		{if !empty($child.summary) && $theme.params.showSummaries}
		<p class="giDescription">
		  {$child.summary|markup|entitytruncate:256}
		</p>
		{/if}

                {if ($theme.item.canContainChildren && $theme.params.showAlbumOwner) ||
                    (!$theme.item.canContainChildren && $theme.params.showImageOwner)}
                {assign var="showOwner" value=true}
                {else}
                {assign var="showOwner" value=false}
                {/if}

                {if ($theme.params.ItemViewCount)}
                  {* Show the view count for Items only - Not Albums *}
                  {* Assign showViewCount=$showViewCount - below *}
                  {if ($child.canContainChildren)}
                  {assign var="showViewCount" value=false}
                  {else}
                  {assign var="showViewCount" value=true}
                  {/if}
                {/if}

                {g->block type="core.ItemInfo"
			  item=$child
			  showSize=true
			  showDate=false
			  showOwner=$showOwner
			  showViewCount=$showViewCount
			  showSummaries=$theme.params.showSummaries
			  class="giInfo"}
              </td>
              {/foreach}

              {* flush the rest of the row with empty cells *}
              {section name="flush" start=$childrenInColumnCount loop=$theme.params.columns}
              <td>&nbsp;</td>
              {/section}
            </tr>
          </table>
        </div>
        {/if}

        {* Navigator *}
        {if $theme.totalPages > 1}
        <div class="block-core-Navigator-wrapper gcBorder2">
        {g->block type="core.Navigator" navigator=$theme.navigator prefix="&laquo; " suffix=" &raquo;"
		  currentPage=$theme.currentPage totalPages=$theme.totalPages}
        </div>
        {/if}
        
        {if !empty($theme.jumpRange) && $theme.params.showCorePager}
        <div id="gsPages" class="gbBlock gcBackground1">
          {g->block type="core.Pager"}
        </div>
        {/if}


        <div class="gbSystemLinks gcBorder2">
          {g->block type="core.ItemInfo"
                          item=$theme.item
                          showDate=false
                          showSize=true
                          showOwner=false
                          showViewCount=true
                          class="giInfo"}
                {* Show any other album blocks (comments, etc) *}
        {foreach from=$theme.params.albumBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}

          {g->block type="core.SystemLinks"
		    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		    othersAt=4}
        </div>


    </td>
  </tr>
</table>
