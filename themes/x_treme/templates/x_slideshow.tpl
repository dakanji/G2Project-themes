{*
 * $Revision: 1102 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
      <div id="gsHeader">
        <table style="width:100%">
          <tr>
	  {if ($theme.params.logo == 'left')}
            <td style="height:{$logoHeight}px; width:{$logoWidth}px">
	      <a href="{g->url}" title="{g->text text='home'}" class="iconLogo">
	        <img src="{$imageURL_base}blank.gif" alt="{g->text text='home'}" title="{g->text text='home'}"/>
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
  	      <table align="center">
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

        <table width="100%">
          <tr>
            {if !empty($theme.params.BreadCrumb)}
            <td style="width:50%;text-align:left">
              {g->block type="core.BreadCrumb"}
            </td>
            {/if}
            <td style="width:50%;text-align:right" nowrap="nowrap">
	      {assign var='TopLinksseparator' value='1'}
              {g->block type="core.SystemLinks"
		    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
		    othersAt=4}
              {if $theme.params.link1}
                <a href="{$theme.params.link1url}">{$theme.params.link1}</a>
		{assign var='TopLinksseparator' value='0'}
              {/if}

              {if $theme.params.link2}
		{if ($TopLinksseparator ==0)}{$separator}{/if}
                <a href="{$theme.params.link2url}">{$theme.params.link2}</a>
		{assign var='TopLinksseparator' value='0'}
              {/if}

              {if $theme.params.link3}
		{if ($TopLinksseparator ==0)}{$separator}{/if}
                <a href="{$theme.params.link3url}">{$theme.params.link3}</a>
		{assign var='TopLinksseparator' value='0'}
              {/if}

              {if $theme.params.externallinks}
		{if ($TopLinksseparator ==0)}{$separator}{/if}
                {g->theme include="externalLinks.tpl"}
		{assign var='TopLinksseparator' value='0'}
              {/if}

              {if $theme.params.sidebar=="floating"}
		{if ($TopLinksseparator ==0)}
                <span class="menuoff">
                   {$separator}{assign var='TopLinksseparator' value='1'}
                </span>
                {/if}
                <span class="menuoff">{g->text text="Options"}</span>
		{assign var='TopLinksseparator' value='0'}
              {/if}
            </td>
          </tr>
        </table>
        <br/>


{if empty($SlideShow.itemList)}
  <div id="gsContent" >
    {g->text text="This album has no photos to show in a slideshow."}
    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$SlideShow.item.id`"}">
      {g->text text="Back to Album View"}
    </a>
  </div>
{else}
  {foreach from=$SlideShow.itemList key=i item=it}
    <div style="display:none">
      {foreach from=$it.sources key=j item=source}
        <a id="item_{$i}_{$j}"
         href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$source.id`"
	  	       arg3="serialNumber=`$source.serialNumber`"}"></a>
      {/foreach}

      <a id="href_{$i}" href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$it.id`"}"></a>
      <span id="title_{$i}">{$it.data.title|markup}</span>
      <span id="summary_{$i}">{if $theme.params.ssSummary && !empty($it.data.summary)}&nbsp;&nbsp;-&nbsp;&nbsp;{/if}{$it.data.summary|markup}</span>
      <span id="date_{$i}">
      {g->callback type="exif.LoadExifInfo" itemId=$it.id}
      {if !empty($block.exif.LoadExifInfo.exifData)}
        {section name=inner loop=$block.exif.LoadExifInfo.exifData}
	  {if $block.exif.LoadExifInfo.exifData[inner].title == "Date/Time"}
	    {capture assign=exifDate}{$block.exif.LoadExifInfo.exifData[inner].value}{/capture}
	  {/if}
	{/section}
      {/if}
      {if !empty($exifDate)}
        {$it.exif.DateTime.title}{g->text text="Date/Time: %s" arg1=$exifDate}
	{assign var=exiDate value=0}
      {else}
        {capture name="date"}{g->date timestamp=$it.data.modificationTimestamp}{/capture}
        {g->text text="Date: %s" arg1=$smarty.capture.date}
      {/if}
      </span>
      <span id="description_{$i}">{$it.data.description|markup}</span>
    </div>
  {/foreach}

<script type="text/JavaScript">
  // <![CDATA[
  var image = new Image(), timer, iDelay = {$theme.params.ssDelay}*1000, iDir = {$theme.params.ssDirection}, iSize = {$theme.params.ssSize};
  var bPause = 0, bShowText = {if $theme.params.ssMoreInfo == 'hide'}0{else}1{/if}, bShowTools = {if !$theme.params.ssMoreOptions}0{else}1{/if}; 
  var linkStop, spanPause, spanText, toolText;
  var toolBar, textBanner, spanTitle, spanSummary, spanDate, spanDescription;
  var index = {$SlideShow.start}, count = {$SlideShow.count};
  var is_cached = new Array(count), item_map = new Array(count);
  for (i=0; i < count; i++) is_cached[i] = new Array(0,0,0,0,0,0);
  {foreach from=$SlideShow.itemList key=i item=it}
  item_map[{$i}] = new Array({foreach
    from=$it.sizeClassMap key=j item=idx}{if $j>0},{/if}{$idx}{/foreach});
  {/foreach}
  {literal}
  function random_int(i) {
    return Math.floor(i*(Math.random()%1));
  }
  var random_order = new Array(count);
  for (i=0; i < count; i++) random_order[i] = i;
  for (i=count-1; i > 0; i--) {
    j = random_int(i+1);
    k = random_order[i];
    random_order[i] = random_order[j];
    random_order[j] = k;
  }
  function move_index(by) {
    if (iDir==0/*random*/) {
      random_index = 0;
      for (i = 0; i < count; i++)
	if (random_order[i] == index) {
	  random_index = i;
	  break;
	}
      return random_order[(random_index+by+count)%count];
    }
    else return (index+(by*iDir)+count)%count;
  }
  function preload(i) {
    if (!is_cached[i][iSize]) {
      is_cached[i][iSize] = 1;
      image.src = document.getElementById('item_'+i+'_'+item_map[i][iSize]).href;
    }
  }
  function slide_view_start() {
    if (bShowText) show_text();
    preload(move_index(1));
    if (timer) { clearInterval(timer); clearTimeout(timer); } // Avoid extra timers in opera
    if (!bPause) timer = setTimeout('goto_next_photo()', iDelay);
  }
  function goto_next_photo() {
    index = move_index(1);
    if (bCanBlend) apply_filter();
    document.images.slide.src =
      document.getElementById('item_'+index+'_'+item_map[index][iSize]).href;
    linkStop.href = document.getElementById('href_'+index).href;
    if (bCanBlend) document.images.slide.filters[0].Play();
  }
  function show_text() {
{/literal}{if $theme.params.ssTitle}{literal}
    spanTitle.innerHTML = document.getElementById('title_'+index).innerHTML;
{/literal}{/if}
{if $theme.params.ssSummary}{literal}
    spanSummary.innerHTML = document.getElementById('summary_'+index).innerHTML;
{/literal}{/if}
{if $theme.params.ssDate}{literal}
    spanDate.innerHTML = document.getElementById('date_'+index).innerHTML;
{/literal}{/if}
{if $theme.params.ssDescription}{literal}
    spanDescription.innerHTML = document.getElementById('description_'+index).innerHTML;
{/literal}{/if}{literal}
  }
  function text_onoff() {
    bShowText = bShowText ? 0 : 1;
    if (bShowText) show_text(); else {
      {/literal}{if $theme.params.ssTitle}{literal}spanTitle.innerHTML = {/literal}{/if}{if $theme.params.ssSummary}{literal}spanSummary.innerHTML = {/literal}{/if}{if $theme.params.ssDate}{literal}spanDate.innerHTML = {/literal}{/if}{if $theme.params.ssDescription}{literal}spanDescription.innerHTML = ''{/literal}{/if}{literal};
    }
    textBanner.style.display = bShowText ? 'block' : 'none';
    spanText.innerHTML = bShowText ? {/literal}'<a href="#" onclick="text_onoff();return {if $theme.params.ssMoreInfo == 'show'}false{else}true{/if}" title="{g->text text='Hide Title, Description, Date ...'}" class="icon tLink-info_collapse" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Hide Title, Description, Date ...'}" title="{g->text text='Hide Title, Description, Date ...'}"/></a>'
				   : '<a href="#" onclick="text_onoff();return {if $theme.params.ssMoreInfo == 'show'}false{else}true{/if}" title="{g->text text='Show Title, Description, Date ...'}" class="icon tLink-info_expand" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Show Title, Description, Date ...'}" title="{g->text text='Show Title, Description, Date ...'}"/></a>'; {literal}
  }

  function start_stop() {
    bPause = bPause ? 0 : 1;
    if (bPause) clearTimeout(timer);
    else goto_next_photo();
    spanPause.innerHTML = bPause ? {/literal}'<a href="#" onclick="start_stop();return false" title="{g->text text='Resume'}" class="icon tLink-control_start" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Resume'}" title="{g->text text='Resume'}"/></a>'
				 : '<a href="#" onclick="start_stop();return false" title="{g->text text='Pause'}" class="icon tLink-control_pause" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Pause'}" title="{g->text text='Pause'}"/></a>';{literal}
  }

    

  function jump(by) {
    index = move_index(by);
    clearTimeout(timer);
    goto_next_photo();
  }
  function apply_filter() {
    f = filters[document.getElementById('filter').selectedIndex];
    if (f == 'RANDOM') f = filters[random_int(filters.length-1)];
    document.images.slide.style.filter = f;
    document.images.slide.filters[0].Apply();
  }
  function new_size(size) {
    iSize = size;
    jump(-1);
  }
  function new_order(direct) {
    iDir = direct;
  }
  function new_delay(delay) {
    iDelay = delay*1000;
    jump(-1);
  }
  function tools_onoff() {
    bShowTools = bShowTools ? 0 : 1;
    toolBar.style.display = bShowTools ? 'block' : 'none';
    toolText.innerHTML = bShowTools ? {/literal}'<a href="#" onclick="tools_onoff();return {if !$theme.params.ssMoreOptions}true{else}false{/if}" title="{g->text text='Collapse options'}" class="icon tLink-options_collapse" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Collapse options'}" title="{g->text text='Collapse options'}"/></a>'
				    : '<a href="#" onclick="tools_onoff();return {if !$theme.params.ssMoreOptions}true{else}false{/if}" title="{g->text text='Expand options'}" class="icon tLink-options_expand" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Expand options'}" title="{g->text text='Expand options'}"/></a>'; {literal}
  }
  {/literal}
  // ]]>
</script>

  <table width="92%" cellspacing="0" cellpadding="0" class="Background" align="center">
    <tr>
      <td>
        <div id="gsContent">
          <div id="textBanner" class="gcBorder1 gcBackground1" style="padding-top:10px; border-top:1; border-left:1; border-right:1; text-align:center; {if $theme.params.ssMoreInfo == 'hide'}display:none;{/if}">
	    <a id="stop" href="{g->url arg1="view=core.ShowItem"
		     arg2="itemId=`$SlideShow.itemList[$SlideShow.start].id`"}" 
		     title="{g->text text="Back to: %s" arg1=$it.data.title}">
            <span class="giTitle" id="title"></span></a><span class="giDescription" id="summary"></span><p/>
            <div class="giInfo" id="description" style="text-align:left; margin-left:10px; margin-right:10px;"></div>
            <div class="giInfo" id="date" style="text-align:right; margin-right:10px;"></div>
            <br/>
          </div>
          <br/>
          <div class="gbItemImage" align="center">
            <img id="slide" alt="" src="" border="1"/>
          </div>
          <br/>
          <div style="border-bottom:0; border-left:0; border-right:0; text-align:center;">
            <table class="gcBackground1 gcBorder1" style="border-bottom:1; border-left:1; border-right:1;" align="center">
	      <tr>
		<td style="padding:6px;">

  	        <a id="stop" href="{g->url arg1="view=core.ShowItem"
		     arg2="itemId=`$SlideShow.itemList[$SlideShow.start].id`"}" 
		     title="{g->text text='Stop'}" 
		     class="icon tLink-control_stop" 
		     style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Stop'}" title="{g->text text='Stop'}"/>
	        </a>

	        <span id="pause">
	          <a href="#"  onclick="start_stop();return false" title="{g->text text='Pause'}" class="icon tLink-control_pause" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{$play}" title="{g->text text='Pause'}"/></a>
	        </span>

	        {if $theme.params.ssBack}
	          <a href="#" onclick="jump(-2);return false" 
			title="{g->text text='Back One Image'}" 
			class="icon tLink-control_back" 
			style="padding-bottom: 2px; padding-top: 2px;">
		    <img src="{$imageURL_base}blank.gif" alt="{g->text text='Back One Image'}" 
			title="{g->text text='Back One Image'}"/>
	          </a>
	        {/if}
	        {if $theme.params.ssNext}
		  <a href="#" onclick="jump(1);return false" 
			title="{g->text text='Next Image'}" 
			class="icon tLink-control_next" 
			style="padding-bottom: 2px; padding-top: 2px;">
		    <img src="{$imageURL_base}blank.gif" alt="{g->text text='Next Image'}" 
			title="{g->text text='Next Image'}"/>
    		  </a>
	        {/if}

	        {if $theme.params.ssMoreInfo}
		  <span id="moreInfo">
    		    <a href="#" onclick="text_onoff();return {if $theme.params.ssMoreInfo == 'show'}false{else}true{/if}" title="{g->text text='Hide Title, Description, Date ...'}" class="icon tLink-info_collapse" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Hide Title, Description, Date ...'}" title="{g->text text='Hide Title, Description, Date ...'}"/></a>
  		  </span>
	        {/if}

 	        <span id="tools">
    		  <a href="#" onclick="tools_onoff();return {if !$theme.params.ssMoreOptions}true{else}false{/if}" title="{g->text text='Expand options'}" class="icon tLink-options_expand" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Expand options'}" title="{g->text text='Expand options'}"/></a>
  	        </span>

	        </td>
	      </tr>
            </table>

                <br/>
	    <div id="toolbar" {if !$theme.params.ssMoreOptions}style="display:none"{/if}>

    {g->text text="delay: "}
    <select onchange="new_delay(this.value)">
      <option {if $theme.params.ssDelay == '1'}selected="selected"{/if} value="1">{g->text text="1 seconds"}</option>
      <option {if $theme.params.ssDelay == '3'}selected="selected"{/if} value="3">{g->text text="3 seconds"}</option>
      <option {if $theme.params.ssDelay == '5'}selected="selected"{/if} value="5">{g->text text="5 seconds"}</option>
      <option {if $theme.params.ssDelay == '10'}selected="selected"{/if} value="10">{g->text text="10 seconds"}</option>
      <option {if $theme.params.ssDelay == '15'}selected="selected"{/if} value="15">{g->text text="15 seconds"}</option>
      <option {if $theme.params.ssDelay == '20'}selected="selected"{/if} value="20">{g->text text="20 seconds"}</option>
    </select>
    &nbsp;

    {g->text text="direction: "}
    <select onchange="new_order(this.value)">
      <option {if $theme.params.ssDirection == '1'}selected="selected"{/if} value="1">{g->text text="forward"}</option>
      <option {if $theme.params.ssDirection == '-1'}selected="selected"{/if} value="-1">{g->text text="reverse"}</option>
      <option {if $theme.params.ssDirection == '0'}selected="selected"{/if} value="0">{g->text text="random"}</option>
    </select>
    &nbsp;

    {g->text text="max size: "}
    <select onchange="new_size(this.value)">
      <option {if $theme.params.ssSize == '0'}selected="selected"{/if} value="0">{g->text text="320x320"}</option>
      <option {if $theme.params.ssSize == '1'}selected="selected"{/if} value="1">{g->text text="640x640"}</option>
      <option {if $theme.params.ssSize == '2'}selected="selected"{/if} value="2">{g->text text="800x800"}</option>
      <option {if $theme.params.ssSize == '3'}selected="selected"{/if} value="3">{g->text text="1024x1024"}</option>
      <option {if $theme.params.ssSize == '4'}selected="selected"{/if} value="4">{g->text text="1280x1280"}</option>
      <option {if $theme.params.ssSize == '5'}selected="selected"{/if} value="5">{g->text text="no limit"}</option>
    </select>
    &nbsp;

    <script type="text/JavaScript">{literal}
      // <![CDATA[
      if (bCanBlend) {
	document.write('&nbsp; {/literal}{g->text
		 text="fade: " forJavascript="1"}{literal}<select id="filter">');
	for (i = 0; i < filterNames.length; i++) {
	  document.write('<option>'+filterNames[i]);
	}
	document.write('</select>');
      }
      {/literal}
      // ]]>
    </script>&nbsp;
            </div>&nbsp;
          </div>
        </div>
      </td>
    </tr>
  </table>
  <br/>
  <div id="gsFooter">
       {g->theme include="footer.tpl"}
  </div>

<script type="text/JavaScript">
  // <![CDATA[
  linkStop = document.getElementById('stop');
  spanPause = document.getElementById('pause');
  spanText = document.getElementById('moreInfo');
  toolText = document.getElementById('tools');
  toolBar = document.getElementById('toolbar');
  textBanner = document.getElementById('textBanner');
  spanTitle = document.getElementById('title');
  spanSummary = document.getElementById('summary');
  spanDate = document.getElementById('date');
  spanDescription = document.getElementById('description');
  document.images.slide.onload = slide_view_start;
  document.images.slide.onerror = goto_next_photo;
  document.images.slide.src =
  document.getElementById('item_{$SlideShow.start}_'+item_map[{$SlideShow.start}][iSize]).href;
  // ]]>
</script>

{/if}

{if $sidebar=="floating" && $theme.params.sidebarBlocks}
  <div id='floatingSidebar' style='position: absolute; z-index: 1; visibility: hidden;'></div>
{/if}  
