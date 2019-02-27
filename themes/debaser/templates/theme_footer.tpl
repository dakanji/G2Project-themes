{*
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}

<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="center">
            <div id="dFooter" class="dBarBox gcBackground2 gcBorder1" style="margin:0px 0px 2px 0px;">
	    {*g->logoButton type="validation"*}
	    {g->logoButton type="gallery2"}
	    {g->logoButton type="gallery2-version"}
            </div>
            </td>
            <td valign="top" width="210">
            <div id="dFooterRight" class="dBarBox gcBackground2 gcBorder1" style="margin:0px 0px 2px 2px;">
	    &nbsp;{g->block type="core.GuestPreview" class="gbBlock"}
            </div>
            </td>
        </tr>
</table>
<div id="dFooterBottom" class="gcBackground1">
&nbsp;
</div>

<script type="text/javascript">
{if $theme.params.roundedCorners}
  Nifty("div#dFooter,div#dFooterRight","same-height small");
  Nifty("div#dFooterBottom", "small transparent");
{else}
  Nifty("div#dFooter,div#dFooterRight","same-height none");
{/if}
</script>
