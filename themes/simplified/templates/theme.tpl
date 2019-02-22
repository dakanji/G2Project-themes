{*
 * $Revision: 996 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    {* Let Gallery print out anything it wants to put into the head element *}
    {g->head}

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
      <title>{$theme.item.title|default:$theme.item.pathComponent|markup:strip}</title>
    {/if}

    {if ($theme.pageType == 'album' || $theme.pageType == 'photo')}
      {if !empty($theme.item.keywords)}
        <meta name="keywords" content="{$theme.item.keywords|markup:strip}" />
      {/if}
      {if !empty($theme.item.description)}
        <meta name="description" content="{$theme.item.description|markup:strip}" />
      {/if}
    {/if}

    {* Include this theme's style sheet *}
    <link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}" />
    {if $theme.pageType == 'admin'}
      <link rel="stylesheet" type="text/css" href="{g->theme url="admin.css"}" />
    {/if}

    {if ($theme.pageType == 'album' || $theme.pageType == 'photo')}
      <script type="text/javascript" src="{g->url href="lib/yui/yahoo-min.js"}"></script>
      <script type="text/javascript" src="{g->url href="lib/yui/event-min.js"}"></script>
      <script type="text/javascript" src="{g->url href="lib/yui/dom-min.js"}"></script>
      <script type="text/javascript" src="{g->url href="lib/yui/dragdrop-min.js"}"></script>
      <script type="text/javascript" src="{g->url href="lib/yui/container-min.js"}"></script>
      <script type="text/javascript" src="{g->url href="lib/yui/animation-min.js"}"></script>
      <script type="text/javascript" src="{g->theme url="simplified.js"}"></script>

      <link rel="stylesheet" type="text/css" href="{g->theme url="container.css"}" />
    {/if}
  </head>
  <body class="gallery">
    <div {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we
       * don't draw a header, footer, navbar, etc.  Those views are responsible for
       * drawing everything.
       *}
      {if $theme.useFullScreen}
	{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {else}

      <div id="gsNavBar" class="gcBorder1">
        {if $theme.pageType == 'admin'}
	  <div id="gbHomeLink">
	    {g->block type="core.BreadCrumb"} 
	  </div>
	{/if}
	<div class="gbSystemLinks">
	  {g->block type="core.SystemLinks"
		    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		    othersAt=4}
	</div>
      </div>

      {if !empty($theme.params.sidebarBlocks) && $theme.pageType != 'admin' && $theme.pageType != 'progressbar'}
        {g->theme include="sidebar.tpl"}
      {/if}

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
