{*
 * $Revision: 16727 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7 gallery" lang="{g->language}"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 gallery" lang="{g->language}"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 gallery" lang="{g->language}"> <![endif]-->
<!--[if gt IE 8]><!--><html class="no-js gallery" lang="{g->language}"> <!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
      <title>{$theme.item.title|markup:strip|default:$theme.item.pathComponent}</title>
    {/if}

    {* Include this theme's style sheet *}
    <link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}"/>
  </head>
  <body>
      <div id="gsHeader">
          <a href="{g->url}">
              <img src="{g->url href="images/galleryLogo_sm.gif"}" width="107" height="48" alt=""/>
          </a>
      </div>
      <div id="gsNavBar" class="gcBorder1">
          <div class="gbSystemLinks">
              {g->block type="core.SystemLinks" order="core.SiteAdmin core.YourAccount core.Login core.Logout" othersAt=4}
          </div>
          <div class="gbBreadCrumb">
              {g->block type="core.BreadCrumb"}
          </div>
      </div>
      <div id="gallery">
          {*
          * Some module views (eg slideshow) want the full screen.  So for those, we don't draw
          * a header, footer, navbar, etc.  Those views are responsible for drawing everything.
          *}
          {if $theme.useFullScreen}
              {include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
              {elseif $theme.pageType == 'progressbar'}
              {*
              * Dress up the progressbar view
              *}
              {g->theme include="progressbar.tpl"}
              <div id="gsHeader">
                  <img src="{g->url href="images/galleryLogo_sm.gif"}" width="107" height="48" alt=""/>
              </div>
              {else}
              <div>
                  {* Include the appropriate content type for the page we want to draw. *}
                  {if $theme.pageType == 'album'}
                  {g->theme include="album.tpl"}
                  {elseif $theme.pageType == 'photo'}
                  {g->theme include="photo.tpl"}
                  {elseif $theme.pageType == 'admin'}
                  {g->theme include="admin.tpl"}
                  {elseif $theme.pageType == 'module'}
                  {g->theme include="module.tpl"}
                  {/if}
              </div>
              <div id="gsFooter">
                  {g->logoButton type="validation"}
                  {g->logoButton type="gallery2"}
                  {g->logoButton type="gallery2-version"}
                  {g->logoButton type="donate"}
              </div>
          {/if}  {* end of full screen check *}
          {*
          * Give Gallery a chance to output any cleanup code, like javascript that needs to be run 
          * at the end of the <body> tag.  If you take this out, some code won't work properly.
          *}
          {g->trailer}
          {* Put any debugging output here, if debugging is enabled *}
          {g->debug}
      </div>
  </body>
</html>
