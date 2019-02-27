{*
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if isset($reverseOrder) && $reverseOrder}
  {assign var="order" value="next current previous"}
{else}
  {assign var="order" value="previous current next"}
{/if}
{assign var="prefix" value=$prefix|default:""}
{assign var="suffix" value=$suffix|default:""}
{*
 * The strip calls in this tpl are to avoid a safari bug where padding-right is lost
 * in floated containers for elements that have whitespace before the closing tag.
 *}
<table id="gbNavigatorTable" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
{foreach from=$order|split item="which"}
{if $which=="next"}
  <td class="right">
    {strip}
    {if isset($navigator.next)}
    <a href="{g->url params=$navigator.next.urlParams}" class="next gcBorder2 gcBackground1">
      {g->text text="next"}{$suffix}
      {if isset($navigator.next.thumbnail)}
	{g->image item=$navigator.next.item image=$navigator.next.thumbnail
		  maxSize=40 class="next"}
      {/if}
    </a>
    {/if}
    {/strip}
  </td>
{elseif $which=="current"}
  {if (isset($currentPage) && isset($totalPages)) || (isset($currentItem) && isset($totalItems))}
  <td class="center">
    {if isset($currentPage)}
      {g->text text="Page %d of %d" arg1=$currentPage arg2=$totalPages}
    {else}
      {if isset($currentItem)}
	{g->text text="%d of %d" arg1=$currentItem arg2=$totalItems}
      {/if}
    {/if}
  </td>
  {/if}
{else}
  <td class="left">
    {strip}
    {if isset($navigator.back)}
    <a href="{g->url params=$navigator.back.urlParams}" class="previous gcBorder2">
      {if isset($navigator.back.thumbnail)}
	{g->image item=$navigator.back.item image=$navigator.back.thumbnail
		  maxSize="40" class="previous"}
      {/if}
      {$prefix}{g->text text="prev"}
    </a>
    {/if}
    {/strip}
  </td>
{/if}
{/foreach}
</tr>
</table>
