{*
 * $Revision: 847 $
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

    <style type="text/css">
	.content {ldelim} width: {$theme.params.contentWidth}px; {rdelim}
	{if !empty($theme.params.thumbnailSize)}
	  {assign var="thumbCellSize" value=$theme.params.thumbnailSize+30}
	  .gallery-thumb {ldelim} width: {$thumbCellSize}px; height: {$thumbCellSize}px; {rdelim}
	  .gallery-album {ldelim} height: {$thumbCellSize+30}px; {rdelim}
	{/if}
    </style>

    {* Add prototype javascript library *}
    <script type="text/javascript" src="{g->theme url="js/prototype.js"}"></script>

    {* Add Lightbox javascript and CSS *}
    <link rel="stylesheet" type="text/css" href="{g->theme url="lightbox.css"}"/>
    <script type="text/javascript" src="{g->theme url="js/lightbox.js"}"></script>
    <script type="text/javascript" src="{g->theme url="js/scriptaculous.js?load=effects"}"></script>
  </head>

  <body class="gallery">
    <div id="handle">
     <a href="#" onclick="Effect.toggle('shelf','blind'); return false"><img src="{g->theme url="images/bullet_toggle_plus.png"}" border="0"/></a>
    </div>

    <div id="shelf" style="display: none">
      <div class="gbSystemLinks">
	{g->block type="core.SystemLinks"
		  order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		  othersAt=4}
      </div>
    </div>

    <div {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we
       * don't draw a header, footer, navbar, etc.  Those views are responsible for
       * drawing everything.
       *}
      {if $theme.useFullScreen}
	{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {else}
      <div class="header"></div>
      <div class="content">
	<div class="breadcrumb">
	  {g->block type="core.BreadCrumb" skipRoot=true separator="/"}
	</div>

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

	<div class="footer">
	  {g->logoButton type="validation"}
	  {g->logoButton type="gallery2"}
	  {g->logoButton type="gallery2-version"}
          {g->logoButton type="donate"}
	</div>
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
