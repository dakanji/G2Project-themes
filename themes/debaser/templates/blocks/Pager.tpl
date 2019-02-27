{*
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="{$class}">
  {g->text text="Page:"}
  {assign var="lastPage" value=0}
  {foreach name=jumpRange from=$theme.jumpRange item=page}
  {if ($page - $lastPage >= 2)}
    {if ($page - $lastPage == 1)}
    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`" arg3="page=`$page-1`"}">{$page-1}</a>
    {else}
    ...
    {/if}
  {/if}

    {if ($theme.currentPage == $page)}
    <span class="gbPagerCurrent gcBackground1 gcBorder2">{$page}</span>
    {else}
    <a class="gcBorder2" href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`" arg3="page=$page"}">{$page}</a>
    {/if}
  {assign var="lastPage" value=$page}
  {/foreach}
</div>

