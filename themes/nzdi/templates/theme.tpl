{*
 * $Revision: 1197 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
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
       
    {* Make page meta data description the same as the Item Description *}
    {if !empty($theme.item.description)}
      <meta name="description" content="{$theme.item.description|markup:strip}">              
    {/if}
    
    {* Include this theme's style sheet *}
    <link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}"/>
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
      {* <div id="gsHeader">
        <img src="{g->url href="images/galleryLogo_sm.gif"}" width="107" height="48" alt=""/>
      </div> *}

      {if $theme.params.GalleryBreadcrumbs}
      <div id="gsNavBar" class="gcBorder1">
        {*
        <div class="gbSystemLinks">
          {g->block type="core.SystemLinks"
		    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		    othersAt=4}
        </div> *}

        <div class="gbBreadCrumb">
          {g->block type="core.BreadCrumb"}
        </div>
      </div>
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

      {if $theme.params.showFooter}
      <div id="gsFooter" class="gcBackground2">
        {* g->logoButton type="validation" *}
        {g->logoButton type="gallery2"}
        {* g->logoButton type="gallery2-version" *}
        {g->logoButton type="donate"}
        {if $user.isAdmin}
          <a href="http://g2-sites.com/nzdi-gallery-theme"><img src="{g->url href="themes/nzdi/images/nzdi.gif"}" alt="NZDI Theme - Version {$theme.params._version}" title="NZDI Theme - Version {$theme.params._version}" style="border-style: none" width="80" height="15"/></a>
        {else}
          <a href="http://g2-sites.com/nzdi-gallery-theme"><img src="{g->url href="themes/nzdi/images/nzdi.gif"}" alt="NZDI Theme" title="NZDI Theme" style="border-style: none" width="80" height="15"/></a>
        {/if}
      </div>
      {/if}
      {/if}  {* end of full screen check *}

    {* <div id="gallery-header">
      {if !empty($theme.imageViews)}
        <span class="giDescription-id">{g->text text="Item ID: "}{$theme.item.pathComponent|markup:strip}</span>
       {/if}
      {g->block type="core.ItemInfo"
                          item=$theme.item
                          showDate=false
                          showSize=true
                          showOwner=false
                          showViewCount=true
                          class="giInfo"}
              *}{* Show any other album blocks (comments, etc) *}{*
        {foreach from=$theme.params.albumBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}
        </div> *}

    </div>
    
    {if !empty($theme.params.nzdiFooter)}
        <div id="nzdi-footer">{$theme.params.nzdiFooter|markup}</div>
    {/if}

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
