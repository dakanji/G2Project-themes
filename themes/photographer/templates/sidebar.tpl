{*
 * $Revision: 17075 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}

<div id="gsSidebar">
    <ul style="margin:0;list-style: none;">
        {* Show the sidebar blocks chosen for this theme *}
        {assign var=a value=100}
        {foreach from=$theme.params.sidebarBlocks item=block}
        <li style="float:left;display:block;width:{math equation="a / b" a=$a b=$theme.params.sidebarBlocks|@count}%;min-width:200px;">
        {g->block type=$block.0 params=$block.1 class="gbBlock"}
        </li>
        {/foreach}
    </ul>
</div>