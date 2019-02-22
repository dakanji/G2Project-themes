{*
 * $Revision: 1544 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
{assign var='showMicroThumbs' value=$theme.params.showMicroThumbs|default:1}


{* check for embedflash *}
{assign var='embedcheck' value=`$theme.item.description.1``$theme.item.description.2``$theme.item.description.3``$theme.item.description.4``$theme.item.description.5``$theme.item.description.7``$theme.item.description.8``$theme.item.description.9``$theme.item.description.10``$theme.item.description.11`}

{if $embedcheck == 'embedFlash'}
{assign var='embedFlash' value='1'}
{/if}

{* check for audio *}
{assign var='audiocheck' value=`$theme.item.mimeType.0``$theme.item.mimeType.1``$theme.item.mimeType.2``$theme.item.mimeType.3``$theme.item.mimeType.4`}

{if $audiocheck == 'audio'}
{assign var='audioItem' value='1'}
{/if}


{* set variables for image dimensions *}
{if !empty($theme.imageViews)}
{assign var='image' value=$theme.imageViews[$theme.imageViewsIndex]}
  {if !empty($theme.panoramaItem)}
    {if $theme.panoramaWidth < $theme.imageViews[$theme.imageViewsIndex].width}
      {assign var='imagewidth' value=$theme.panoramaWidth}
      {assign var='imageheight' value=$theme.imageViews[$theme.imageViewsIndex].height+17}
      {assign var='isPanoramaItem' value=1}
    {else}
      {assign var='imagewidth' value=$theme.imageViews[$theme.imageViewsIndex].width}
      {assign var='imageheight' value=$theme.imageViews[$theme.imageViewsIndex].height}
      {assign var='isPanoramaItem' value=0}
    {/if}
  {else}
    {assign var='imagewidth' value=$theme.imageViews[$theme.imageViewsIndex].width}
    {assign var='imageheight' value=$theme.imageViews[$theme.imageViewsIndex].height}
  {/if}
{/if}
{assign var='frameModuleWidth' value=$imagewidth+$theme.params.SIborder+$theme.params.SIborder}
{assign var='frameModuleHeight' value=$imageheight+$theme.params.SIborder+$theme.params.SIborder}


{assign var="nextImage" value=$theme.navigator.next}
{assign var="backImage" value=$theme.navigator.back}

{assign var="navwidth" value=$imagewidth/3|string_format:'%d'}
{assign var="nextpos" value=$navwidth*2}

{*
 * Display New window width full size image Popup *
 *}

{if $theme.params.NavOverPop !='none'}
  {literal}
  <script type="text/JavaScript">
  //<![CDATA[
  <!--
  function fsizeopen(url,title){
    {/literal}
    {if !empty($theme.params.colorpack)}
    {literal}
      cssCP = {/literal}"<link rel='stylesheet' type='text/css' href='{g->url href='modules/colorpack/packs/'}{$theme.params.colorpack}/color.css'>"
    {/if}{literal};

  css = {/literal}"<link rel='stylesheet' type='text/css' href='{g->theme url='theme.css'}'>"{literal};
  witem = {/literal}{$theme.sourceImage.width}{literal};
  hitem = {/literal}{$theme.sourceImage.height}{literal};
  wscreen = screen.width;
  hscreen = screen.height;

  titlesite = {/literal}"{if !empty($theme.item.title) && !empty($theme.params.site)}{$theme.params.site}-{/if}"{literal};
  titleparent = {/literal}"{if !empty($theme.parent.title)}{$theme.parent.title}{/if}"{literal};
  titleitem = {/literal}"{if !empty($theme.item.title)}{$theme.item.title}{/if}"{literal};
  summary = {/literal}"{if !empty($theme.item.summary)}<P style='text-align:center;'>{$theme.item.summary}<\/P>{/if}"{literal};
  separator = {/literal}"{if !empty($theme.params.separator)}&nbsp;{$theme.params.separator}&nbsp;{/if}"{literal};
  separatorparent = {/literal}"{if !empty($theme.params.separator) && !empty($theme.parent.title)}{$theme.params.separator}&nbsp;{/if}"{literal};

  var win = window.open(url,
  'popup',
  'width=' + wscreen + ', height=' + hscreen + ', ' +
  'location=no, menubar=no, ' +
  'status=no, toolbar=no, scrollbars=yes, resizable=no');
  win.moveTo(0,0);
  win.resizeTo(wscreen, hscreen);
  win.focus();
  win.document.write("<!DOCTYPE html PUBLIC \"-\/\/W3C\/\/DTD HTML 4.01 Transitional\/\/EN\" \"http:\/\/www.w3.org\/TR\/html4\/loose.dtd\">");
  win.document.write("<HEAD><TITLE>");

  win.document.write(titlesite);
  win.document.write(titleitem);
  win.document.write("<\/TITLE><meta http-equiv='imagetoolbar' content='no'>");
  {/literal}
  {if !empty($theme.params.colorpack)}{literal}
  win.document.write(cssCP);
  {/literal}
  {/if}{literal}
  win.document.write(css);
  win.document.write("<\/HEAD><BODY ");
  {/literal}
  {if $theme.params.RightClick != "none" && $theme.params.RightClick != "sidebarrc"}{literal}
  win.document.write("oncontextmenu='return false' ");{/literal}
  {/if}{literal}
  win.document.write("class='gallery' style='margin:0;padding:0'>");
  win.document.write("<DIV id='gallery' style='margin:0;padding:0;text-align:center;'>");
  win.document.write("<H2 style='text-align:center;'>");
  win.document.write(titleparent);
  win.document.write(separatorparent);
  win.document.write(titleitem);
  win.document.write("<\/H2>");
  win.document.write(summary);

  if (witem > wscreen) {
  win.document.write("<DIV style='position: absolute; top:10; left:10'><A href='javascript:void(0)' onclick='photo.width=");
  win.document.write(witem);
  win.document.write(";photo.height=");
  win.document.write(hitem);
  win.document.write("'>Full Size<\/A>");
  win.document.write(separator);
  win.document.write("<A href='javascript:void(0)' onclick='photo.width=");
  win.document.write(wscreen-30);
  win.document.write(";photo.height=");
  win.document.write(Math.round(((wscreen-30)/witem)*hitem));
  win.document.write("'>Screen Size<\/A> image<BR\/><\/DIV><BR\/>");
;}

  win.document.write("<IMG id='photo' alt='click to close' style='cursor: pointer; cursor: hand;' src='");
  win.document.write(url);
  win.document.write("' width='");
  if (witem > wscreen){win.document.write(wscreen-30);}else{win.document.write(witem);}
  win.document.write("' height='");
  if (witem > wscreen){win.document.write(Math.round(((wscreen-30)/witem)*hitem));}else{win.document.write(hitem);}

  {/literal}
  {if $theme.params.RightClick != "none"}
  {literal}
  win.document.write("' usemap='#fotomap'\/>");
  win.document.write("<MAP id='fotomap' name='fotomap'>");
  win.document.write("<AREA shape='rect' coords='0,0,");
  win.document.write(witem);
  win.document.write(",");
  win.document.write(hitem);
  win.document.write("' title='click to close' onclick='javascript:window.close();' alt='click to close'>");
  win.document.write("<\/MAP>");
  {/literal}
  {else}
  {literal}
  win.document.write("' onclick='javascript:window.close();' \/>");
  {/literal}
  {/if}
  {literal}
  win.document.write("<\/DIV><\/BODY><\/HTML>");
  win.document.close();
}

          //-->
          //]]>
          </script>
        {/literal}
{/if}
{*
 * / Display New window width full size image Popup *
 *}

<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tr valign="top">
    <td valign="top">

    {* sidebar *}
    {if !empty($theme.params.sidebarBlocks)}
      {if $sidebar== 'static'}
      <table style="text-align:left">
        <tr valign="top">
          <td>
	  {g->theme include="sidebar.tpl"}
          </td>
        </tr>
      </table>
      {/if}
      {if $sidebar == 'floating'}
	{literal}
    	<script type="text/JavaScript">
      	//<![CDATA[
      	<!--
	divSidebar = {/literal}"<div id=\"floatingSidebar\" onmousedown=\"dragStart(event, 'floatingSidebar')\" class=\"BlockOpacity\" style=\"cursor:move;\">"{literal};
	function sidebarT(){document.write(divSidebar);}
	sidebarT();
      	//-->
      	//]]>
    	</script>
 	{/literal}

      <table>
	<tr>
	  <td>

	{literal}
	<script type="text/JavaScript">
	//<![CDATA[
	<!--
	divSidebarClose = {/literal}"<table class=\"gcBorder2 gcBackground2\"><tr><td class=\"gcBorder1 gcBackground1\"><div onmousedown=\"dragStart(event, 'floatingSidebar')\" class=\"BlockMove\" style=\"text-align:right\"><a onmouseover=\"toggleLyr('floatingSidebar')\" title=\"{g->text text='Close'}\" class=\"icon tLink-close\"><img src='{$imageURL_base}blank.gif' alt='{g->text text='Close'}'\/><\/a><\/div><\/td><\/tr><tr><td class=\"gcBorder1\">"{literal};
	function sidebarClose(){document.write(divSidebarClose);}
	sidebarClose();
	//-->
	//]]>
	</script>
	{/literal}
	  {g->theme include="sidebar.tpl"}
	{literal}
	<script type="text/JavaScript">
        //<![CDATA[
        <!--
	divSidebarCloseEnd = {/literal}"<\/td><\/tr><\/table>"{literal};
	function sidebarCloseEnd(){document.write(divSidebarCloseEnd);}
	sidebarCloseEnd();
        //-->
        //]]>
        </script>
        {/literal}

          </td>
	</tr>
      </table>

	{literal}
	<script type="text/JavaScript">
        //<![CDATA[
        <!--
	divSidebarEnd = {/literal}"<\/div>"{literal};
	function sidebarEnd(){document.write(divSidebarEnd);}
	sidebarEnd();
        //-->
        //]]>
        </script>
        {/literal}

      {/if}

    <script type="text/javascript">
      {* hide the sidebar if there's nothing in it *}
      // <![CDATA[
      var el = document.getElementById("floatingSidebar");

      {* fix this ---  var text = el.innerText;  // IE  *}
      var text = 'unknown';
      if (el) text = el.innerText; // IE

      if (!text) text = el.textContent; // Firefox
      if (!text || !text.match(/\S/)) el.style.display = 'none';
      // ]]>
    </script>

    </td>
    <td valign="top">
    {/if}
    {* /sidebar *}

      <table class="gcBackground1 gcBorder2" align="center" style="width:92%; text-align:center;">
        <tr>
	  <td>
	    <table class="gcBorder1" align="center" style="width:100%; text-align:center;">
      	      <tr>
        	<td style="vertical-align:top;" align="center">
            	  <div id="gsContent">

{*
 * Show Title, Description, Info, Size, Navigation pics *
 *}
 	            <table style="width:98%" class="gcBorder1Top" align="center" border="0">
                      <tr>
			{if ($theme.params.topNavPics == 'left' || $theme.params.topNavPics == 'leftNN')}
                        <td style="width: 27%; text-align:left; vertical-align:top;">
	                  {g->theme include='navigatorTop.tpl'}
                        </td>
                        <td style="width: 1%; text-align:left; vertical-align:top;">
                        </td>
			{/if}
                        <td style="width: {if $theme.params.PInfo == 'top'}60{else}72{/if}%; vertical-align:top">
                          <table style="height:25px; width:100%">
                            <tr>
                              <td style="vertical-align:top; text-align:left;">
				{if (($theme.params.PTitle == 'topL') || ($theme.params.PTitle == 'topR')) && !empty($theme.item.title)}
                            	<h2 {if ($theme.params.PTitle == 'topR')}style="text-align:right"{/if}>
				  {$theme.item.title|markup}
				</h2>
				{/if}

				{if (($theme.params.PDescription == 'topL') || ($theme.params.PDescription == 'topR')) && !empty($theme.item.description) && empty($embedFlash)}
                            	<p class="giDescription" {if ($theme.params.PDescription == 'topR')}style="text-align:right"{/if}>
                              	  {$theme.item.description|markup}
                            	</p>
				{/if}
                              </td>
                            </tr>
                          </table>
                        </td>
	                <td style="text-align:left" valign="top">
        	          <table border="0">
                	    <tr>
                       	      <td>
			      {if ($theme.params.PInfo == 'top')}
                	          {g->block type="core.ItemInfo"
                        	  	item=$theme.item
					showDate=$theme.params.PDate
	                          	showOwner=$theme.params.showImageOwner
	  	                  	showViewCount=$theme.params.PViewCount
        	                   	class="giInfo"}

			        {if ($theme.params.InfoSize != 'none')}
			          {if ($theme.params.PopSize != 'none')}
                                    {g->theme include="photoSizes.tpl" class="giInfo"}
			          {else}
                                    {g->block type="core.PhotoSizes" class="giInfo"}
			          {/if}
			        {/if}
			      {/if}
                              </td>
                            </tr>

			    {* ratings - in order to work must add "Rating interface" block to show on photo pages*}
			    {if !empty($rating) && ($theme.params.PRating  == 'top') && isset ($theme.permissions.rating_view) && $showblockRating == '1'}
			      {assign var=item value=$theme.item}
		      	      {g->callback type="rating.LoadRating" itemId=$item.id}
			      {if !empty($block.rating.RatingData)}
                     	    <tr>
                              <td style="text-align:center">
                                <table align="center">
			          <tr>
			            <td>
                          	      {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
					RatingData=$block.rating.RatingData
					RatingSummary=$block.rating.RatingSummary
		                        l10Domain="modules_rating"}
        	                    </td>
				  </tr>
				</table>
	                      </td>
           	            </tr>
			      {/if}
		            {/if}
			    {* / ratings *}
                 	  </table>
	                </td> 
			{if ($theme.params.topNavPics == 'right' || $theme.params.topNavPics == 'rightNN')}
                    	<td style="width: 1%; text-align:left; vertical-align:top">
                    	</td>
                    	<td style="width: 27%; text-align:right; vertical-align:top">
                       	  {assign var='photoItem' value='1'}
                          {g->theme include='navigatorTop.tpl'}
                    	</td>
			{/if}
                      </tr>
                    </table>

{*
 * / Show Title, Description, Info, Size, Navigation pics *
 *}

	            <table id="photo" align="center" style="width:98%" border="0">
         	      <tr>
			{* for showing micro thumbs at the left side off the image *}
			{if (($theme.params.MTposition == 'left') && !empty($showMicroThumbs)) || ($theme.params.PTitle == 'leftT') || ($theme.params.PDescription == 'leftT') || ($theme.params.PInfo == 'leftT')  || ($theme.params.PTitle == 'leftB') || ($theme.params.PDescription == 'leftB') || ($theme.params.PInfo == 'leftB') || ((($theme.params.PRating  == 'leftT') || ($theme.params.PRating  == 'leftB')) && isset ($theme.permissions.rating_view) && $showblockRating == '1')}
			<td valign="top" style="text-align:center; width:30%">
                    	  <table align="center" style="width:100%">
 			    {if ($theme.params.PTitle == 'leftT') && !empty($theme.item.title)}
	                    <tr>
                              <td style="text-align:left" valign="top">
                                <br/>
                                <h2> {$theme.item.title|markup} </h2>
                              </td>
                      	    </tr>
			    {/if}
  			    {if ($theme.params.PDescription == 'leftT') && !empty($theme.item.description) && empty($embedFlash)}
                      	    <tr>
                              <td style="text-align:left" valign="top">
                          	<p class="giDescription">
                              	  {$theme.item.description|markup}
                          	</p>
                      	      </td>
                      	    </tr>
			    {/if}
			    {if ($theme.params.PInfo == 'leftT')}
                      	    <tr>
                      	      <td style="text-align:left" valign="top">
                     	        <table align="center">
                      		  <tr>
                             	    <td>
                	              {g->block type="core.ItemInfo"
						item=$theme.item
						showDate=$theme.params.PDate
		                          	showOwner=$theme.params.showImageOwner
		  	                  	showViewCount=$theme.params.PViewCount
	        	                   	class="giInfo"}

				    {if ($theme.params.InfoSize != 'none')}
				      {if ($theme.params.PopSize != 'none')}
					{g->theme include='photoSizes.tpl' class="giInfo"}
				      {else}
					{g->block type="core.PhotoSizes" class="giInfo"}
				      {/if}
				    {/if}
	                            </td>
	                          </tr>
	                        </table>
	                      </td>
	                    </tr>
			    {/if}
			    {* ratings *}
			    {if !empty($rating) && ($theme.params.PRating  == 'leftT') && isset ($theme.permissions.rating_view) && $showblockRating == '1'}
	                    <tr>
	                      <td style="text-align:center">
	                        <table align="center">
				  <tr>
				    <td>
	                              {assign var=item value=$theme.item}
	                              {g->callback type="rating.LoadRating" itemId=$item.id}
	          	              {if !empty($block.rating.RatingData)}
		                      <div style="border:1px; text-align:left" class="{$class}">
		                        {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
		                              RatingData=$block.rating.RatingData
		                              RatingSummary=$block.rating.RatingSummary
		                    	      l10Domain="modules_rating"}
		                      </div>
	               	              {/if}
		              	    </td>
				  </tr>
				</table>
	                      </td>
	                    </tr>
			    {/if}
			    {* / ratings *}
			    {if ($theme.params.PInfo == 'leftT')}
			    <tr>
			      <td>
			        <table align="left">
			          <tr>
			  	    <td style="height:15px">
				    </td>
				  </tr>
			          {foreach from=$theme.params.photoSideBlocks item=block}
			          <tr>
			            <td>
			 	      <div id="gsSideBlocks" style="width:{$tableThumbs}px; text-align:{if $block.0 == 'imageblock.ImageBlock'}center{else}left{/if};">
			 	        {g->block type=$block.0 params=$block.1}
				      </div>
			            </td>
			          </tr>
			          {/foreach}
			        </table>
			      </td>
			    </tr>
			    {/if}
		  	    {if ($theme.params.MTposition == 'left') && !empty($showMicroThumbs)}
			      {if (($theme.params.PTitle == 'leftT') && !empty($theme.item.title)) || (($theme.params.PDescription == 'leftT') && !empty($theme.item.description) && empty($embedFlash)) || ($theme.params.PInfo == 'leftT') || (!empty($rating) && ($theme.params.PRating  == 'leftT') && isset ($theme.permissions.rating_view) && $showblockRating == '1')}
			      {/if}
	                    <tr>
	                      <td style="text-align:center" valign="top">
				<table align="center">
				  <tr>
				    <td>
	                              {g->theme include='navigatorThumbs.tpl'}
				    </td>
				  </tr>
				</table>
	                      </td>
	                    </tr>
			    {/if}
			    {if ($theme.params.PTitle == 'leftB') && !empty($theme.item.title)}
                      	    <tr>
	                      <td style="text-align:left" valign="top">
	                        <br/>
	                        <h2> {$theme.item.title|markup} </h2>
	                      </td>
	                    </tr>
			    {/if}
			    {if ($theme.params.PDescription == 'leftB') && !empty($theme.item.description) && empty($embedFlash)}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <p class="giDescription">
	                          {$theme.item.description|markup}
	                        </p>
	                      </td>
	                    </tr>
			    {/if}
			    {if ($theme.params.PInfo == 'leftB')}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <table align="center">
	                          <tr>
	                            <td>
                	              {g->block type="core.ItemInfo"
	                        	  	item=$theme.item
						showDate=$theme.params.PDate
		                          	showOwner=$theme.params.showImageOwner
		  	                  	showViewCount=$theme.params.PViewCount
	        	                   	class="giInfo"}

				      {if ($theme.params.InfoSize != 'none')}
					{if ($theme.params.PopSize != 'none')}
					  {g->theme include='photoSizes.tpl' class="giInfo"}
					{else}
		                          {g->block type="core.PhotoSizes" class="giInfo"}
					{/if}
				      {/if}
				    </td>
	                          </tr>
	                        </table>
	                      </td>
	                    </tr>
			    {/if}

			    {* ratings *}
			    {if !empty($rating) && ($theme.params.PRating  == 'leftB') && isset ($theme.permissions.rating_view) && $showblockRating == '1'}
	                    <tr>
               	    	      <td style="text-align:center">
	                        <table align="center">
				  <tr>
				    <td>
	                              {assign var=item value=$theme.item}
		                      {g->callback type="rating.LoadRating" itemId=$item.id}
		                      {if !empty($block.rating.RatingData)}
		                      <div style="border:1px; text-align:left" class="{$class}">
		                        {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
						RatingData=$block.rating.RatingData
						RatingSummary=$block.rating.RatingSummary
			                        l10Domain="modules_rating"}
 		                      </div>
		                      {/if}
	                            </td>
				  </tr>
				</table>
	                      </td>
	                    </tr>
			    {/if}
			    {* / ratings *}


			    {if ($theme.params.PInfo == 'leftB')}
			    <tr>
			      <td>
			        <table align="left">
			          <tr>
			  	    <td style="height:15px">
				    </td>
				  </tr>
			          {foreach from=$theme.params.photoSideBlocks item=block}
			          <tr>
			            <td>
			 	      <div id="gsSideBlocks" style="width:{$tableThumbs}px; text-align:{if $block.0 == 'imageblock.ImageBlock'}center{else}left{/if};">
			 	        {g->block type=$block.0 params=$block.1}
				      </div>
			            </td>
			          </tr>
			          {/foreach}
			        </table>
			      </td>
			    </tr>
			    {/if}

			    {if (($theme.params.PTitle == 'leftB') && !empty($theme.item.title)) || (($theme.params.PDescription == 'leftB') && !empty($theme.item.description) && empty($embedFlash)) || ($theme.params.PInfo == 'leftB') || (!empty($rating) && ($theme.params.PRating  == 'leftB') && isset ($theme.permissions.rating_view) && $showblockRating == '1')}
			    {/if}

	                    <tr>
			      <td>
			      </td>
			    </tr>
	                  </table>
	                </td>
			{/if}                
			{* / showing micro thumb at the left *}


			{* image *}
                 	<td style="vertical-align:top; text-align:center;">
                  	  <table align="center" style="width:100%; text-align:center" border="0">
			    <tr>
			      <td>
				{* photo navigation top *}
			        {if (($theme.params.NavPhoto == 'top') || ($theme.params.NavPhoto == 'both'))}
		                <div class="gbBlock gbNavigator" style="width:100%; text-align:center">
	                          <table align="center" style="{$imagewidth}px" border="0">
	                            <tr>
	                              <td style="width:{$imagewidth}px; text-align:center">
	                                {assign var='position' value='top'}
	                                {g->theme include='navigatorPhoto.tpl'}
	                              </td>
	                            </tr>
	                          </table>
	                        </div>
	                      </td>
			    </tr>
			    <tr>
			      <td style="width:100%; text-align:center">
				{/if}


{if !empty($embedFlash)}
<div style="position:relative; top:0px; left:0px;">
	                          {$theme.item.description|markup}
</div>
{/if}
		                <div id="gsImageView" class="gbBlock">

				  {if !empty($theme.imageViews)}
		                    {capture name="fallback"}
			              <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
	                	      {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
			              </a>
			            {/capture}
		                  <table border="0" align="center" >
	                            <tr>
	                              <td>

				      {if ($image.viewInline)}

				        {if $theme.params.interactiveframe || $theme.params.setiframe} {* if is selected any interactive frame *}
		                          {g->theme include='iFrameSet.tpl'}
					{else}
					  {if (($theme.item.mimeType.0 == "v") && ($theme.item.mimeType !='video/x-flv')) || !empty($audioItem)}  {* for non flv video or audio *}
					  {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%"}
					  {else}
				            {if isset($theme.photoFrame)}  {* for image width Frame *}
					    {g->container type="imageframe.ImageFrame" frame=$theme.photoFrame width=$frameModuleWidth height=$frameModuleHeight}

					    {if ($theme.item.mimeType =='video/x-flv')}  {* for flv video  *}
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
	  		                    {/g->container}


				            {else}  {* for image without frame *}
					    {if ($theme.item.mimeType =='video/x-flv')}  {* for flv video  *}
					      {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%"}
					    {else}			
					    <div style="position:relative; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px;">
					      {if !empty($theme.params.imageFadin) && empty($isPanoramaItem)}
					      <div class="gsSingleImage" id="gsSingleImageId" style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px; background-color: #000000;">
					        {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%" usemap="#fotomap"}
					        {if $theme.params.RightClick != "none"}
					          <map id="fotomap" name="fotomap">
						    <area shape="rect" coords="0,0,{$imagewidth},{$imageheight}" alt=""/>
					          </map>
					        {/if}
					      {else}
						{if $theme.item.mimeType.0 == "i" && $theme.params.NavOverLink != 'links' && $theme.params.NavOverLink != 'icons'}
					        <div class="gsSingleImageNoF" style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px; background-color: #000000; background:url({g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.imageViews[$theme.imageViewsIndex].id`" forceFullUrl=true arg3="serialNumber=`$theme.imageViews[$theme.imageViewsIndex].serialNumber`"}) no-repeat">
						  {else}
					        <div  style="position:absolute; width:{$imagewidth}px; height:{$imageheight}px; top:0px; left:0px;">
					          {g->image item=$theme.item image=$image fallback=$smarty.capture.fallback class="%CLASS%" id="%ID%" longdesc="%ID%" usemap="#fotomap"}
					            {if $theme.params.RightClick != "none" && $theme.params.NavOver != 'none' && $theme.params.NavOverLink != 'links' && $theme.params.NavOverLink != 'icons'}
					              <map id="fotomap" name="fotomap">
						        <area shape="rect" coords="0,0,{$imagewidth},{$imageheight}" alt=""/>
					              </map>
					            {/if}
						  {/if}
					        {/if}
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
					    </div>
					    {/if}
					  {/if}
					{/if}
				      {else}
	                      		{$smarty.capture.fallback}
				      {/if}
		                      </td>
		                    </tr>
	                          </table>
			          {else}
                      		    {g->text text="There is nothing to view for this item."}
			          {/if}
	                        </div>

				{* Download link for item in original format *}
				{if !empty($theme.sourceImage) && $theme.sourceImage.mimeType != $theme.item.mimeType}
		                <div class="gbBlock">
	                          <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
	                            {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1}
	                          </a>
	                        </div>
				{/if}

	                      </td>
			    </tr>

			    {* Photo navigation bottom *}
			    {if (($theme.params.NavPhoto == 'bottom') || ($theme.params.NavPhoto == 'both'))}
			    <tr>
			      <td>
	                        <div class="gbBlock gbNavigator" style="width:100%; text-align:center">
	                          <table border="0" align="center" style="{$imagewidth}px">
		                    <tr>
                     		      <td style="width:{$imagewidth}px; text-align:center">
	                                {assign var='position' value='bottom'}
            		                {g->theme include='navigatorPhoto.tpl'}
		                      </td>
                      		    </tr>
		                  </table>
		                </div>
		              </td>
		            </tr>
			    {/if}


			    {* for  Microthumbs at bottom *}
			    {if !empty($showMicroThumbs) && (($theme.params.MTposition == 'bottom') || ($theme.params.MTposition == 'bottom1R'))}
		            <tr>
		              <td style="text-align:center" valign="top">
		                <table align="center" border="0">
		                  <tr>
		                    <td style="text-align:center">
		                      {g->theme include='navigatorThumbs.tpl'}
		                    </td>
		                  </tr>
		                </table>
		              </td>
	 	            </tr>
			    {/if}


			    {* static comments *}
      			    {assign var=item value=$theme.item}
			    {g->callback type="comment.AddComment" itemId=$item.id}
			    {g->callback type="comment.LoadComments" itemId=$item.id show=5}
			    {if isset ($theme.permissions.comment_view) && !empty($comments) && !empty($block.comment.LoadComments.comments) && ((empty($theme.parents) && !empty($theme.params.PStaticComments)) || (!empty($theme.parents) && !empty($theme.params.PStaticComments)))}
			    <tr>
			      <td>
		 	        <table style="width:600px" class="gcBorder1" align="{if !empty($theme.params.BlocksAlign)}{$theme.params.BlocksAlign}{else}center{/if}">
			          <tr>
			            <td style="text-align:right">
			  	    {if !empty($block.comment.AddComment) && ((empty($theme.parents) && ($theme.params.GAddComment != 'none')) || (!empty($theme.parents)&& ($theme.params.AAddComment != 'none'))) && isset ($theme.permissions.comment_add)}
				      {if ($theme.params.AAddComment == 'floating') || ($theme.params.GAddComment == 'floating')}

				 	{literal}<script type="text/JavaScript">
					//<![CDATA[
				  	<!--
					img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('addcomment{$item.id}');setLyr(this,'addcomment{$item.id}',-550,-450)\" title=\"{g->text text='Add a Comment'}\" class=\"icon tLink-add_comment\"style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add a Comment'}\" title=\"{g->text text='Add a Comment'}\"\/><\/a>"{literal};
					function Viewaddcom(){document.write(img);}
					Viewaddcom();
					//-->
					//]]>
			  		</script>{/literal}
					<noscript>
					  <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon iconAddCom">
					    <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
					  </a>
				   	</noscript>
				      {else}
					<a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon iconAddCom"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/></a>
				      {/if}
				      <div id="addcomment{$item.id}" style="position: absolute; left:0px; top:0px; text-align:left; z-index: 25; visibility: hidden;" class="BlockOpacity">
		 			<table style="width:500px" class="gcBorder2 gcBackground2">
					  <tr>
					    <td class="gcBorder1 gcBackground1">
					      <div onmousedown="dragStart(event, 'addcomment{$item.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
						<table style="width:100%" class="gcBackground1">
						  <tr>
						    <td style="text-align:left">
         	    				      <h3>&nbsp;{$item.title|markup}</h3>
						    </td>
						    <td style="text-align:right">
						      <a onmouseover="hideLyr('addcomment{$item.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}"/></a> 
						    </td>
						  </tr>		
						</table>
					      </div>
					    </td>
					  </tr>
					  <tr>
				  	    <td class="gcBorder1">
					      {g->block type="comment.AddComment" expand=false item=$theme.item}
					    </td>
					  </tr>
					</table>
					<br/>
				      </div>
				    {/if}
			            </td>
			          </tr>
			          <tr>
		 	            <td style="text-align:left">
			              {g->block type="comment.ViewComments"}
			            </td>
			          </tr>
			        </table>
		 	      </td>
			    </tr>
			    {/if}
		     	    {* /static comments *}

		          </table>
		        </td>
			{* / image *}

			{* for showing micro thumbs at the right *}

			{if (($theme.params.MTposition == 'right') && !empty($showMicroThumbs)) || ($theme.params.PTitle == 'rightT') || ($theme.params.PDescription == 'rightT') || ($theme.params.PInfo == 'rightT')  || ($theme.params.PTitle == 'rightB') || ($theme.params.PDescription == 'rightB') || ($theme.params.PInfo == 'rightB') || ((($theme.params.PRating  == 'rightT') || ($theme.params.PRating  == 'rightB')) && isset ($theme.permissions.rating_view) && $showblockRating == '1')}

                  	<td valign="top" style="text-align:center; width:30%">
                    	  <table align="center" border="0" style="width:100%">
			  {if ($theme.params.PTitle == 'rightT')}
			    {if !empty($theme.item.title)}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <br/>
	                        <h2> {$theme.item.title|markup} </h2>
	                      </td>
	                    </tr>
			    {/if}
			  {/if}
			  {if ($theme.params.PDescription == 'rightT') && !empty($theme.item.description) && empty($embedFlash)}
		            <tr>
	                      <td style="text-align:left" valign="top">
	                        <p class="giDescription">
	                          {$theme.item.description|markup}
	                        </p>
	                      </td>
	                    </tr>
			  {/if}
			  {if ($theme.params.PInfo == 'rightT')}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <table align="center">
	                          <tr>
	                            <td>
                	              {g->block type="core.ItemInfo"
	                        	  	item=$theme.item
						showDate=$theme.params.PDate
		                          	showOwner=$theme.params.showImageOwner
		  	                  	showViewCount=$theme.params.PViewCount
        		                   	class="giInfo"}

				    {if ($theme.params.InfoSize != 'none')}
				      {if ($theme.params.PopSize != 'none')}
	                                {g->theme include='photoSizes.tpl' class="giInfo"}
				      {else}
                                	{g->block type="core.PhotoSizes" class="giInfo"}
				      {/if}
				    {/if}
                              	    </td>
	                          </tr>
	                        </table> 
	                      </td>
	                    </tr>
			  {/if}
			  {* ratings *}
			  {if !empty($rating) && ($theme.params.PRating  == 'rightT') && isset ($theme.permissions.rating_view) && $showblockRating == '1'}
	                    <tr>
	                      <td style="text-align:center">
	                        <table align="center">
				  <tr>
				    <td>
		                      {assign var=item value=$theme.item}
	 	                      {g->callback type="rating.LoadRating" itemId=$item.id}
		                      {if !empty($block.rating.RatingData)}
		                      <div style="border:1px; text-align:left" class="{$class}">
		                        {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
		                              RatingData=$block.rating.RatingData
		                              RatingSummary=$block.rating.RatingSummary
		 	                      l10Domain="modules_rating"}
	          	              </div>
	                  	      {/if}
	              		    </td>
				  </tr>
				</table>
	                      </td>
	                    </tr>
			  {/if}
			  {* / ratings *}

			  {if ($theme.params.PInfo == 'rightT')}
			    <tr>
			      <td>
			        <table align="left">
			          <tr>
			  	    <td style="height:15px">
				    </td>
				  </tr>
			          {foreach from=$theme.params.photoSideBlocks item=block}
			          <tr>
			            <td>
			 	      <div id="gsSideBlocks" style="width:{$tableThumbs}px; text-align:{if $block.0 == 'imageblock.ImageBlock'}center{else}left{/if};">
			 	        {g->block type=$block.0 params=$block.1}
				      </div>
			            </td>
			          </tr>
			          {/foreach}
			        </table>
			      </td>
			    </tr>
			  {/if}
			  {if ($theme.params.MTposition == 'right') && !empty($showMicroThumbs)}
			    {if (($theme.params.PTitle == 'rightT') && !empty($theme.item.title)) || (($theme.params.PDescription == 'rightT') && !empty($theme.item.description) && empty($embedFlash)) || ($theme.params.PInfo == 'rightT') || (!empty($rating) && ($theme.params.PRating  == 'rightT') && isset ($theme.permissions.rating_view) && $showblockRating == '1')}
			    {/if}
	                    <tr>
	                      <td style="text-align:center" valign="top">
				<table align="center">
				  <tr>
				    <td>
	                              {g->theme include='navigatorThumbs.tpl'}
				    </td>
				  </tr>
				</table>
	                      </td>
	                    </tr>
			    {if (($theme.params.PTitle == 'rightB') && !empty($theme.item.title)) || (($theme.params.PDescription == 'rightB') && !empty($theme.item.description) && empty($embedFlash)) || ($theme.params.PInfo == 'rightB') || (!empty($rating) && ($theme.params.PRating  == 'rightB') && isset ($theme.permissions.rating_view) && $showblockRating == '1')}
			    {/if}
			  {/if}

			  {if ($theme.params.PTitle == 'rightB')}
			    {if !empty($theme.item.title)}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <br/>
	                        <h2> {$theme.item.title|markup} </h2>
	                      </td>
	                    </tr>
			    {/if}
			  {/if}
			  {if ($theme.params.PDescription == 'rightB') && !empty($theme.item.description) && empty($embedFlash)}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <p class="giDescription">
	                          {$theme.item.description|markup}
	                        </p>
	                      </td>
	                    </tr>
			  {/if}
			  {if ($theme.params.PInfo == 'rightB')}
	                    <tr>
	                      <td style="text-align:left" valign="top">
	                        <table align="center">
	                          <tr>
	                            <td>
                	              {g->block type="core.ItemInfo"
	                        	  	item=$theme.item
						showDate=$theme.params.PDate
		                         	showOwner=$theme.params.showImageOwner
		  	                  	showViewCount=$theme.params.PViewCount
        		                   	class="giInfo"}

				      {if ($theme.params.InfoSize != 'none')}
					{if ($theme.params.PopSize != 'none')}
	                                  {g->theme include='photoSizes.tpl' class="giInfo"}
				        {else}
	                                  {g->block type="core.PhotoSizes" class="giInfo"}
				        {/if}
				      {/if}
	                            </td>
        	                  </tr>
                	        </table> 
                  	      </td>
	                    </tr>
			  {/if}
			  {* ratings *}
			  {if !empty($rating) && ($theme.params.PRating  == 'rightB') && isset ($theme.permissions.rating_view) && $showblockRating == '1'}
	                    <tr>
	                      <td style="text-align:center">
	                        <table align="center">
				  <tr>
				    <td>
	                              {assign var=item value=$theme.item}
		                      {g->callback type="rating.LoadRating" itemId=$item.id}
		                      {if !empty($block.rating.RatingData)}
		                        <div style="border:1px; text-align:left" class="{$class}">
		                          {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
		                              RatingData=$block.rating.RatingData
		                              RatingSummary=$block.rating.RatingSummary
		               		      l10Domain="modules_rating"}
		                        </div>
		                      {/if}
		                    </td>
				  </tr>
				</table>
	                      </td>
	                    </tr>
			  {/if}
			  {* / ratings *}

			  {if ($theme.params.PInfo == 'rightB')}
			    <tr>
			      <td>
			        <table align="left">
			          <tr>
			  	    <td style="height:15px">
				    </td>
				  </tr>
			          {foreach from=$theme.params.photoSideBlocks item=block}
			          <tr>
			            <td>
			 	      <div id="gsSideBlocks" style="width:{$tableThumbs}px; text-align:{if $block.0 == 'imageblock.ImageBlock'}center{else}left{/if};">
			 	        {g->block type=$block.0 params=$block.1}
				      </div>
			            </td>
			          </tr>
			          {/foreach}
			        </table>
			      </td>
			    </tr>
			  {/if}

  	                    <tr>
			      <td>
			      </td>
			    </tr>
	                  </table>
			</td>
			{/if}                
			{* / showing micro thumbs at the right *}

	              </tr>

		      {* for showing micro thumbs at the bottom *}
		    {if !empty($showMicroThumbs)}
		      {if ($theme.params.MTposition == 'bottomF') || ($theme.params.MTposition == 'bottomF1R')}
	              <tr>
	                <td style="text-align:center" valign="top" colspan="3">
	                  <table align="center" border="0">
	                    <tr>
	                      <td>
	                        {g->theme include='navigatorThumbs.tpl'}
	                      </td>
	                    </tr>
	                  </table>
	                </td>
	              </tr>
		      {/if}
		    {/if}
	            </table>

		{if !((empty($theme.parents) && !empty($theme.params.PStaticComments)) || (!empty($theme.parents) && !empty($theme.params.PStaticComments)))}

		    <div id="addcomment" style="position: absolute; left:0px; top: 0px; text-align:left; z-index: 30; visibility: hidden;" class="BlockOpacity">
		      <table style="width:500px" class="gcBorder2 gcBackground2">
		        <tr>
			  <td class="gcBorder1 gcBackground1">
			    <div onmousedown="dragStart(event, 'addcomment')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			      <a onmouseover="hideLyr('addcomment')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
			    </div>
		          </td>
		        </tr>
		        <tr>
		          <td class="gcBorder1">
			    {g->block type="comment.AddComment" expand=false item=$item }
		          </td>
		        </tr>
		      </table>
		      <br/>
		    </div>
		{/if}


	 	    <div id="comments" style="position: absolute; left:0px; top:0px; text-align:left; z-index: 30; visibility: hidden;" class="BlockOpacity">
		      <table style="width:500px" class="gcBorder2 gcBackground2">
		        <tr>
		          <td class="gcBorder1 gcBackground1" style="text-align:right">
			    <div  onmousedown="dragStart(event, 'comments')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			      <a onmouseover="hideLyr('comments')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" title="{g->text text='Close'}" alt="{g->text text='Close'}"/></a>
			    </div>
		          </td>
		        </tr>
		        <tr>
		          <td class="gcBorder1">
			    {g->block type="comment.ViewComments" item=$item }
		          </td>
		        </tr>
		      </table>
		      <br/>
		    </div>


		    <div id="exif" style="position: absolute; left:0px; top:0px; z-index: 30; visibility: hidden;" class="BlockOpacity">
		      <table class="gcBackground2 gcBorder2" align="center">
		        <tr>
		          <td class="gcBorder1 gcBackground1" style="text-align:right">
			    <div onmousedown="dragStart(event, 'exif')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			      <a onmouseover="hideLyr('exif')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
			    </div>
		          </td>
		        </tr>
		        <tr>
		          <td style="text-align:left" class="gcBorder1">
			    {g->block type="exif.ExifInfo" item=$item }
		          </td>
		        </tr>
		      </table>
		      <br/>
		    </div>

		    <div id="blocks" style="position: absolute; left:0px; top:0px; text-align:left; z-index: 30; visibility: hidden;" class="BlockOpacity">
		      <table style="width:500px" class="gcBackground2 gcBorder2">
		        <tr>
		          <td class="gcBorder1 gcBackground1" style="text-align:right">
			    <div onmousedown="dragStart(event, 'blocks')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			      <a onmouseover="hideLyr('blocks')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" title="{g->text text='Close'}" alt="{g->text text='Close'}"/></a>
 			    </div>
		          </td>
		        </tr>
		        <tr>
		          <td>
			    <table style="width:100%" class="gcBorder1" align="{if $theme.params.BlocksAlign}{$theme.params.BlocksAlign}{else}center{/if}">
			      <tr>
			        <td></td>
			      </tr>
				{foreach from=$theme.params.photoBlocks item=block}
			      <tr>
			        <td>
			          <table align="{if $theme.params.BlocksInAlign}{$theme.params.BlocksInAlign}{else}center{/if}">
				    <tr>
			              <td {if $block.0 == 'imageblock.ImageBlock'}style="text-align:center;"{else}style="text-align:left;"{/if}>

		    			{if ($block.0 != "rating.Rating") || ($theme.params.PRating == 'none')}
 					  {if ($block.0 != "comment.ViewComments") || empty($theme.params.PComments) || empty($theme.params.StaticComments)}
					    {if ($block.0 != "comment.AddComment") || ($theme.params.PAddComment == 'none')}
					      {if ($block.0 != "exif.ExifInfo") || empty($theme.params.PExif)}
						{if (($block.0 != "cart.ShowCart" && $block.0 != "checkout.ShowCart") || empty($theme.params.PViewCart))}
					     	  {g->block type=$block.0 params=$block.1}
		    			      	{/if}
		    			      {/if}
		    			    {/if}
		    			  {/if}
		    			{/if}

				      </td>
				    </tr>
			          </table>
			        </td>
			      </tr>
				{/foreach}

			    </table>
		          </td>
		        </tr>
 		      </table>
		      <br/>
	 	    </div>
                  </div>

          </td>
        </tr>
      </table>
      </td></tr></table>
    </td>

  </tr>
</table>

<br/>
{g->block type="core.GuestPreview" class="gbBlock"}
<br/>


{if !empty($theme.params.photoBlocks) && empty($theme.params.PBlocksBtn)}

{* Show any other photo blocks (comments, exif etc) *}
<br/>
{assign var="hasBlockContent" value=0}
{capture assign="allPhotoBlockContent"}
  <table border="0" style="width:98%">
    <tr>
      <td>
        <table style="width:400px" align="{if $theme.params.BlocksAlign}{$theme.params.BlocksAlign}{else}center{/if}">
          <tr>
	    <td>
	    </td>
  	  </tr>
          {foreach from=$theme.params.photoBlocks item=block}
          <tr>
            <td>
              <table align="{if $theme.params.BlocksInAlign}{$theme.params.BlocksInAlign}{else}center{/if}">
                <tr>
                  <td {if $block.0 == 'imageblock.ImageBlock'}style="text-align:center;"{else}style="text-align:left;"{/if}>
		    {if (($block.0 == "comment.AddComment") && ($theme.params.PAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.PComments) || !empty($theme.params.StaticComments))) || (($block.0 == "exif.ExifInfo") && !empty($theme.params.PExif)) || (($block.0 == "rating.Rating") && ($theme.params.PRating != 'none')) || ((($block.0 == "cart.ShowCart") || ($block.0 == "checkout.ShowCart")) && !empty($theme.params.PViewCart))}
		      {capture assign="currentBlock"}{g->block type=$block.0 params=$block.1}{/capture}
		      {if !empty($currentBlock)}
		        {assign var="hasBlockContent" value=1}
		        {$currentBlock}
		      {/if}
		    {/if}
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          {/foreach}
        </table>
      </td>
    </tr>
  </table>
{/capture}
{if !empty($hasBlockContent)}{$allPhotoBlockContent}{/if}
{/if}

{literal}
<script type="text/javascript">
//<![CDATA[
start();
//]]>
</script>
{/literal}
<br/>

	{* Our emergency edit link, if the user removes all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="sidebar,photo,photoSide"}
