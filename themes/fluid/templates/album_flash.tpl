{*
 * $Revision: 525 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if count($theme.children)}
{capture assign="xmlUrl"}{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`"
				 arg3="showxml=album" forceFullUrl=true}{/capture}
<object type="application/x-shockwave-flash"
	data="{g->theme url="fluid.lzx.swf"}?{$xmlUrl}" width="100%" height="550">
    <param name="movie" value="{g->theme url="fluid.lzx.swf"}?{$xmlUrl}" />
    <param name="quality" value="high" />
    <param name="scale" value="noscale" />
    <param name="salign" value="LT" />
    <param name="menu" value="false" />
</object>
{/if}

<table width="100%" cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td>
      <div id="gsContent" class="gcBorder1">

	{if !count($theme.children)}
	<div class="gbBlock giDescription gbEmptyAlbum">
	  <h3 class="emptyAlbum">
	    {g->text text="This album is empty."}
	    {if isset($theme.permissions.core_addDataItem)}
	    <br/>
	      <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd"
			arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
	    {/if}
	  </h3>
	</div>
	{/if}

	{g->block type="core.GuestPreview" class="gbBlock"}

	{* Our emergency edit link, if the user all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock"
		  checkSidebarBlocks=true checkAlbumBlocks=true}
      </div>
    </td>
  </tr>
</table>
