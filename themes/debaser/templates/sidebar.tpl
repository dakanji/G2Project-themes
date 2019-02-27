{*
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div id="gsSidebar" style="height:0px;" class="giInfo XXgcBackground1">
    <div id="gsSidebarInner" style="position:relative; top: -1000px;">
      {* Show the sidebar blocks chosen for this theme *}
      {foreach from=$theme.params.sidebarBlocks item=block}
	{g->block type=$block.0 params=$block.1 class="gbBlock"}
      {/foreach}
    </div>
</div>

