{*
 * $Revision: 1546 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div id="gsSidebar">
  {* Show the sidebar blocks chosen for this theme *}

  {foreach from=$theme.params.sidebarBlocks item=block}
    <div style="text-align:{if $block.0 == 'imageblock.ImageBlock'}center{else}left{/if}">
    {g->block type=$block.0 params=$block.1 class="gbBlock" }
    </div>
  {/foreach}
  {g->block type="core.NavigationLinks" class="gbBlock"}
</div>

