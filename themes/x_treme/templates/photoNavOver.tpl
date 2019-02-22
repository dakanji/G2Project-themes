{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}

{assign var="fullPicWidth" value=$navPicWidth+2*navLinkMargin}

{assign var="nextImage" value=$theme.navigator.next}
{assign var="backImage" value=$theme.navigator.back}

{if $nextImage}
  {if $nextImage.thumbnail.width > $nextImage.thumbnail.height}
	{assign var="nextImageLinkWidth" value=$navPicWidth}
  {else}
	{assign var="nextImageLinkWidth_calc" value=$navPicWidth*$nextImage.thumbnail.width/$nextImage.thumbnail.height|string_format:'%d'}
	{assign var="nextImageLinkWidth" value=$nextImageLinkWidth_calc+1|string_format:'%d'}
  {/if}
{/if}

{if $backImage}
  {if $backImage.thumbnail.width > $backImage.thumbnail.height}
	{assign var="backImageLinkWidth" value=$navPicWidth}
  {else}
	{assign var="backImageLinkWidth_calc" value=$navPicWidth*$backImage.thumbnail.width/$backImage.thumbnail.height|string_format:'%d'}
	{assign var="backImageLinkWidth" value=$backImageLinkWidth_calc+1|string_format:'%d'}
  {/if}
{/if}

{if ($theme.params.NavOverLink == "icons")}
	{assign var="backImageLinkWidth" value=$navPicWidth+2*navLinkMargin}
	{assign var="nextImageLinkWidth" value=$navPicWidth+2*navLinkMargin}
{/if}

{assign var="linkpadding" value=30}
{assign var="forNothumbWidth" value=125}

{assign var="navwidth" value=$imagewidth/3}
{assign var="fullpos" value=$imagewidth/2}
{assign var="nextpos" value=$navwidth*2}

{if isset($nextImage.thumbnail)}
{assign var="nextpicpos" value=$navwidth-$nextImageLinkWidth-2*$navLinkMargin+$linkpadding|string_format:'%d'}
{else}
{assign var="nextpicpos" value=$navwidth-$forNothumbWidth-2*$navLinkMargin+$linkpadding|string_format:'%d'}
{/if}

{assign var="fullcenter" value=$navPicWidth/2|string_format:'%d'}
{assign var="fullpicpos" value=$navwidth/2-$fullcenter|string_format:'%d'}


<div style="position:absolute; top:0; left:0;">
  <dl id="imap">
  {if ($theme.params.NavOver == "top") || ($theme.params.NavOver == "both")}
    {if ($backImage) && (((($theme.params.NavOverLink == "thumb") || ($theme.params.NavOverLink == "both")) && !empty($showMicroThumbs)) || ($theme.params.NavOverLink == "pic") || ($theme.params.NavOverLink == "text"))}
    <dd id="picprevT">{strip}

    <![if !IE ]>
      <span id="prevT" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;">
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <span id="prevT" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;">
      <![endif]>
      <![if lt IE 7]>
      <a id="prevT" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$backImage.urlParams}">
      <![endif]>
    <![endif]-->

        <span style="top:20px; padding:{$navLinkMargin}px; left:-{$linkpadding}px; width:{if isset($backImage.thumbnail)}{$backImageLinkWidth}{else}{$forNothumbWidth}{/if}px;" title="{g->text text='Previous'}">

    	<![if !IE ]>
          <a href="{g->url params=$backImage.urlParams}">
    	<![endif]>
    	<!--[if IE ]>
      	  <![if gte IE 7 ]>
          <a href="{g->url params=$backImage.urlParams}">
      	  <![endif]>
    	<![endif]-->

	  {if ($theme.params.NavOverLink == "thumb")}
            {if isset($backImage.thumbnail)}
	      {g->image item=$backImage.item image=$backImage.thumbnail maxSize="$navPicWidth" title=$backImage.item.title}
	    {else}
	      {$backImage.item.title}<br/>
	      {g->text text="(no thumbnail)"}
	    {/if}
	  {/if}
	  {if ($theme.params.NavOverLink == "both")}
            {if isset($backImage.thumbnail)}
	      {g->image item=$backImage.item image=$backImage.thumbnail maxSize="$navPicWidth" title=$backImage.item.title}
	    {else}
	      {$backImage.item.title}<br/>
	      {g->text text="(no thumbnail)"}
	    {/if}
	    <br/>{g->text text="PREVIOUS"}
	  {/if}
	  {if ($theme.params.NavOverLink == "text")}
	    <br/>{g->text text="PREVIOUS"}
	  {/if}

    	<![if !IE ]>
	  </a>
	</span>
      </span>
    	<![endif]>
    	<!--[if IE ]>
      	  <![if gte IE 7 ]>
	  </a>
	</span>
      </span>
      	  <![endif]>
      	  <![if lt IE 7]>
	</span>
      </a>
      	  <![endif]>
    	<![endif]-->
{/strip}
    </dd>
    {/if}

    {if isset ($theme.permissions.core_viewSource) && ($theme.params.NavOverPop != "none") && !empty($theme.sourceImage.width) && (($imagewidth != $theme.item.width) || ($theme.params.NavOverPop == "even"))}
    <dd id="picfullT" style="left:{$navwidth|string_format:'%d'}px;">
{strip}

