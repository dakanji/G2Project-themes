{*
 * $Revision: 1028 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}
<table width="100%" cellspacing="0" cellpadding="0">
  <tr valign="top">
    {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {g->theme include="sidebar.tpl"}
    </td>
    {/if}
    <td>

      <div id="gsContent">

        {g->block type="core.GuestPreview" class="gbBlock"}

        {* Our emergency edit link, if the user all blocks containing edit links *}
	       {g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkAlbumBlocks=true}

        {* Item Description *}
        {if !empty($theme.item.description)}
        <div id="photo-info">
          <div class="gallery-content">
            <div class="giDescription gcBackground2">
              {$theme.item.description|markup}
            </div>
          </div>
        </div>
        {/if}


        {* Start - Show Full Size Image in popup window - Great for panoramas *}
        {if !empty($theme.sourceImage) && ($theme.params.fullsizepopup)}
        <div class="giFull-size">
        <a href="javascript:void(0);" onclick="window.open('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}','viewWindow','width={$theme.sourceImage.width+40}, height={$theme.sourceImage.height+40}, resizable=yes, scrollbars=yes' );">
         {g->text text="View Larger Image"}
        </a>
        </div>
        {/if}
        {* End - Show Full Size Image in popup window *}


        <div id="gsImageView" class="gbBlock">
          {if !empty($theme.imageViews)}
	    {capture name="fallback"}
	    <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
	      {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
	    </a>
	    {/capture}

	    {if ($image.viewInline)}
	      <div class="gallery-photo">
  	      {if $theme.params.enableImageMap}{strip}
  	{if isset($theme.navigator.back)}
  	  <a href="{g->url params=$theme.navigator.back.urlParams}"
  	     id="prevArrow" style="position: absolute; margin: 30px 0 0 20px; visibility: hidden"
  	     onmouseover="document.getElementById('prevArrow').style.visibility='visible'"
  	     onmouseout="document.getElementById('prevArrow').style.visibility='hidden'"
  	  ><img src="{g->theme url="images/arrow-left.gif"}" alt="" width="32" height="32"
  	  /></a>{/if}
  	{g->image item=$theme.item image=$image class="gallery-photo"
  	    fallback=$smarty.capture.fallback usemap=#prevnext}
  	{if isset($theme.navigator.next)}
  	  <a href="{g->url params=$theme.navigator.next.urlParams}"
  	     id="nextArrow" style="position:absolute; margin: 30px 0 0 -50px; visibility: hidden"
  	     onmouseover="document.getElementById('nextArrow').style.visibility='visible'"
  	     onmouseout="document.getElementById('nextArrow').style.visibility='hidden'"
  	   ><img src="{g->theme url="images/arrow-right.gif"}" alt="" width="32" height="32"
  	   /></a>{/if}
        {/strip}{else}
          {g->image item=$theme.item image=$image class="gallery-photo"
  	 fallback=$smarty.capture.fallback}
        {/if}
	    {/if}</div>
          {else}
            {g->text text="There is nothing to view for this item."}
          {/if}
        </div>


      {* Navigation image map *}
      {if $theme.params.enableImageMap && !empty($image.width) && !empty($image.height)}
      <map id="prevnext" name="prevnext">
      {if isset($theme.navigator.back)}
        <area shape="rect" coords="0,0,{math equation="round(x/2-1)" x=$image.width},{$image.height}"
         href="{g->url params=$theme.navigator.back.urlParams}"
         alt="{$theme.item.title|default:$theme.item.pathComponent|markup:strip}"
         onmouseover="document.getElementById('prevArrow').style.visibility='visible'"
         onmouseout="document.getElementById('prevArrow').style.visibility='hidden'"/>
      {/if}
      {if isset($theme.navigator.next)}
        <area shape="rect" coords="{math equation="round(x/2)"
      				   x=$image.width},0,{$image.width},{$image.height}"
         href="{g->url params=$theme.navigator.next.urlParams}"
         alt="{$theme.item.title|default:$theme.item.pathComponent|markup:strip}"
         onmouseover="document.getElementById('nextArrow').style.visibility='visible'"
         onmouseout="document.getElementById('nextArrow').style.visibility='hidden'"/>
      {/if}
      </map>
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


        {* Navigator *}
        {if !empty($theme.navigator)}
          <div class="block-core-Navigator-wrapper gcBorder2">
          {g->callback type="core.LoadPeers" item=$theme.item windowSize=1}
          {g->block type="core.Navigator" navigator=$theme.navigator prefix="&laquo; " suffix=" &raquo;"
              currentItem=$block.core.LoadPeers.thisPeerIndex totalItems=$block.core.LoadPeers.peerCount}
          </div>
        {/if}

        <div class="gbSystemLinks gcBorder2">
          <span class="giDescription-id">{g->text text="Item ID: "}{$theme.item.pathComponent|markup:strip}</span>
          {g->block type="core.SystemLinks"
		    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		    othersAt=4}
        </div>


        {* Start - Show Micro Thumnails In Latest Images Block *}
        {if $theme.params.LatestImagesAlbum}
        {g->callback type="core.LoadPeers" item=$item|default:$theme.item
	       windowSize=$windowSize|default:$theme.params.maxThumbnails addEnds=false loadThumbnails=true}

        {assign var="data" value=$block.core.LoadPeers}

        {if !empty($data.peers)}
        <fieldset id="micro-navigation-wrapper" class="gcBorder2">
        <legend class="gcBackground2 gcBorder2">
        <a href="{g->url params=$theme.pageUrl arg1="itemId=`$theme.parent.id`"}">{$theme.parent.title|markup }</a>
        {g->text text=" - Preview"}</legend>
        <div id="micro-navigation">
          {assign var="lastIndex" value=0}
          {assign var="columnIndex" value=0}
            {foreach from=$data.peers item=peer}
              {assign var="title" value=$peer.title|default:$peer.pathComponent}
              {if ($peer.peerIndex == $data.thisPeerIndex)&& !empty($peer.thumbnail)}
                  <span id="current-image">{g->image item=$peer image=$peer.thumbnail maxSize=$theme.params.sizeThumbnails title="$title"}</span>
              {else}
                  {if !empty($peer.thumbnail)}
                  <a href="{g->url params=$theme.pageUrl arg1="itemId=`$peer.id`"}">
                   {g->image item=$peer image=$peer.thumbnail maxSize=$theme.params.sizeThumbnails title="$title"}
                  </a>
                  {/if}
              {/if}
              {assign var="lastIndex" value=$peer.peerIndex}
            {/foreach}
        </div></fieldset>
        {/if}
        {/if}


      </div>
    </td>
  </tr>
</table>
