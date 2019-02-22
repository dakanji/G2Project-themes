{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{g->language}" lang="{g->language}">
  <head>
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}
    {* Include this theme's java script *}
    <script type="text/javascript" src="{g->theme url='theme.js'}"></script>

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
      {if $theme.pageType == 'album' || $theme.pageType == 'photo'}
        <title>{if !empty($theme.params.site)}{$theme.params.site} - {/if}
        {if !empty($theme.parent.title)}{$theme.parent.title|markup:strip} :: {/if}
        {$theme.item.title|markup:strip|default:$theme.item.pathComponent}</title>
      {/if}
    {/if}

    {if $theme.pageType == 'album' || $theme.pageType == 'photo'}
      {if !empty($theme.item.keywords)}<meta name="keywords" content="{$theme.item.keywords}" />{/if}
      {if !empty($theme.item.description)}<meta name="description" content="{$theme.item.description|markup:strip}" />{/if}
    {/if}

    {* Set the GALLERY2 Favicon for the GALLERY pages *}
    <link rel="shortcut icon" type="image/ico" href="favicon.ico" />

    <meta http-equiv="imagetoolbar" content="no"/>

    {* Include this theme's style sheet *}
    <link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}"/>

    {assign var="separator" value=$theme.params.separator|default:"|"}
    {assign var="sidebar" value=$theme.params.sidebar}
    {assign var="logoWidth" value=$theme.params.logoWidth|default:175}
    {assign var="logoHeight" value=$theme.params.logoHeight|default:50}

    {*
     * set variables to use as icons URL for theme or colorpacks
     *}
    {capture assign="backgroundURL"}{g->theme url='templates/extra/backgrounds/'}{/capture}
    {capture assign="logoURL"}{g->theme url='templates/extra/logos/'}{/capture}
    {capture assign="bannerURL}extra/banners/{/capture}
    {capture assign="infoURL"}extra/info/{/capture}
    {capture assign="imageURL_base"}{g->theme url='images/'}{/capture}
    {if !empty($theme.params.colorpack)}
      {capture assign="colorpackURL"}{g->url href='modules/colorpack/packs/'}{/capture}
      {assign var="colorpack" value=$theme.params.colorpack}
      {capture assign="imageURL_baseCP"}{$colorpackURL}{$colorpack}/images/{/capture}
    {/if}

    {if !empty($theme.iconpack) && ($theme.iconpack == 'x_treme-icons' || $theme.iconpack == 'x_treme-icons_gif' || $theme.iconpack == 'x_black-icons_gif' || $theme.iconpack == 'x_sepia-icons_gif'  || $theme.iconpack == 'x_silver-icons_gif')}
      {assign var="Xicons" value=1}
    {/if}

    {if !empty($Xicons)}
      {if $theme.params.icons != 'none'}
        {capture assign="iconSet"}/{$theme.params.icons}/{/capture}
      {else}
        {assign var="iconSet" value="/"}
      {/if}
    {else}
      {if $theme.params.icons != 'none'}
        {capture assign="iconSet"}/{$theme.params.icons}/{/capture}
      {else}
        {if !empty($theme.params.colorpack) && ($theme.params.colorpack == 'x_black' || $theme.params.colorpack == 'x_blue' || $theme.params.colorpack == 'x_brown' || $theme.params.colorpack == 'x_charcoal' || $theme.params.colorpack == 'x_silver' ||  $theme.params.colorpack == 'x_snow' ||  $theme.params.colorpack == 'x_sepia')}
        {capture assign="iconSet"}/{$theme.params.colorpack}/{/capture}
	{else}
          {assign var="iconSet" value='/default/'}
	{/if}
      {/if}
    {/if}

    {capture assign="imageURL"}{$imageURL_base}icons{$iconSet}{/capture}
    {capture assign="imageURL_hover"}{$imageURL_base}icons{$iconSet}hover/{/capture}

    {if ($theme.params.icons == 'x_treme') || ($theme.params.icons == 'x_silk') || ($theme.params.icons == 'my_pngs')}
      {assign var="iconExt" value='png'}
    {else}
      {assign var="iconExt" value='gif'}
    {/if}

    {*
     * Set images to use as LOGO
     *}
    {if !empty($theme.params.logoout)}
      {capture assign="imgLogo"}{$logoURL}{$theme.params.logoout}{/capture}
    {else}
      {capture assign="imgLogo"}{$logoURL}logo.png{/capture}
    {/if}
    {if !empty($theme.params.logoon)}
      {capture assign="imgLogo_hover"}{$logoURL}{$theme.params.logoon}{/capture}
    {else}
      {capture assign="imgLogo_hover"}{$logoURL}logo_hover.png{/capture}
    {/if}

    {*
     * Set opacity for THUMBNAILS
     *}
    {if $theme.pageType == 'album'}
      {assign var="ToffIE" value=$theme.params.opacityT*100}
      {assign var="ToverIE" value=$theme.params.opacityTover*100}
      {assign var="ToffN" value=$theme.params.opacityT}
      {assign var="ToverN" value=$theme.params.opacityTover}
    {/if}
    {*
     * Set opacity for MICROTHUMBNAILS
     *}
    {if $theme.pageType == 'photo'}
      {assign var="MToffIE" value=$theme.params.opacityMT*100}
      {assign var="MToverIE" value=$theme.params.opacityMTover*100}
      {assign var="MToffN" value=$theme.params.opacityMT}
      {assign var="MToverN" value=$theme.params.opacityMTover}
    {/if}
    {*
     * Set options for PHOTO HOVER
     *}
    {if ($theme.params.NavOver != 'none') && ($theme.params.NavOverLink != 'links') && ($theme.params.NavOverLink != 'icons') && empty($isPanoramaItem) && ($theme.pageType == 'photo')}
      {assign var="navPicWidth" value=$theme.params.NavPicWidth|default:"80"}
      {assign var="navLinkMargin" value=$theme.params.NavLinkMargin|default:"6"}
      {if $theme.params.NavOverLink != "icons"}
        {assign var="navLinkBackground" value=$theme.params.NavLinkBackground|default:"#ffffff"}
      {else}
        {assign var="navLinkBackground" value=$theme.params.NavLinkBackground}
      {/if}
      {assign var="navLinkBorder" value=$theme.params.NavLinkBorder}
      {assign var="navLinkBorderColor" value=$theme.params.NavLinkBorderColor}
      {assign var="navLinkBorderColorHover" value=$theme.params.NavLinkBorderColorHover}
    {/if}




{* IE5.5+ PNG Alpha and floatingSidebar scroling Fix for IE from version 5.5 to 7*}

<!--[if gte IE 5.5]>
<![if lt IE 7]>
<style type="text/css">
    {if !empty($theme.params.pngfix)}
      {literal}
img, #xlogo {behavior: url(themes/x_treme/iepngfix.htc) }
      {/literal}
    {/if}
      {literal}
div#floatingSidebar {
  /* IE5.5+/Win - this is more specific than the IE 5.0 version */
  left: expression( ( 15 + ( x = document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft ) ) + 'px' );
  top: expression( ( 15 + ( y = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop ) ) + 'px' );
}
      {/literal}
</style>
<![endif]>
<![endif]-->



    <style type="text/css">
    {g->theme include="styles.tpl"}
    {*
     * Set images tu use as background if option is selected
     *}

    {if !empty($theme.params.bg)}
      {literal}
	#gallery {
	  background: url({/literal}{$backgroundURL}{$theme.params.bg}{literal}) repeat 0 1px;
	}
	body.gallery {
	  background: url({/literal}{$backgroundURL}{$theme.params.bg}{literal}) repeat 0 1px;
	}
      {/literal}
    {/if}
    {if !empty($theme.params.bg1)}
      {literal}
	.gcBackground1 {
	  background: url({/literal}{$backgroundURL}{$theme.params.bg1}{literal}) repeat 0 1px;
	}
      {/literal}
    {/if}
    {if !empty($theme.params.bg2)}
      {literal}
	.gcBackground2 {
	  background: url({/literal}{$backgroundURL}{$theme.params.bg2}{literal}) repeat 0 1px;
	}
      {/literal}
    {/if}

    {*
     * Set images to use as LOGO and ICONS
     *}

    {literal}



	a.iconLogo img, #xlogo{
	  width: {/literal}{$logoWidth}{literal}px;
	  height: {/literal}{$logoHeight}{literal}px;
	  background: url({/literal}{$imgLogo}{literal}) left top no-repeat;
	}
	a.iconLogo:hover img, #xlogo:hover{
	  width: {/literal}{$logoWidth}{literal}px;
	  height: {/literal}{$logoHeight}{literal}px;
	  background: url({/literal}{$imgLogo_hover}{literal}) left top no-repeat;
	}




	a.iconLogo:hover div{
	  background: url({/literal}{$imgLogo_hover}{literal}) left top no-repeat;
	}



	.logohover{
	  background: url({/literal}{$imgLogo_hover}{literal}) left top no-repeat;
	}

	a.iconLogo{
	  position: relative;
	}



    {/literal}
    {if ($theme.params.icons != 'none') || (($theme.params.icons == 'none') && empty($Xicons))}
      {literal} 
	a.tLink-first:hover img{
	  background: url({/literal}{$imageURL_hover}nav_first.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-first img{
	  background: url({/literal}{$imageURL}nav_first.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-back:hover img{
	  background: url({/literal}{$imageURL_hover}nav_back.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-back img{
	  background: url({/literal}{$imageURL}nav_back.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-next:hover img{
	  background: url({/literal}{$imageURL_hover}nav_next.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-next img{
	  background: url({/literal}{$imageURL}nav_next.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-last:hover img{
	  background: url({/literal}{$imageURL_hover}nav_last.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-last img{
	  background: url({/literal}{$imageURL}nav_last.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-gallery:hover img{
	  background: url({/literal}{$imageURL_hover}gallery.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-gallery img{
	  background: url({/literal}{$imageURL}gallery.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-album:hover img{
	  background: url({/literal}{$imageURL_hover}album.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-album img{
	  background: url({/literal}{$imageURL}album.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-thumbnails:hover img{
	  background: url({/literal}{$imageURL_hover}thumbnails.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-thumbnails img{
	  background: url({/literal}{$imageURL}thumbnails.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-view_slideshow:hover img{
	  background: url({/literal}{$imageURL_hover}view_slideshow.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-view_slideshow img{
	  background: url({/literal}{$imageURL}view_slideshow.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-image_popup:hover img{
	  background: url({/literal}{$imageURL_hover}image_popup.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-image_popup img{
	  background: url({/literal}{$imageURL}image_popup.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-image_block:hover img{
	  background: url({/literal}{$imageURL_hover}image_block.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-image_block img{
	  background: url({/literal}{$imageURL}image_block.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-add_comment:hover img{
	  background: url({/literal}{$imageURL_hover}add_comment.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-add_comment img{
	  background: url({/literal}{$imageURL}add_comment.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-view_comment:hover img{
	  background: url({/literal}{$imageURL_hover}view_comment.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-view_comment img{
	  background: url({/literal}{$imageURL}view_comment.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-add_cart:hover img{
	  background: url({/literal}{$imageURL_hover}add_cart.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-add_cart img{
	  background: url({/literal}{$imageURL}add_cart.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-view_cart:hover img{
	  background: url({/literal}{$imageURL_hover}cart.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-view_cart img{
	  background: url({/literal}{$imageURL}cart.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-exif_parser:hover img{
	  background: url({/literal}{$imageURL_hover}exif_parser.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-exif_parser img{
	  background: url({/literal}{$imageURL}exif_parser.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-ecard:hover img{
	  background: url({/literal}{$imageURL_hover}ecard.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-ecard img{
	  background: url({/literal}{$imageURL}ecard.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-info_expand:hover img{
	  background: url({/literal}{$imageURL_hover}info_expand.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-info_expand img{
	  background: url({/literal}{$imageURL}info_expand.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-info_collapse:hover img{
	  background: url({/literal}{$imageURL_hover}info_collapse.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-info_collapse img{
	  background: url({/literal}{$imageURL}info_collapse.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-options_expand:hover img{
	  background: url({/literal}{$imageURL_hover}options_expand.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-options_expand img{
	  background: url({/literal}{$imageURL}options_expand.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-options_collapse:hover img{
	  background: url({/literal}{$imageURL_hover}options_collapse.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-options_collapse img{
	  background: url({/literal}{$imageURL}options_collapse.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_back:hover img{
	  background: url({/literal}{$imageURL_hover}control_back.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-control_back img{
	  background: url({/literal}{$imageURL}control_back.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_next:hover img{
	  background: url({/literal}{$imageURL_hover}control_next.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-control_next img{
	  background: url({/literal}{$imageURL}control_next.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_stop:hover img{
	  background: url({/literal}{$imageURL_hover}control_stop.{$iconExt}{literal}) left center no-repeat;
	}
	a.tLink-control_stop img{
	  background: url({/literal}{$imageURL}control_stop.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_start:hover img{
	  background: url({/literal}{$imageURL_hover}control_start.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_start img{
	  background: url({/literal}{$imageURL}control_start.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_pause:hover img{
	  background: url({/literal}{$imageURL_hover}control_pause.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-control_pause img{
	  background: url({/literal}{$imageURL}control_pause.{$iconExt}{literal}) left center no-repeat;
	}

	a.tLink-close img{
	  background: url({/literal}{$imageURL}close.{$iconExt}{literal}) left center no-repeat;
	}

      {/literal}
    {/if}

    {*
     * Set thumbnail icon style for Hover Photo 
     *}
    {if $theme.params.NavOverLink == 'icons' && $theme.params.NavOver != 'none' && $theme.pageType == 'photo'}
    {literal}
	.hoverNav span{
	  filter: alpha(opacity=0);
	  -moz-opacity: 0;
	  opacity: 0;
	  -khtml-opacity: 0;
	  cursor: pointer;
	  cursor: hand;
	}
	.hoverNav:hover span{
	  filter: alpha(opacity=60);
	  -moz-opacity: 0.6;
	  opacity: 0.6;
	  -khtml-opacity: 0.6;
	}
    {/literal}
    {/if}

    {*
     * Set thumbnail style for Hover Photo 
     *}
    {if ($theme.params.NavOver != 'none') && ($theme.params.NavOverLink != 'links') && ($theme.params.NavOverLink != 'icons') && empty($isPanoramaItem) && ($theme.pageType == 'photo')}
      {literal}
	#imap {
	  display:block;
	}

	#imap a#title:hover {
	  background-position: 0 0;
	  z-index:20;
	}

	#imap dd {
	  position:absolute;
	  top:0;
	  padding:0;
	  margin:0;
	}
	#imap span#prevT, #imap span#fullT, #imap span#nextT, #imap span#prevB, #imap span#fullB, #imap span#nextB,
	#imap a#prevT, #imap a#fullT, #imap a#nextT, #imap a#prevB, #imap a#fullB, #imap a#nextB {
	  display:block;
	  text-decoration:none;
	  z-index:20;
	  cursor:default;
	}

	#imap a span, #imap a:visited span,
	#imap span span, #imap span:visited span {
	  display:none;
	  position:absolute;  
	  font-family:arial; 
	  font-size:12px; 
	  color:#000; 
	  padding: {/literal}{$navLinkMargin}{literal}px; 
	  text-align: center;
	}

	#imap a#prevT:hover, #imap a#fullT:hover, #imap a#nextT:hover, #imap a#prevB:hover, #imap a#fullB:hover, #imap a#nextB:hover,
	#imap span#prevT:hover, #imap span#fullT:hover, #imap span#nextT:hover, #imap span#prevB:hover, #imap span#fullB:hover, #imap span#nextB:hover {
	  background-position:0 0;
	}

	#imap a:hover span,
	#imap span:hover span {
	  display:block; 
	}

	* html #imap span:hover span {
	  width:400px; w\idth:388px;
	}
	* html #imap a:hover span {
	  width:400px; w\idth:388px;
	}


	#imap span#prevT:hover span, #imap span#nextT:hover span, #imap span#fullT:hover span, #imap span#prevB:hover span, #imap span#nextB:hover span, #imap span#fullB:hover span {
	  background:{/literal}{$navLinkBackground}{literal}; 
	    filter: alpha(opacity=80);
	    -moz-opacity: 0.8;
	    opacity: 0.8;
	}

	#imap a#prevT span, #imap a#nextT span, #imap a#fullT span, #imap a#prevB span, #imap a#nextB span, #imap a#fullB span,
	#imap span#prevT span, #imap span#nextT span, #imap span#fullT span, #imap span#prevB span, #imap span#nextB span, #imap span#fullB span {
	{/literal}{if !empty ($navLinkBorder)}{literal}
	  border-style:solid;
	{/literal}{/if}{literal}
	  background:{/literal}{$navLinkBackground}{literal}; 
	  border-width:{/literal}{$navLinkBorder}{literal}px; 
	  border-color:{/literal}{$navLinkBorderColor}{literal}; 
	}


	#imap span#prevT span:hover, #imap span#nextT span:hover, #imap span#fullT span:hover, #imap span#prevB span:hover, #imap span#nextB span:hover, #imap span#fullB span:hover {
	    filter: alpha(opacity=100);
	    -moz-opacity: 1.0;
	    opacity: 1.0;
	  border-color: {/literal}{$navLinkBorderColorHover}{literal}; 
	}


  	/* this is specific for IE versions before 7.0 */
	#imap a#prevT:hover span, #imap a#nextT:hover span, #imap a#fullT:hover span, #imap a#prevB:hover span, #imap a#nextB:hover span, #imap a#fullB:hover span {
	    filter: alpha(opacity=90);
	  border-color: {/literal}{$navLinkBorderColorHover}{literal}; 
	}


      {/literal}
    {/if}

    {*
     * Set border for THUMBNAILS and IMAGES
     *}
    {if !empty($theme.params.Tborder)}
      {if !empty($theme.params.TborderColor)}
	  {literal}
	    .giThumbnail {
	      border: {/literal}{$theme.params.Tborder}{literal}px solid {/literal}{$theme.params.TborderColor}{literal}
	    !important;}
	  {/literal}
      {else}
	  {literal}
	    .giThumbnail {
	      border: {/literal}{$theme.params.Tborder}{literal}px solid black
	    !important;}
	  {/literal}
      {/if}
    {/if}
    {if !empty($theme.params.SIborder)}
      {if !empty($theme.params.SIborderColor)}
	  {literal}
	    .gsSingleImage, .gsSingleImageNoF {
	      border: {/literal}{$theme.params.SIborder}{literal}px solid {/literal}{$theme.params.SIborderColor}{literal}
	    !important;}
	  {/literal}
      {else}
	  {literal}
	    .gsSingleImage,.gsSingleImageNoF {
	      border: {/literal}{$theme.params.SIborder}{literal}px solid black
	    !important;}
	  {/literal}
      {/if}
    {/if}

    {*
     * Set opacity for THUMBNAILS
     *}
    {if $theme.pageType == 'album'}
      {literal}
	.opacityT img{
	  filter: alpha(opacity={/literal}{$ToffIE}{literal});
	  -moz-opacity: {/literal}{$ToffN}{literal};
	  opacity: {/literal}{$ToffN}{literal};
	  -khtml-opacity:{/literal}{$ToffN}{literal};
	}
	.opacityT:hover img{
	  filter: alpha(opacity={/literal}{$ToverIE}{literal});
	  -moz-opacity: {/literal}{$ToverN}{literal};
	  opacity: {/literal}{$ToverN}{literal};
	  -khtml-opacity:{/literal}{$ToverN}{literal};
	}
      {/literal}
    {/if}
    {*
     * Set opacity for MICROTHUMBNAILS
     *}
    {if $theme.pageType == 'photo'}
      {literal}
	.MTclass img{
	  filter:alpha(opacity={/literal}{$MToffIE}{literal});
	  -moz-opacity: {/literal}{$MToffN}{literal};
	  opacity: {/literal}{$MToffN}{literal};
	  -khtml-opacity:{/literal}{$MToffN}{literal};
	}
	.MTclass:hover img{
	  filter:alpha(opacity={/literal}{$MToverIE}{literal});
	  -moz-opacity: {/literal}{$MToverN}{literal};
	  opacity: {/literal}{$MToverN}{literal};
	  -khtml-opacity:{/literal}{$MToverN}{literal};
	}

	.thumbSmall, .thumbSmall:hover  {
	  border: {/literal}{$theme.params.MTborder}{literal}px solid {/literal}{$theme.params.MTborderColor}{literal} !important;
	}
      {/literal}
    {/if}

    </style>



    {*
     * Set path to banners and info
     *}

    {if !empty($theme.params.bannerTopurl)}
      {capture assign="bannerTop"}{$bannerURL}{$theme.params.bannerTopurl}{/capture}
    {else}
      {capture assign="bannerTop"}{$bannerURL}banner_top.tpl{/capture}
    {/if}
    {if !empty($theme.params.bannerFooterurl)}
      {capture assign="bannerFooter"}{$bannerURL}{$theme.params.bannerFooterurl}{/capture}
    {else}
      {capture assign="bannerFooter"}{$bannerURL}banner_footer.tpl{/capture}
    {/if}

    {if $theme.params.showInfoMsg != 'none'}
      {if !empty($theme.params.InfoMsgurl)}
        {capture assign="InfoMsg"}{$infoURL}{$theme.params.InfoMsgurl}{/capture}
      {else}
        {capture assign="InfoMsg"}{$infoURL}default.tpl{/capture}
      {/if}
      {if !empty($theme.params.InfoMsgLink1)}
        {if !empty($theme.params.InfoMsgLink1url)}
          {capture assign="InfoMsgLink1"}{$infoURL}{$theme.params.InfoMsgLink1url}{/capture}
        {else}
          {capture assign="InfoMsgLink1"}{$infoURL}default_link1.tpl{/capture}
        {/if}
      {/if}
      {if !empty($theme.params.InfoMsgLink2)}
        {if !empty($theme.params.InfoMsgLink2url)}
          {capture assign="InfoMsgLink2"}{$infoURL}{$theme.params.InfoMsgLink2url}{/capture}
        {else}
          {capture assign="InfoMsgLink2"}{$infoURL}default_link2.tpl{/capture}
        {/if}
      {/if}
    {/if}

    {*************javascript ***************}
    {if $theme.params.RightClick != 'none'}
      {literal}
      <script type="text/JavaScript">
      //<![CDATA[
      <!--

	// Set the message for the alert box
	var msgmouse="{/literal}{strip}\251 {if !empty($theme.params.copyrightDateText)}{$theme.params.copyrightDateText}{else}
                    {capture name=childTimestamp}{g->date timestamp=$item.originationTimestamp format=%Y}{/capture}
                    {g->text text="%s" arg1=$smarty.capture.childTimestamp}{/if}{/strip}";
        msgmouse += " - {g->text text='ALL RIGHTS RESERVED'}\n";
        msgmouse += "{if !empty($theme.params.site)}Copyright - {$theme.params.site}{/if}";
	msgmouse += "{g->text text='This page is copyrighted, and all content is protected'}.\n"; 
        msgmouse += "{if !empty($theme.params.copyrightEmail)}{g->text text='Please contact'}: {$theme.params.copyrightEmail}{else}{g->text text='Please contact'}: {$theme.item.owner.email}{/if}{literal}";

        {/literal}{if $theme.params.RightClick == "disable"}{literal}
	  document.onmousedown=nrc;
	  document.onmouseup=nrc;
	  document.oncontextmenu=new Function("return false;");
        {/literal}{/if}{literal}

        {/literal}{if $theme.params.RightClick == "alert"}{literal}
	  document.onmousedown=rcalert;
	  document.onmouseup=rcalert;
	  document.oncontextmenu=new Function("alert(msgmouse);return false;");
        {/literal}{/if}{literal}

        {/literal}{if $theme.params.RightClick == "sidebarrc" && $sidebar == "floating" && !empty($theme.params.sidebarBlocks)}{literal}
	  document.onmousedown=sidebarrc;
	  document.onmouseup=sidebarrc;
	  document.oncontextmenu=new Function(" a=toggleLyr('floatingSidebar')");
        {/literal}{/if}{literal}

        {/literal}{if $theme.params.RightClick == "sidebarnrc" && $sidebar == "floating" && !empty($theme.params.sidebarBlocks)}{literal}
	  document.onmousedown=sidebarnrc;
	  document.onmouseup=sidebarnrc;
	  document.oncontextmenu=new Function("a=toggleLyr('floatingSidebar');return false;");
        {/literal}{/if}{literal}

        {/literal}{if $theme.params.RightClick == "sidebarrcalert" && $sidebar == "floating" && !empty($theme.params.sidebarBlocks)}{literal}
	  document.onmousedown=sidebarrcalert;
	  document.onmouseup=sidebarrcalert;
	  document.oncontextmenu=new Function("a=toggleLyr('floatingSidebar');alert(msgmouse);return false;");
        {/literal}{/if}{literal}
      //-->
      //]]>
      </script>
      {/literal}
    {/if}
    {**********end javascript *************}

  </head>
  <body class="gallery">
    <div {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we don't draw
       * a header, footer, navbar, etc.  Those views are responsible for drawing everything.
       *}
      {if $theme.useFullScreen}
	{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {elseif $theme.pageType == 'progressbar'}
	<div id="gsHeader">
	  <img src="{g->url href="images/galleryLogo_sm.gif"}" width="107" height="48" alt=""/>
	</div>
	{g->theme include="progressbar.tpl"}
      {else}
      <div id="gsHeader">
        <table style="width:100%">
          <tr>
	  {if ($theme.params.logo == 'left')}
            <td style="height:{$logoHeight}px; width:{$logoWidth}px">
	      <a href="{g->url}" title="{g->text text='home'}" class="iconLogo">
		<div id="xlogo" title="{g->text text='home'}" onmouseover="this.className='logohover'"></div>
{*************************************
	  <img src="{g->url href="images/galleryLogo_sm.gif"}" width="107" height="48" alt=""/>
********}
	      </a>
            </td>
	  {/if}
	  {if ($theme.params.logo == 'right')}
            <td style="width:33%">
	    </td>
	  {/if}
            <td style="width:33%">
	{*
	 ******* advise if JavaScript is not enabled ********
	 *}
	      <noscript>
	      <center>
	        <table cellpadding="0" cellspacing="0" border="0" width="550">
	 	  <tr><td width="100%" valign="top" class="PPDesTxt"><b>Are you using a browser that doesn't support JavaScript?</b></td></tr>
		  <tr><td width="100%" valign="top" class="PPDesTxt">If your browser does not support JavaScript, you can upgrade to a newer browser, such as <a href="http://www.microsoft.com/windows/ie/downloads/ie6/default.asp">Microsoft&reg; Internet Explorer 6</a>, <a href="http://wp.netscape.com/computing/download/bdp/index.html">Netscape 6</a> or <a href="http://www.mozilla.com">Firefox 5.1</a>
.</td></tr>
		  <tr><td width="100%" valign="top" class="PPDesTxt"><b>Have you disabled JavaScript?</b></td></tr>
		  <tr><td width="100%" valign="top" class="PPDesTxt">If you have disabled JavaScript, you must re-<a href="http://www.umflint.edu/sis/btest/javascript.htm">enable</a> JavaScript to use this site full features.</td></tr>
		</table>
	      </center>
	      </noscript>
	{*
	 ******* if JavaScript is not enabled end ********
	 *}
              {if $theme.params.bannerTop}
              {g->theme include=$bannerTop}
              {/if}
            </td>

	  {if ($theme.params.logo == 'center') || ($theme.params.logo == 'right')}
	    <td>
  	      <table {if ($theme.params.logo == 'center')}align="center"{else}align="right"{/if}>
		<tr>
              	  <td style="height:{$logoHeight}px; width:{$logoWidth}px">
	     	    <a href="{g->url}" title="{g->text text='home'}" class="iconLogo">
		      <img src="{$imageURL_base}blank.gif" alt="{g->text text='home'}" title="{g->text text='home'}"/>
		    </a>
          	  </td>
                </tr>
              </table>
            </td>
	  {/if}

 	  {if ($theme.params.logo == 'left') || ($theme.params.logo == 'center')}
            <td style="width:33%">
	    </td>
	  {/if}
	  </tr>
	</table>
      </div>

      <table width="100%" id="topNavBar">
        <tr>
          {if !empty($theme.params.BreadCrumb)}
          <td style="width:50%;text-align:left;" class="BreadCrumb">
            {g->block type="core.BreadCrumb"}
          </td>
          {/if}
          <td style="width:50%;text-align:right" nowrap="nowrap" class="SystemLinks">
	    {assign var='TopLinksseparator' value='1'}
            {g->block type="core.SystemLinks"
		  order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		  othersAt=4}

            {if $theme.params.link1}
              <a href="{$theme.params.link1url}">{$theme.params.link1}</a>
	      {assign var='TopLinksseparator' value='0'}
            {/if}
            {if $theme.params.link2}
	      {if ($TopLinksseparator ==0)}{$separator} {/if}
              <a href="{$theme.params.link2url}">{$theme.params.link2}</a>
	      {assign var='TopLinksseparator' value='0'}
            {/if}
            {if $theme.params.link3}
	      {if ($TopLinksseparator ==0)}{$separator} {/if}
              <a href="{$theme.params.link3url}">{$theme.params.link3}</a>
	      {assign var='TopLinksseparator' value='0'}
            {/if}

            {if !empty($theme.params.externallinks)}
	      {if ($TopLinksseparator ==0)}{$separator}{/if}
              {g->theme include="externalLinks.tpl"}
	      {assign var='TopLinksseparator' value='0'}
            {/if}
            {if $sidebar == "floating" && !empty($theme.params.sidebarBlocks) && (empty($theme.adminTemplate) || $theme.adminTemplate != "modules/core/templates/SiteAdmin.tpl")}
	      {if ($TopLinksseparator ==0)}
	      {literal}
	      <script type="text/JavaScript">
	      //<![CDATA[
 	      <!--
	        txt = {/literal}"{$separator}"{literal};
	        function Separator(){document.write(txt);}
	        Separator();
	      //-->
	      //]]>
	      </script>
	      {/literal}
              {/if}

              <a href="javascript:void(0);" onclick="toggleLyr('floatingSidebar')">
	      {literal}
 	      <script type="text/JavaScript">
	      <!--
	      txt = {/literal}"{g->text text='Options'}{assign var='TopLinksseparator' value='0'}"{literal};
	      function Viewoptions(){document.write(txt);}
	      Viewoptions();
	      //-->
	      </script>
	      {/literal}</a>

            {/if}

  	    {* add items on top menu *}
            {if $theme.pageType == 'album' && (isset ($theme.permissions.core_addDataItem) || isset ($theme.permissions.core_addAlbumItem))}
              {if !$user.isGuest && ($theme.guestPreviewMode != 1)}
 		{if ($TopLinksseparator == 0) && (empty($theme.adminTemplate) || $theme.adminTemplate != "modules/core/templates/SiteAdmin.tpl")}{$separator}{/if}
                &nbsp;{g->text text="Add"}
		{if isset ($theme.permissions.core_addDataItem)}
                  <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`" arg4="return=`$theme.item.id`"}">{g->text text="Items"}</a>{if isset ($theme.permissions.core_addAlbumItem)}{g->text text="&nbsp;-&nbsp;"}{/if}
		{/if}
		{if isset ($theme.permissions.core_addAlbumItem)}
		  <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAddAlbum" arg3="itemId=`$theme.item.id`" arg4="return=`$theme.item.id`"}">{g->text text="Album"}</a>
		{/if}
		{assign var='TopLinksseparator' value='0'}
              {/if}
            {/if}
 	    {*
	     ** /add items on top menu **
	     *}
            </td>
          </tr>
        </table>
	<br/>

      {capture assign="comments"}{g->block type="comment.AddComment"}{/capture} 
      {capture assign="exif"}{g->block type="exif.ExifInfo"}{/capture}
      {capture assign="rating"}{g->block type="rating.Rating"}{/capture}

      {capture assign="cart"}{g->block type="cart.ShowCart"}{/capture}
      {capture assign="checkout"}{g->block type="checkout.ShowCart"}{/capture}


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


      <div id="gsFooter">
        {g->theme include="footer.tpl"}
      </div>
      <div style="display:none; font-size:0px">Powered by Gallery (http://gallery.menalto.com/) with X_treme theme(for G2.2) by Pedro Gilberto (http://www.pedrogilberto.net)</div>
      {/if}  {* end of full screen check *}
    </div>

    {*
     * Give Gallery a chance to output any cleanup code, like javascript that needs to be run
     * at the end of the <body> tag.  If you take this out, some code won't work properly.
     *}
    {g->trailer}

    {* Put any debugging output here, if debugging is enabled *}
    {g->debug}
  </body>
</html>