{literal}<script type="text/JavaScript">
//<![CDATA[
<!--
img = {/literal}"
<![if !IE ]>
  <span id=\"fullT\" style=\"width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;\">
<![endif]>
<!--[if IE ]>
  <![if gte IE 7 ]>
  <span id=\"fullT\" style=\"width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;\">
  <![endif]>
  <![if lt IE 7]>
  <a id=\"fullT\" style=\"width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;\" href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\">
  <![endif]>
<![endif]-->

    <span style=\"top:20px; text-align:center; padding:{$navLinkMargin}px; left:{$fullpicpos|string_format:'%d'}px; width:{$fullPicWidth}px;\">

    <![if !IE ]>
      <a href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\">
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <a href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\">
      <![endif]>
    <![endif]-->

	{if ($theme.params.NavOverLink == 'thumb') || ($theme.params.NavOverLink == 'both') || ($theme.params.NavOverLink == 'text')}{g->text text="FULL SIZE"}{/if}

    <![if !IE ]>
      <\/a>
    <\/span>
  <\/span>
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <\/a>
    <\/span>
  <\/span>
      <![endif]>
      <![if lt IE 7]>
    <\/span>
  <\/a>
      <![endif]>
    <![endif]-->

"{literal};
function ViewPopup(){document.write(img);}
ViewPopup();
//-->
//]]>
</script>{/literal}

{/strip}
    </dd>
    {/if}

    {if ($nextImage) && (((($theme.params.NavOverLink == "thumb") || ($theme.params.NavOverLink == "both")) && !empty($showMicroThumbs)) || ($theme.params.NavOverLink == "pic") || ($theme.params.NavOverLink == "text"))}
    <dd id="picnextT" style="left:{$nextpos|string_format:'%d'}px;">{strip}
    <![if !IE ]>
      <span id="nextT" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$nextImage.urlParams}">
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <span id="nextT" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$nextImage.urlParams}">
      <![endif]>
      <![if lt IE 7]>
      <a id="nextT" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'top')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$nextImage.urlParams}">
      <![endif]>
    <![endif]-->

        <span style="top:20px; padding:{$navLinkMargin}px; left:{$nextpicpos|string_format:'%d'}px; width:{if isset($nextImage.thumbnail)}{$nextImageLinkWidth}{else}{$forNothumbWidth}{/if}px;" title="{g->text text='Next'}">

    	<![if !IE ]>
          <a href="{g->url params=$nextImage.urlParams}">
    	<![endif]>
    	<!--[if IE ]>
      	  <![if gte IE 7 ]>
          <a href="{g->url params=$nextImage.urlParams}">
      	  <![endif]>
    	<![endif]-->

	  {if ($theme.params.NavOverLink == "thumb")}
            {if isset($nextImage.thumbnail)}
	      {g->image item=$nextImage.item image=$nextImage.thumbnail maxSize="$navPicWidth" title=$nextImage.item.title}
	    {else}
	      {$nextImage.item.title}<br/>
	      {g->text text="(no thumbnail)"}
	    {/if}
	  {/if}
	  {if ($theme.params.NavOverLink == "both")}
            {if isset($nextImage.thumbnail)}
	      {g->image item=$nextImage.item image=$nextImage.thumbnail maxSize="$navPicWidth" title=$nextImage.item.title}
	    {else}
	      {$nextImage.item.title}<br/>
	      {g->text text="(no thumbnail)"}
	    {/if}
	    <br/>{g->text text="NEXT"}
	  {/if}
	  {if ($theme.params.NavOverLink == "text")}
	    <br/>{g->text text="NEXT"}
	  {/if}

    	<![if !IE ]>
	  </a>
	</span>
      </span>
    	<![endif]>
    	<!--[if IE ]>
          <![if gte IE 7 ]>
	  </a>
	</span>
      </span>
          <![endif]>
      	<![if lt IE 7]>
	</span>
      </a>
          <![endif]>
    	<![endif]-->

