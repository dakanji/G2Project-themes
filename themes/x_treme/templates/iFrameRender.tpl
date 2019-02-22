{*
 * $Revision: 1545 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}

{g->callback type="customfield.LoadCustomFields" itemId=$item.id|default:$theme.item.id}
{* Interactive Frame *}
{assign var="frameModuleWidth" value=$imagewidth+$framePPLwidth+$framePPRwidth+$theme.params.SIborder+$theme.params.SIborder+16}
{assign var="frameModuleHeight" value=$imageheight+$framePPTheight+$framePPBheight+$theme.params.SIborder+$theme.params.SIborder+12}

{if !empty($theme.params.bgIframe)}
  <style type="text/css">
    {literal}
    .iframeBackground {background: url('{/literal}{$imageURL_base}background/{$theme.params.bgIframe}{literal}.gif') repeat 0 1px !important;}
    {/literal}
  </style>
{/if}

{if !empty($theme.params.bgPP)}
  <style type="text/css">
    {literal}
    .PPBackground {background: url('{/literal}{$imageURL_base}background/{$theme.params.bgPP}{literal}.gif') repeat 0 1px !important;}
    {/literal}
  </style>
{/if}

{if ($interactiveframe  || !empty($theme.params.setiframe))}
  <table class="{if !empty($theme.params.bgIframe)}iframeBackground{/if} giInfo" style="background-color: {$frameColor}; color:{$frameFontColor}; text-align:center; font-family:{if $frameFont}{$frameFont},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSize};">
    <tr>
      <td>
	<table style="height:{$frameTheight}px; width:{$frameLwidth}px">
	  <tr>
	    <td>
	    </td>
	  </tr>
	</table>
      </td>
      <td class="xtremeFrameLink">
      {if $frameFreeText1 && $frameFreeText1pos == "topT"}
	<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
      {/if}
      {if $frameFreeText2 && $frameFreeText1pos == "topT"}
	<p style="{$frameFreeText2Style}">{$frameFreeText2}
	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	<br/>
	  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	    {$block.customfield.LoadCustomFields.fields.Link_Name}
	  {else}
	    {$block.customfield.LoadCustomFields.fields.Link_URL}
	  {/if}
	  </a>
	{/if}
	</p>
      {/if}
      {if $frameParentTitle == "top"}
	<div style="font-weight: bold; text-align: {$frameParentAlign};" class="giInfo">
	  <p style="color: {$frameFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent};{$frameStyleParent};"/>{$frameParentPS}&nbsp;
	  {$theme.parent.title}&nbsp;{$frameParentPS}
	</div>
      {/if}
      {if $frameItemTitle == "top"}
	<div style="text-align: {$frameTitleAlign};" class="giTitle">
	  <p style="font-weight: bold; color: {$frameFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
	</div>
      {/if}
      {if ($frameItemDescription == 'top') && empty($embedFlash)}
	<p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
      {/if}
      {if $frameFreeText1 && $frameFreeText1pos == "topB"}
	<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
      {/if}
      {if $frameFreeText2 && $frameFreeText2pos == "topB"}
	<p style="{$frameFreeText2Style}">{$frameFreeText2}
	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	<br/>
	  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	    {$block.customfield.LoadCustomFields.fields.Link_Name}
	  {else}
	    {$block.customfield.LoadCustomFields.fields.Link_URL}
	  {/if}
	  </a>
	{/if}
	</p>
      {/if}
      </td>
      <td>
	<table style="height:{$frameTheight}px; width:{$frameRwidth}px">
	  <tr>
	    <td>
	    </td>
	  </tr>
	</table>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="center">
{/if}{* /Interactive Frame *}

