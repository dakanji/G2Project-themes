{*
 * $Revision: 908 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
      <title>{$theme.item.title|default:$theme.item.pathComponent|markup:strip}</title>
    {/if}

    {* Include this theme's style sheet *}
    <link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}"/>
    <link rel="stylesheet" type="text/css" href="{g->theme url="jslibs/NiftyCube/niftyCorners.css"}"/>

    {* Include this theme's javascript *}
    <script src="{g->theme url="../../lib/yui/yahoo-min.js"}"> </script>
    <script src="{g->theme url="../../lib/yui/dom-min.js"}"> </script>
    <script src="{g->theme url="../../lib/yui/event-min.js"}"> </script>
    <script src="{g->theme url="../../lib/yui/animation-min.js"}"> </script>
    <script src="{g->theme url="jslibs/NiftyCube/niftycube.js"}"> </script>
    <script src="{g->theme url="theme.js"}"> </script>

</script>

<style type="text/css">
<!--
{if $theme.params.backgroundImage}
.gcBackground3 {literal}{background-color:transparent !important;{/literal}}
.gcBackgroundImage {literal}{
    background-position: 0px 0px;
    background-repeat: no-repeat;
    background-image: url({/literal}{$theme.params.backgroundImage}{literal}) !important;
}{/literal}
{/if}
{if $theme.params.backgroundItemImage}
.gcBackgroundItemImage {literal}{
    background-position: 0px 0px;
    background-repeat: no-repeat;
    background-image: url({/literal}{$theme.params.backgroundItemImage}{literal}) !important;
}{/literal}
{/if}
//-->
</style>

</head>
<body class="gallery gcBackgroundImage">
    <div id="gallery" class="gcBackgroundImage" {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we
       * don't draw a header, footer, navbar, etc.  Those views are responsible for
       * drawing everything.
       *}
      {if $theme.useFullScreen}
	{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {else}
      <div id="gsHeader">
        {if $theme.params.htmlHeaderBlock}
        {$theme.params.htmlHeaderBlock}
        {else}
        {g->theme include="theme_header.tpl"}
        {/if}
      </div>

      <div id="gsNavBar" class="">
	<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
	    <td>
	    <div id="dBreadcrumb" class="dBarBox gbBreadCrumb gcBackground2 gcBorder1" style="margin:2px 0px;">
	      {g->block type="core.BreadCrumb"}
	    </div>
	    </td>
	    <td valign="top" width="220">
	    <div id="dSystemLinks" class="dBarBox gbSystemLinks gcBackground2 gcBorder1" style="margin:2px 0px 2px 2px;">
	      {g->block type="core.SystemLinks" order="core.SiteAdmin core.YourAccount core.Login core.Logout" othersAt=4}
	    </div>
	    </td>
	</tr>
	</table>

      </div>
<script type="text/javascript">
{if $theme.params.roundedCorners}
  Nifty("div#dBreadcrumb,#dSystemLinks", "same-height small");
{else}
  Nifty("div#dBreadcrumb,#dSystemLinks", "same-height none");
{/if}
</script>

      {* Include the appropriate content type for the page we want to draw. *}
      {if $theme.pageType == 'album'}
        {g->theme include="album.tpl"}
      {elseif $theme.pageType == 'photo'}
        {g->theme include="photo.tpl"}
      {elseif $theme.pageType == 'admin'}
        {g->theme include="admin.tpl"}
      {elseif $theme.pageType == 'module'}
        {g->theme include="module.tpl"}
      {elseif $theme.pageType == 'progressbar'}
        {g->theme include="progressbar.tpl"}
      {/if}

      <div id="gsFooter">
        {if $theme.params.htmlFooterBlock}
        {$theme.params.htmlFooterBlock}
        {else}
        {g->theme include="theme_footer.tpl"}
        {/if}
      </div>
      {/if}  {* end of full screen check *}
    </div>

    {*
     * Give Gallery a chance to output any cleanup code, like javascript that
     * needs to be run at the end of the <body> tag.  If you take this out, some
     * code won't work properly.
     *}
    {g->trailer}

    {* Put any debugging output here, if debugging is enabled *}
    {g->debug}
  </body>
</html>