{/strip}
    </dd>
    {/if}
  {/if}

  {if ($theme.params.NavOver == "bottom") || ($theme.params.NavOver == "both")}
    {if ($backImage) && (((($theme.params.NavOverLink == "thumb") || ($theme.params.NavOverLink == "both")) && !empty($showMicroThumbs)) || ($theme.params.NavOverLink == "icons") || ($theme.params.NavOverLink == "text"))}
    <dd id="picprevB" style="top:{if ($theme.params.NavOver == 'bottom')}0{else}{$imageheight/2|string_format:'%d'}{/if}px">{strip}

    <![if !IE ]>
      <span id="prevB" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$backImage.urlParams}">
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <span id="prevB" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$backImage.urlParams}">
      <![endif]>
      <![if lt IE 7]>
      <a id="prevB" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$backImage.urlParams}">
      <![endif]>
    <![endif]-->

        <span style="bottom:20px; padding:{$navLinkMargin}px; left:-{$linkpadding}px; width:{if isset($backImage.thumbnail)}{$backImageLinkWidth}{else}{$forNothumbWidth}{/if}px;" title="{g->text text='Previous'}">

    	<![if !IE ]>
          <a href="{g->url params=$backImage.urlParams}">
    	<![endif]>
    	<!--[if IE ]>
      	  <![if gte IE 7 ]>
          <a href="{g->url params=$backImage.urlParams}">
      	  <![endif]>
    	<![endif]-->

	  {if ($theme.params.NavOverLink == "thumb")}
            {if isset($backImage.thumbnail)}
	      {g->image item=$backImage.item image=$backImage.thumbnail maxSize="$navPicWidth" title=$backImage.item.title}
	    {else}
	      {$backImage.item.title}<br/>
	      {g->text text="(no thumbnail)"}
	    {/if}
	  {/if}
	  {if ($theme.params.NavOverLink == "both")}
            {if isset($backImage.thumbnail)}
	      {g->image item=$backImage.item image=$backImage.thumbnail maxSize="$navPicWidth" title=$backImage.item.title}
	    {else}
	      {$backImage.item.title}<br/>
	      {g->text text="(no thumbnail)"}
	    {/if}
	    <br/>{g->text text="PREVIOUS"}
	  {/if}
	  {if ($theme.params.NavOverLink == "text")}
	    <br/>{g->text text="PREVIOUS"}
	  {/if}

    	<![if !IE ]>
	  </a>
	</span>
      </span>
    	<![endif]>
    	<!--[if IE ]>
      	  <![if gte IE 7 ]>
	  </a>
	</span>
      </span>
      	  <![endif]>
      	  <![if lt IE 7]>
	</span>
      </a>
      	  <![endif]>
    	<![endif]-->

{/strip}
    </dd>
  {/if}

  {if isset ($theme.permissions.core_viewSource) && ($theme.params.NavOverPop != "none") && !empty($theme.sourceImage.width) && (($imagewidth != $theme.item.width) || ($theme.params.NavOverPop == "even"))}
    <dd id="picfullB" style="left:{$navwidth|string_format:'%d'}px; top:{if ($theme.params.NavOver == 'bottom')}0{else}{$imageheight/2|string_format:'%d'}{/if}px;">
{strip}
      {literal}<script type="text/JavaScript">
      //<![CDATA[
      <!--
      img = {/literal}"

<![if !IE ]>
  <span id=\"fullB\" style=\"width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;\">