{* for video and audio *}
{if (($theme.item.mimeType.0 == "v") && ($theme.item.mimeType !='video/x-flv')) || !empty($audioItem)}{* for non flv video or audio *}
  {if $framePP}{* PassePartout *}
    <table class="{if !empty($theme.params.bgPP)}PPBackground{/if} giInfo" style="background-color: {$framePPColor}; color: {$framePPFontColor}; text-align:center; font-family: {if $frameFont}{$frameFont},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$framePPFontSize};">
      <tr>
        <td>
 	  <table style="height:{$framePPTheight}px; width:{$framePPLwidth}px">
	    <tr>
	      <td>
	      </td>
	    </tr>
	  </table>
        </td>
        <td class="xtremeFrameLink">
        {if $frameFreeText1 && $frameFreeText1pos == "PPtopT"}
	  <p style="{$frameFreeText1Style}"/>{$frameFreeText1}>
	{/if}
	{if $frameFreeText2 && $frameFreeText2pos == "PPtopT"}
	  <p style="{$frameFreeText2Style}">{$frameFreeText2}
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	  <br/>
	    <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	    {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	      {$block.customfield.LoadCustomFields.fields.Link_Name}
	    {else}
	      {$block.customfield.LoadCustomFields.fields.Link_URL}
	    {/if}
	    </a>
	  {/if}
	  </p>
	{/if}
	{if $frameParentTitle == "PPtop"}
	  <div style="text-align: {$frameParentAlign};"  class="giInfo">
	    <p style="font-weight: bold; color: {$framePPFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>{$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
	  </div>
        {/if}
	{if $frameItemTitle == "PPtop"}
	  <div style="text-align: {$frameTitleAlign};" class="giTitle">
	    <p style="font-weight: bold; color: {$framePPFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
	  </div>
        {/if}
        {if ($frameItemDescription == 'PPtop') && empty($embedFlash)}
	  <p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
	{/if}
	{if $frameFreeText1 && $frameFreeText1pos == "PPtopB"}
	  <p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	{/if}
	{if $frameFreeText2 && $frameFreeText2pos == "PPtopB"}
	  <p style="{$frameFreeText2Style}">{$frameFreeText2}
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	  <br/>
	    <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	    {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	      {$block.customfield.LoadCustomFields.fields.Link_Name}
	    {else}
	      {$block.customfield.LoadCustomFields.fields.Link_URL}
	    {/if}
	    </a>
	  {/if}
	  </p>
	{/if}
	</td>
	<td>
	  <table style="height:{$framePPTheight}px; width:{$framePPRwidth}px">
	    <tr>
	      <td>
	      </td>
	    </tr>
	  </table>
	</td>
      </tr>
      <tr>
        <td>
	</td>
	<td align="center">
  {/if}{* / PassePartout *}
	  {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%"}
  {if $framePP}{* PassePartout *}
	</td>
	<td>
	  <table style="height:{$framePPBheight}px; width:{$framePPLwidth}px">
	    <tr>
	      <td>
	      </td>
	    </tr>
	  </table>
        </td>
      </tr>
      <tr>
	<td style="height:{$framePPBheight}px">
	</td>
	<td class="xtremeFrameLink">
	{if $frameFreeText1 && $frameFreeText1pos == "PPbottomT"}
	  <p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	{/if}
	{if $frameFreeText2 && $frameFreeText2pos == "PPbottomT"}
	  <p style="{$frameFreeText2Style}">{$frameFreeText2}
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	  <br/>
	    <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	    {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	      {$block.customfield.LoadCustomFields.fields.Link_Name}
	    {else}
	      {$block.customfield.LoadCustomFields.fields.Link_URL}
	    {/if}
	    </a>
	  {/if}
	</p>
	{/if}
	{if $frameParentTitle == "PPbottom"}
	  <div style="text-align: {$frameParentAlign};" class="giInfo">
<p style="font-weight: bold; color: {$framePPFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>{$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
	  </div>
	{/if}
	{if $frameItemTitle == "PPbottom"}
	  <div style="text-align: {$frameTitleAlign};" class="giTitle">
<p style="font-weight: bold; color: {$framePPFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
	  </div>
	{/if}
	{if ($frameItemDescription == "PPbottom") && empty($embedFlash)}
	  <p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
	{/if}
	{if $frameFreeText1 && $frameFreeText1pos == "PPbottomB"}
	  <p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	{/if}
	{if $frameFreeText2 && $frameFreeText2pos == "PPbottomB"}
	  <p style="{$frameFreeText2Style}">{$frameFreeText2}
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	  <br/>
	    <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	    {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	      {$block.customfield.LoadCustomFields.fields.Link_Name}
	    {else}
	      {$block.customfield.LoadCustomFields.fields.Link_URL}
	    {/if}
	    </a>
	  {/if}
	</p>
	{/if}
	{if $frameCopyright == "PP"}
	  <p style="{$frameCopyrightStyle}"/>
	  <div style="{$frameCopyrightStyle}">
    	    {capture name=childTimestamp}{g->date timestamp=$item.originationTimestamp format=%Y}{/capture}
    	    {capture name=actualTimestamp}{g->date format=%Y}{/capture}
	    &copy;&nbsp;{$theme.item.owner.fullName|default:$theme.item.owner.userName}
	    {if $smarty.capture.childTimestamp != $smarty.capture.actualTimestamp}
	      ({g->text text="%s" arg1=$smarty.capture.childTimestamp}
	      -&nbsp;{g->text text="%s" arg1=$smarty.capture.actualTimestamp})
	    {else}
	      ({g->text text="%s" arg1=$smarty.capture.childTimestamp})
	    {/if}
	  </div>
	{/if}
	</td>
	<td>
	  <table style="height:{$framePPBheight}px; width:{$framePPRwidth}px">
	    <tr>
	      <td>
	      </td>
	    </tr>
	  </table>
        </td>
      </tr>
    </table>
  {/if}{* / PassePartout *}
{else}{* / video and audio *}
  {if isset($theme.photoFrame)}{* for image with Frame *}
    {g->container type="imageframe.ImageFrame" frame=$theme.photoFrame width=$frameModuleWidth height=$frameModuleHeight}
  	{if $framePP}{* PassePartout *}
	  <table class="{if !empty($theme.params.bgPP)}PPBackground{/if} giInfo" style="background-color: {$framePPColor}; color: {$framePPFontColor}; text-align:center; font-family: {if $frameFont}{$frameFont},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$framePPFontSize};">
	    <tr>
	      <td>
		<table style="height:{$framePPTheight}px; width:{$framePPLwidth}px">
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	      <td class="xtremeFrameLink">
	      {if $frameFreeText1 && $frameFreeText1pos == "PPtopT"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPtopT"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
	  	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	  	<br/>
	  	  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		    {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		      {$block.customfield.LoadCustomFields.fields.Link_Name}
		    {else}
		      {$block.customfield.LoadCustomFields.fields.Link_URL}
		    {/if}
		  </a>
		{/if}
	        </p>
	      {/if}
	      {if $frameParentTitle == "PPtop"}
		<div style="text-align: {$frameParentAlign};"  class="giInfo">
		  <p style="font-weight: bold; color: {$framePPFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>{$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
		</div>
	      {/if}
	      {if $frameItemTitle == "PPtop"}
		<div style="text-align: {$frameTitleAlign};" class="giTitle">
		  <p style="font-weight: bold; color: {$framePPFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
		</div>
	      {/if}
	      {if ($frameItemDescription == 'PPtop') && empty($embedFlash)}
		<p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
	      {/if}
	      {if $frameFreeText1 && $frameFreeText1pos == "PPtopB"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPtopB"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
	  	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		    {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
		{/if}
		</p>
	      {/if}
	      </td>
	      <td>
		<table style="height:{$framePPTheight}px; width:{$framePPRwidth}px">
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	    </tr>
	    <tr>
	      <td>
	      </td>
	      <td align="center">
  	{/if}{* / PassePartout *}
		{if ($theme.item.mimeType =='video/x-flv')}{* for flv video  *}
		  {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%"}
		{else}
					      <div style="position:relative; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px;">
				                {if !empty($theme.params.imageFadin) && empty($isPanoramaItem)}
					        <div class="gsSingleImage" id="gsSingleImageId" style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px; background-color: #000000;">
					          {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%" usemap="#fotomap"}
					          {if $theme.params.RightClick != "none" && $theme.params.NavOver != 'none' && $theme.params.NavOverLink != 'links' && $theme.params.NavOverLink != 'icons'}
					            <map id="fotomap" name="fotomap">
						      <area shape="rect" coords="0,0,{$imagewidth},{$imageheight}" alt=""/>
					            </map>
					          {/if}
					        {else}
						  {if $theme.item.mimeType.0 == "i" && $theme.params.NavOverLinks != 'links' && $theme.params.NavOverLink != 'icons'}
					        <div class="gsSingleImageNoF" style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px; background-color: #000000; background:url({g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.imageViews[$theme.imageViewsIndex].id`" forceFullUrl=true arg3="serialNumber=`$theme.imageViews[$theme.imageViewsIndex].serialNumber`"}) no-repeat">
						  {else}
					        <div style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px;">
					          {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%" usemap="#fotomap"}
					            {if $theme.params.RightClick != "none" && $theme.params.NavOver != 'none' && $theme.params.NavOverLink != 'links' && $theme.params.NavOverLink != 'icons'}
					              <map id="fotomap" name="fotomap">
						        <area shape="rect" coords="0,0,{$imagewidth},{$imageheight}" alt=""/>
					              </map>
					            {/if}
						  {/if}
					        {/if}
					        </div>
					        {if $theme.params.NavOverLink == 'links'}
					          <map id="fotomap" name="fotomap">
						  {if !empty ($backImage)}
						    <area shape="rect" coords="0,0,{$navwidth},{$imageheight}" alt="{g->text text='PREVIOUS'}" title="{g->text text='PREVIOUS'}" href="{g->url params=$backImage.urlParams}"/>
					          {/if}
						  {if isset ($theme.permissions.core_viewSource) && ($theme.params.NavOverPop != "none") && !empty($theme.sourceImage.width) && (($imagewidth != $theme.item.width) || ($theme.params.NavOverPop == "even"))}
						    <area shape="rect" coords="{$navwidth},0,{$nextpos},{$imageheight}" alt="{g->text text='Full Image Popup'}" href="javascript:void(0)" onclick="fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;" title="{g->text text='Full Image Popup'}"/>
					          {/if}
						  {if !empty ($nextImage)}
						    <area shape="rect" coords="{$nextpos},0,{$imagewidth},{$imageheight}" alt="{g->text text='NEXT'}" title="{g->text text='NEXT'}" href="{g->url params=$nextImage.urlParams}"/>
					          {/if}
					          </map>
				                {/if}
		            		  	{if $theme.params.NavOverLink == 'icons' && $theme.params.NavOver != 'none'}
						  {if !empty ($backImage)}
						    <a class="hoverNav" title="{g->text text='PREVIOUS'}" href="{g->url params=$backImage.urlParams}">
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'top'}
						      <span style="position:absolute; top:0px; left:0px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/back.gif'}) left top no-repeat;"></span>
						    {/if}
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'bottom'}
						      <span style="position:absolute; top:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}0{/if}px; left:0px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/back.gif'}) left bottom no-repeat;"></span>
						    {/if}
						    </a>
						  {/if}
					          {if isset ($theme.permissions.core_viewSource) && ($theme.params.NavOverPop != "none") && !empty($theme.sourceImage.width) && (($imagewidth != $theme.item.width) || ($theme.params.NavOverPop == "even"))}
						    <a class="hoverNav" href="javascript:void(0)" onclick="fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;" title="{g->text text='Full Image Popup'}">
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'top'}
						      <span style="position:absolute; top:0px; left:{$imagewidth/3}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/fullsize.gif'}) center top no-repeat;"></span>
						    {/if}
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'bottom'}
						      <span style="position:absolute; top:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}0{/if}px; left:{$imagewidth/3}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/fullsize.gif'}) center bottom no-repeat;"></span>
						    {/if}
						    </a>
				                  {/if}
						  {if !empty ($nextImage)}
						    <a class="hoverNav" title="{g->text text='NEXT'}" href="{g->url params=$nextImage.urlParams}">
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'top'}
						      <span style="position:absolute; top:0px; left:{$nextpos}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/next.gif'}) right top no-repeat;"></span>
						    {/if}
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'bottom'}
						      <span style="position:absolute; top:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}0{/if}px; left:{$nextpos}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/next.gif'}) right bottom no-repeat;"></span>
						    {/if}
						    </a>
						  {/if}
					        {/if}
					        {if ($theme.params.NavOver != 'none') && ($theme.params.NavOverLink != 'links') && ($theme.params.NavOverLink != 'icons') && empty($isPanoramaItem)}
					          {g->theme include='photoNavOver.tpl'}
					        {/if}
					      </div>
		{/if}
 	{if $framePP}{* PassePartout *}
	      </td>
	      <td>
		<table style="height:{$framePPBheight}px; width:{$framePPLwidth}px">
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	    </tr>
	    <tr>
	      <td style="height:{$framePPBheight}px">
	      </td>
	      <td class="xtremeFrameLink">
	      {if $frameFreeText1 && $frameFreeText1pos == "PPbottomT"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPbottomT"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
		{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		    {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
 		{/if}
		</p>
	      {/if}
	      {if $frameParentTitle == "PPbottom"}
		<div style="text-align: {$frameParentAlign};" class="giInfo">
<p style="font-weight: bold; color: {$framePPFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>{$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
		</div>
	      {/if}
	      {if $frameItemTitle == "PPbottom"}
		<div style="text-align: {$frameTitleAlign};" class="giTitle">
<p style="font-weight: bold; color: {$framePPFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
		</div>
	      {/if}
	      {if ($frameItemDescription == "PPbottom") && empty($embedFlash)}
		<p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
	      {/if}
	      {if $frameFreeText1 && $frameFreeText1pos == "PPbottomB"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPbottomB"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
	  	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	            {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
		{/if}
		</p>
	      {/if}
	      {if $frameCopyright == "PP"}
		<p style="{$frameCopyrightStyle}"/>
		<div style="{$frameCopyrightStyle}">
    		  {capture name=childTimestamp}{g->date timestamp=$item.originationTimestamp format=%Y}{/capture}
    		  {capture name=actualTimestamp}{g->date format=%Y}{/capture}
		  &copy;&nbsp;{$theme.item.owner.fullName|default:$theme.item.owner.userName}
		  {if $smarty.capture.childTimestamp != $smarty.capture.actualTimestamp}
		      ({g->text text="%s" arg1=$smarty.capture.childTimestamp}
		    -&nbsp;{g->text text="%s" arg1=$smarty.capture.actualTimestamp})
		  {else}
		    ({g->text text="%s" arg1=$smarty.capture.childTimestamp})
		  {/if}
		</div>
	      {/if}
	      </td>
	      <td>
		<table style="height:{$framePPBheight}px; width:{$framePPRwidth}px">
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	    </tr>
	  </table>
  	{/if}{* / PassePartout *}
	{/g->container}
  {else}{* no photo Frame *}
  	{if $framePP}{* PassePartout *}
	  <table class="{if $theme.params.bgPP != 'none'}PPBackground{/if} giInfo" style="background-color: {$framePPColor}; color: {$framePPFontColor}; text-align:center; font-family: {if $frameFont}{$frameFont},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$framePPFontSize};">
	    <tr>
	      <td>
		<table style="height:{$framePPTheight}px; width:{$framePPLwidth}px">
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	      <td class="xtremeFrameLink">
	      {if $frameFreeText1 && $frameFreeText1pos == "PPtopT"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPtopT"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
		{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		    {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
		{/if}
		</p>
	      {/if}
	      {if $frameParentTitle == "PPtop"}
		<div style="text-align: {$frameParentAlign};" class="giInfo">
		  <p style="font-weight: bold; color: {$framePPFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>{$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
		</div>
	      {/if}
	      {if $frameItemTitle == "PPtop"}
		<div style="text-align: {$frameTitleAlign};" class="giTitle">
		  <p style="font-weight: bold; color: {$framePPFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
		</div>
	      {/if}
	      {if ($frameItemDescription == 'PPtop') && empty($embedFlash)}
		<p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
	      {/if}
	      {if $frameFreeText1 && $frameFreeText1pos == "PPtopB"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPtopB"}
	 	<p style="{$frameFreeText2Style}">{$frameFreeText2}
		{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		    {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
		{/if}
		</p>
	      {/if}
	      </td>
	      <td>
		<table style="height:{$framePPTheight}px; width:{$framePPRwidth}px">
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	    </tr>
	    <tr>
	      <td>
	      </td>
	      <td align="center">
        {/if}{* / PassePartout *}
		{if ($theme.item.mimeType =='video/x-flv')}{* for flv video  *}
		  {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%"}
		{else}
					      <div style="position:relative; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px;">
				                {if !empty($theme.params.imageFadin) && empty($isPanoramaItem)}
					        <div class="gsSingleImage" id="gsSingleImageId" style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px; background-color: #000000;">
					          {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%" usemap="#fotomap"}
					          {if $theme.params.RightClick != "none" && $theme.params.NavOver != 'none' && $theme.params.NavOverLink != 'links' && $theme.params.NavOverLink != 'icons'}
					            <map id="fotomap" name="fotomap">
						      <area shape="rect" coords="0,0,{$imagewidth},{$imageheight}" alt=""/>
					            </map>
					          {/if}
					        {else}
						  {if $theme.item.mimeType.0 == "i" && $theme.params.NavOverLinks != 'links' && $theme.params.NavOverLink != 'icons'} 
					        <div class="gsSingleImageNoF" style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px; background-color: #000000; background:url({g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.imageViews[$theme.imageViewsIndex].id`" forceFullUrl=true arg3="serialNumber=`$theme.imageViews[$theme.imageViewsIndex].serialNumber`"}) no-repeat">
						  {else}
					        <div style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px;">
					          {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%" usemap="#fotomap"}
					            {if $theme.params.RightClick != "none" && $theme.params.NavOver != 'none' && $theme.params.NavOverLink != 'links' && $theme.params.NavOverLink != 'icons'}
					              <map id="fotomap" name="fotomap">
						        <area shape="rect" coords="0,0,{$imagewidth},{$imageheight}" alt=""/>
					              </map>
					            {/if}
						  {/if}
					        {/if}
					        </div>
					        {if $theme.params.NavOverLink == 'links'}
					          <map id="fotomap" name="fotomap">
						  {if !empty ($backImage)}
						    <area shape="rect" coords="0,0,{$navwidth},{$imageheight}" alt="{g->text text='PREVIOUS'}" title="{g->text text='PREVIOUS'}" href="{g->url params=$backImage.urlParams}"/>
					          {/if}
						  {if isset ($theme.permissions.core_viewSource) && ($theme.params.NavOverPop != "none") && !empty($theme.sourceImage.width) && (($imagewidth != $theme.item.width) || ($theme.params.NavOverPop == "even"))}
						    <area shape="rect" coords="{$navwidth},0,{$nextpos},{$imageheight}" alt="{g->text text='Full Image Popup'}" href="javascript:void(0)" onclick="fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;" title="{g->text text='Full Image Popup'}"/>
					          {/if}
						  {if !empty ($nextImage)}
						    <area shape="rect" coords="{$nextpos},0,{$imagewidth},{$imageheight}" alt="{g->text text='NEXT'}" title="{g->text text='NEXT'}" href="{g->url params=$nextImage.urlParams}"/>
					          {/if}
					          </map>
				                {/if}
		            		  	{if $theme.params.NavOverLink == 'icons' && $theme.params.NavOver != 'none'}
						  {if !empty ($backImage)}
						    <a class="hoverNav" title="{g->text text='PREVIOUS'}" href="{g->url params=$backImage.urlParams}">
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'top'}
						      <span style="position:absolute; top:0px; left:0px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/back.gif'}) left top no-repeat;"></span>
						    {/if}
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'bottom'}
						      <span style="position:absolute; top:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}0{/if}px; left:0px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/back.gif'}) left bottom no-repeat;"></span>
						    {/if}
						    </a>
						  {/if}
					          {if isset ($theme.permissions.core_viewSource) && ($theme.params.NavOverPop != "none") && !empty($theme.sourceImage.width) && (($imagewidth != $theme.item.width) || ($theme.params.NavOverPop == "even"))}
						    <a class="hoverNav" href="javascript:void(0)" onclick="fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;" title="{g->text text='Full Image Popup'}">
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'top'}
						      <span style="position:absolute; top:0px; left:{$imagewidth/3}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/fullsize.gif'}) center top no-repeat;"></span>
						    {/if}
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'bottom'}
						      <span style="position:absolute; top:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}0{/if}px; left:{$imagewidth/3}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/fullsize.gif'}) center bottom no-repeat;"></span>
						    {/if}
						    </a>
				                  {/if}
						  {if !empty ($nextImage)}
						    <a class="hoverNav" title="{g->text text='NEXT'}" href="{g->url params=$nextImage.urlParams}">
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'top'}
						      <span style="position:absolute; top:0px; left:{$nextpos}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/next.gif'}) right top no-repeat;"></span>
						    {/if}
						    {if $theme.params.NavOver == 'both' || $theme.params.NavOver == 'bottom'}
						      <span style="position:absolute; top:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}0{/if}px; left:{$nextpos}px; width:{$imagewidth/3}px; height:{if $theme.params.NavOver == 'both'}{$imageheight/2}{else}{$imageheight}{/if}px; background: url({g->theme url='images/next.gif'}) right bottom no-repeat;"></span>
						    {/if}
						    </a>
						  {/if}
					        {/if}
					        {if ($theme.params.NavOver != 'none') && ($theme.params.NavOverLink != 'links') && ($theme.params.NavOverLink != 'icons') && empty($isPanoramaItem)}
					          {g->theme include='photoNavOver.tpl'}
					        {/if}
					      </div>
        {if $framePP}{* PassePartout *}
	      </td>
	      <td>
	      </td>
	    </tr>
	    <tr>
	      <td style="height:{$framePPBheight}px">
		<table style="height:{$framePPBheight}px; width:{$framePPLwidth}px">
	  	  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	      <td class="xtremeFrameLink">
	      {if $frameFreeText1 && $frameFreeText1pos == "PPbottomT"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPbottomT"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
		{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		    {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
		{/if}
		</p>
	      {/if}
	      {if $frameParentTitle == "PPbottom"}
		<div style="text-align: {$frameParentAlign};" class="giInfo">
		  <p style="font-weight: bold; color: {$framePPFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>{$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
		</div>
	      {/if}
	      {if $frameItemTitle == "PPbottom"}
		<div style="text-align: {$frameTitleAlign};" class="giTitle">
		  <p style="font-weight: bold; color: {$framePPFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>{$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
		</div>
	      {/if}
	      {if ($frameItemDescription == "PPbottom") && empty($embedFlash)}
		<p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
	      {/if}
	      {if $frameFreeText1 && $frameFreeText1pos == "PPbottomB"}
		<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
	      {/if}
	      {if $frameFreeText2 && $frameFreeText2pos == "PPbottomB"}
		<p style="{$frameFreeText2Style}">{$frameFreeText2}
		{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
		<br/>
		  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
		  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
		    {$block.customfield.LoadCustomFields.fields.Link_Name}
		  {else}
		    {$block.customfield.LoadCustomFields.fields.Link_URL}
		  {/if}
		  </a>
		{/if}
		</p>
	      {/if}
	      {if $frameCopyright == "PP"}
		<p style="{$frameCopyrightStyle}"/>
		<div style="{$frameCopyrightStyle}">
		  &copy;{$theme.item.owner.fullName|default:$theme.item.owner.userName}
		  {g->text text="-"}
		  {capture name=childTimestamp}{g->date timestamp=$item.originationTimestamp format=%Y}{/capture}
		  {g->text text="%s" arg1=$smarty.capture.childTimestamp}
		</div>
	      {/if}
	      </td>
	      <td>
		<table style="height:{$framePPBheight}px; width:{$framePPRwidth}px" border=1>
		  <tr>
		    <td>
		    </td>
		  </tr>
		</table>
	      </td>
	    </tr>
	  </table>
        {/if}{* / PassePartout *}
{/if}{* / for image with Frame *}
{/if}{* / for image *}

{if ($interactiveframe  || $theme.params.setiframe)}{* Interactive Frame *}
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td style="height:{$frameBheight}px">
      </td>
      <td class="xtremeFrameLink">
      {if $frameFreeText1 && $frameFreeText1pos == "bottomT"}
	<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
      {/if}
      {if $frameFreeText2 && $frameFreeText2pos == "bottomT"}
	<p style="{$frameFreeText2Style}">{$frameFreeText2}
	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	<br/>
	  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	    {$block.customfield.LoadCustomFields.fields.Link_Name}
	  {else}
	    {$block.customfield.LoadCustomFields.fields.Link_URL}
	  {/if}
	  </a>
	{/if}
	</p>
      {/if}
      {if $frameParentTitle == "bottom"}
	<div style=" text-align:{$frameParentAlign};" class="giInfo">
	  <p style="font-weight: bold; color: {$frameFontColorParent}; font-family: {if $frameFontParent}{$frameFontParent},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeParent}; letter-spacing:{$frameFontSpacingParent}; {$frameStyleParent}"/>
	  {$frameParentPS}&nbsp;{$theme.parent.title}&nbsp;{$frameParentPS}
	</div>
      {/if}
      {if $frameItemTitle == "bottom"}
	<div style="text-align: {$frameTitleAlign}" class="giTitle">
	  <p style="font-weight: bold; color: {$frameFontColorTitle}; font-family: {if $frameFontTitle}{$frameFontTitle},{/if}Verdana, Arial, Helvetica, sans-serif; font-size: {$frameFontSizeTitle}; letter-spacing:{$frameFontSpacingTitle}; {$frameStyleTitle}"/>
	  {$frameTitlePS}&nbsp;{$theme.item.title}&nbsp;{$frameTitlePS}
	</div>
      {/if}
      {if ($frameItemDescription == "bottom") && empty($embedFlash)}
	<p style="text-align: {$frameDescriptionAlign}; {$frameDescriptionStyle};"/>{$theme.item.description|markup}
      {/if}
      {if $frameFreeText1 && $frameFreeText1pos == "bottomB"}
	<p style="{$frameFreeText1Style}"/>{$frameFreeText1}
      {/if}
      {if $frameFreeText2 && $frameFreeText2pos == "bottomB"}
	<p style="{$frameFreeText2Style}">{$frameFreeText2}
	{if !empty($block.customfield.LoadCustomFields.fields.Link_URL)}
	<br/>
	  <a href="{$block.customfield.LoadCustomFields.fields.Link_URL}" target="new">
	  {if !empty($block.customfield.LoadCustomFields.fields.Link_Name)}
	    {$block.customfield.LoadCustomFields.fields.Link_Name}
	  {else}
	    {$block.customfield.LoadCustomFields.fields.Link_URL}
	  {/if}
	  </a>
	{/if}
	</p>
      {/if}
      {if $frameCopyright =="frame"}
	<p style="{$frameCopyrightStyle}"/>
	<div style="{$frameCopyrightStyle}">
	  &copy;{$theme.item.owner.fullName|default:$theme.item.owner.userName}
	  {g->text text="-"}
	  {capture name=childTimestamp}{g->date timestamp=$item.originationTimestamp format=%Y}{/capture}
	  {g->text text="%s" arg1=$smarty.capture.childTimestamp}
	</div>
      {/if}
      </td>
      <td>
      </td>
    </tr>
  </table>
{/if}{* /Interactive Frame *}