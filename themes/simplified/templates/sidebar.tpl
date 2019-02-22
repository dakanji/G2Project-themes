{*
 * $Revision: 1276 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<div id="gsSidebar" class="gcBackground2" style="display: none;">
  <div id="sidebarHeader" class="gcLinkStyle1">
    <a id="sidebarClose" href="#">X</a>
  </div>

  <div id="gsSidebarCol">
    <div id="gsSidebarSpacer">
      {if !empty($theme.imageViews)}
	{* Show photosizes select box/link *}
	{g->block type="core.PhotoSizes" class="gbBlock"}
      {/if}

      {* Show the sidebar blocks chosen for this theme *}
      {foreach from=$theme.params.sidebarBlocks item=block}
	{g->block type=$block.0 params=$block.1 class="gbBlock"}
      {/foreach}
    </div>
  </div>
</div>