<![endif]>
<!--[if IE ]>
  <![if gte IE 7 ]>
  <span id=\"fullB\" style=\"width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;\">
  <![endif]>
  <![if lt IE 7]>
  <a id=\"fullB\" style=\"width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;\" href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\">
  <![endif]>
<![endif]-->

    <span style=\"bottom:20px; text-align:center; padding:{$navLinkMargin}px; left:{$fullpicpos|string_format:'%d'}px; width:{$fullPicWidth}px;\">

    <![if !IE ]>
      <a href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\">
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <a href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\">
      <![endif]>
    <![endif]-->

        {if ($theme.params.NavOverLink == 'thumb') || ($theme.params.NavOverLink == 'both') || ($theme.params.NavOverLink == 'text')}{g->text text="FULL SIZE"}{/if}

    <![if !IE ]>
      <\/a>
    <\/span>
  <\/span>
    <![endif]>
    <!--[if IE ]>
      <![if gte IE 7 ]>
      <\/a>
    <\/span>
  <\/span>
      <![endif]>
      <![if lt IE 7]>
    <\/span>
  <\/a>
      <![endif]>
    <![endif]-->

"{literal};
      function ViewPopup(){document.write(img);}
      ViewPopup();
      //-->
      //]]>
      </script>{/literal}
{/strip}
    </dd>
  {/if}

  {if ($nextImage) && (((($theme.params.NavOverLink == "thumb") || ($theme.params.NavOverLink == "both")) && !empty($showMicroThumbs)) || ($theme.params.NavOverLink == "icons") || ($theme.params.NavOverLink == "text"))}
  <dd id="picnextB" style="left:{$nextpos|string_format:'%d'}px; top:{if ($theme.params.NavOver == 'bottom')}0{else}{$imageheight/2|string_format:'%d'}{/if}px;">{strip}

  <![if !IE ]>
    <span id="nextB" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$nextImage.urlParams}">
  <![endif]>
  <!--[if IE ]>
    <![if gte IE 7 ]>
    <span id="nextB" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$nextImage.urlParams}">
    <![endif]>
    <![if lt IE 7]>
    <a id="nextB" style="width:{$navwidth|string_format:'%d'}px; height:{if ($theme.params.NavOver == 'bottom')}{$imageheight}{else}{$imageheight/2|string_format:'%d'}{/if}px;" href="{g->url params=$nextImage.urlParams}">
    <![endif]>
  <![endif]-->

      <span style="bottom:20px; padding:{$navLinkMargin}px; left:{$nextpicpos|string_format:'%d'}px; width:{if isset($nextImage.thumbnail)}{$nextImageLinkWidth}{else}{$forNothumbWidth}{/if}px;" title="{g->text text='Next'}">

      <![if !IE ]>
 	<a href="{g->url params=$nextImage.urlParams}">
      <![endif]>
      <!--[if IE ]>
        <![if gte IE 7 ]>
 	<a href="{g->url params=$nextImage.urlParams}">
      	<![endif]>
      <![endif]-->

        {if ($theme.params.NavOverLink == "thumb")}
          {if isset($nextImage.thumbnail)}
	    {g->image item=$nextImage.item image=$nextImage.thumbnail maxSize="$navPicWidth" title=$nextImage.item.title}
	  {else}
	    {$nextImage.item.title}<br/>
	    {g->text text="(no thumbnail)"}
	  {/if}
	{/if}
	{if ($theme.params.NavOverLink == "both")}
          {if isset($nextImage.thumbnail)}
	    {g->image item=$nextImage.item image=$nextImage.thumbnail maxSize="$navPicWidth" title=$nextImage.item.title}
	  {else}
	    {$nextImage.item.title}<br/>
	    {g->text text="(no thumbnail)"}
	  {/if}
	  <br/>{g->text text="NEXT"}
        {/if}
	{if ($theme.params.NavOverLink == "text")}
	  <br/>{g->text text="NEXT"}
	{/if}

      <![if !IE ]>
	  </a>
	</span>
      </span>
      <![endif]>
      <!--[if IE ]>
        <![if gte IE 7 ]>
	  </a>
	</span>
      </span>
        <![endif]>
        <![if lt IE 7]>
	</span>
      </a>
        <![endif]>
      <![endif]-->

{/strip}
  </dd>
  {/if}
{/if}
</dl>
</div>

