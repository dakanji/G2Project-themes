{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<table style="width:100%" cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td style="width:1%"></td>
    <td valign="top">

    {* sidebar *}
    {if !empty($theme.params.sidebarBlocks)}
      {if $sidebar == 'static'}
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
	divSidebar = {/literal}"<div id=\"floatingSidebar\" class=\"BlockOpacity\" onmousedown=\"dragStart(event, 'floatingSidebar')\" style=\"cursor:move;\">"{literal};
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
	divSidebarEnd = {/literal}"<\/td><\/tr><\/table><\/div>"{literal};
	function sidebarEnd(){document.write(divSidebarEnd);}
	sidebarEnd();
        //-->
        //]]>
        </script>
          </td>
	</tr>
      </table>
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


    {assign var="TspaceV" value=$theme.params.TspaceV|default:"0"}
    {assign var="TspaceH" value=$theme.params.TspaceH/2|default:"0"}
    
  {if !empty($theme.params.TspaceH) || !empty($theme.params.Tborder)}
    {assign var="childrenSpacing" value=$theme.params.TspaceH+$theme.params.Tborder+$theme.params.Tborder+2}
  {else}
    {assign var="childrenSpacing" value=0}
  {/if}
    {assign var="childrenCount" value=0}
    {assign var="childrenTable" value=0}
    {assign var="childrenWidth" value=0}

    {foreach from=$theme.children item=child}
      {assign var="childrenCount" value=$childrenCount+1}
      {assign var="currentChildWidth" value=$child.thumbnail.width|default:0}
      {assign var="childWidth" value=$currentChildWidth+$childrenSpacing}
      {if $childrenWidth < $childWidth}
        {assign var="childrenWidth" value=$currentChildWidth+$childrenSpacing}
      {/if}
      {if ((!empty($theme.parents) && $childrenCount <= $theme.params.columns))}
        {assign var="childrenTable" value=$theme.params.columns*$childrenWidth}
      {/if}
    {/foreach}

    {foreach from=$theme.params.albumSideBlocks item=block}
      {capture assign=albumSideBlocks}{g->block type=$block.0 params=$block.1}{/capture}
    {/foreach}

    {foreach from=$theme.params.albumBlocks item=block}
      {if (empty($theme.parents) && ((($block.0 == "comment.AddComment") && ($theme.params.GAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.GComments) || !empty($theme.params.GStaticComments))) || (($block.0 == "rating.Rating") && !empty($theme.params.GRating)) || (($block.0 == "cart.ShowCart") && !empty($theme.params.GViewCart)))) || (!empty($theme.parents) && ((($block.0 == "comment.AddComment") && ($theme.params.AAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.AComments) || !empty($theme.params.AStaticComments))) || (($block.0 == "rating.Rating") && !empty($theme.params.ARating)) || (($block.0 == "cart.ShowCart") && !empty($theme.params.AViewCart))))}
{assign var="block" value=0}{/if}
      {if !empty($block)}
        {capture assign="showBlocks"}{g->block type=$block.0 params=$block.1}{/capture}
      {else}
	{assign var="showBlocks" value=0}
      {/if}
    {/foreach}
 
      <table {if ((empty($theme.parents)&& ($theme.params.showInfoMsg == '1stleft' || $theme.params.showInfoMsg == 'left' || $theme.params.showInfoMsg == '1stleftG' || $theme.params.showInfoMsg == 'leftG')) || (!empty($theme.parents)&& ($theme.params.showInfoMsg == 'left' || $theme.params.showInfoMsg == '1stleft'))) || empty($theme.params.Iinfo)}style="width:92%"{else}style="width:{$childrenTable}px"{/if} class="gcBackground1 gcBorder2" cellpadding="0" align="center">
        <tr>
	  <td>
          <table style="width:100%" class="gcBorder1">
            <tr>
	      {if (empty($theme.parent) 
		  && ((!isset($theme.navigator.first) 
		    && (($theme.params.showInfoMsg == '1sttopG') || ($theme.params.showInfoMsg == '1stleftG')
			    || ($theme.params.showInfoMsg == '1sttop') || ($theme.params.showInfoMsg == '1stleft')
			    || ($theme.params.showInfoMsg == 'topG') || ($theme.params.showInfoMsg == 'leftG')
			    || ($theme.params.showInfoMsg == 'top') || ($theme.params.showInfoMsg == 'left')))
 		    || (isset($theme.navigator.first)
		    	&& (($theme.params.showInfoMsg == 'topG') || ($theme.params.showInfoMsg == 'leftG')
			    || ($theme.params.showInfoMsg == 'top') || ($theme.params.showInfoMsg == 'left')))))
	      || (!empty($theme.parent) 
		  && ((!isset($theme.navigator.first) 
		    	&& (($theme.params.showInfoMsg == '1sttop') || ($theme.params.showInfoMsg == '1stleft')
			    || ($theme.params.showInfoMsg == 'top') || ($theme.params.showInfoMsg == 'left')))
 		    || (isset($theme.navigator.first)
		    	&& (($theme.params.showInfoMsg == 'top') || ($theme.params.showInfoMsg == 'left')))))}

	      {if $theme.params.showInfoMsg != 'none'}
	      <td style="{if empty($theme.params.Iinfo)}width: 45%;{/if}vertical-align:top;" class="{if ($theme.params.showInfoMsg == '1stleft') || ($theme.params.showInfoMsg == 'left')}gcBorder1Author{/if}">
            	<table>
	          <tr>
         	    <td style="vertical-align:top;" class="{if (($theme.params.showInfoMsg == '1sttop') || ($theme.params.showInfoMsg == 'top'))}gcBorder1Top{/if}">
                      <table style="width:100%" cellspacing="5">
                    	<tr>
                      	  <td>
                            <p class="author" />
                            {g->theme include="$InfoMsg"}
                            <br/><br/>
                      	    <table style="width:100%">
                              <tr>
                                <td style="text-align:left">
				  {if !empty($theme.params.InfoMsgLink1)}
                                  <p class="authorlink">
                                  <a href="javascript:void(0)" onclick="toggleLyr('authorlink1'); setLyr(this,'authorlink1',-350,40);" style="color:#dfdfdf"  title="{g->text text='Click to hide...'}">
				    {literal}
				    <script type="text/JavaScript">
				    //<![CDATA[
				    <!--
				    link1 = {/literal}"{$theme.params.authorlink1}"{literal};
				    function Authorlink1(){document.write(link1);}
				    Authorlink1();
				    //-->
				    //]]>
				    </script>
				    {/literal}
                                  </a>
                                  </p>

                 	          <div id="authorlink1"  class="BlockOpacity" style="position:absolute; left: 0px; top: 0px; z-index:10;  border: 0px solid #999999; visibility:hidden;">
                        	    <table class="gcBackground2 gcBorder2">
                          	      <tr>
                            	        <td class="gcBorder1 gcBackground1" style="text-align:right">
				          <div onmousedown="dragStart(event, 'authorlink1')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
        	                            <a onmouseover="toggleLyr('authorlink1')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" title="{g->text text='Close'}" alt="{g->text text='Close'}"/></a>
				          </div>
                        	        </td>
	                              </tr>
	                              <tr>
         	                        <td class="gcBorder1">
				          {g->theme include="$InfoMsgLink1"}
                        	        </td>
	                              </tr>
        	                    </table>
                	          </div>
				  {/if}
                                </td>
                                <td style="text-align:right">
				  {if !empty($theme.params.InfoMsgLink2)}
                                  <p class="authorlink">
                                  <a href="javascript:void(0)" onclick="toggleLyr('authorlink2'); setLyr(this,'authorlink2',-250,-400);"  style="color:#dfdfdf" >
				    {literal}
				    <script type="text/JavaScript">
				    //<![CDATA[
				    <!--
				    link2 = {/literal}"{$theme.params.authorlink2}"{literal};
				    function Authorlink2(){document.write(link2);}
				    Authorlink2();
				    //-->
				    //]]>
				    </script>
				    {/literal}
                                  </a>
                                  </p>
                                  <div id="authorlink2"  class="BlockOpacity" style="position:absolute; left: 0px; top: 0px; z-index:10; border: 0px solid #999999; visibility:hidden;">
                        	    <table class="gcBackground2 gcBorder2">
        	                      <tr>
            		                <td class="gcBorder1 gcBackground1" style="text-align:right">
				          <div onmousedown="dragStart(event, 'authorlink2')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
	                                    <a onmouseover="hideLyr('authorlink2')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
				          </div>
                	                </td>
                        	      </tr>
	                              <tr>
        	                        <td  class="gcBorder1">
				          {g->theme include="$InfoMsgLink2"}
                        	        </td>
	                              </tr>
        	                    </table>
	                          </div>
				  {/if}
                                </td>
                              </tr>
			      {if $theme.params.authorEmail != 'none'}
			      <tr>
			        <td style="text-align:left; padding-lef: 10px;">
			        {if $theme.params.authorEmail == 'left'}
                                  <a href="mailto:{$theme.item.owner.email}" title="{$theme.item.owner.email}" class="authoremail">
                                    {$theme.item.owner.email}
                                  </a>
      				{/if}
			        </td>
  			        <td style="text-align:right; padding-right: 10px;">
			        {if $theme.params.authorEmail == 'right'}
                                  <a href="mailto:{$theme.item.owner.email}" title="{$theme.item.owner.email}" class="authoremail">
                                    {$theme.item.owner.email}
                                  </a>
			        {/if}
			        </td>
			      </tr>
			      {/if}
                            </table>
                      	  </td>
                        </tr>

			{if $theme.params.GBlocksSide == 'info' && !empty($albumSideBlocks)}
			<tr>
			  <td>
			    <table style="text-align:left">
			      <tr>
				<td style="height:15px">
			        </td>
			      </tr>
			      {foreach from=$theme.params.albumSideBlocks item=block}
			      <tr>
			        <td {if $block.0 == 'imageblock.ImageBlock'}style="text-align:center;"{else}style="text-align:left;"{/if}>
			 	  <div id="gsSideBlocks" style="width:100%;">
			 	    {g->block type=$block.0 params=$block.1}
				  </div>
			        </td>
			      </tr>
			      {/foreach}
			    </table>
			  </td>
			</tr>
			{/if}

                      </table>
		    {if ($theme.params.showInfoMsg == 'left') || ($theme.params.showInfoMsg == '1stleft') || ($theme.params.showInfoMsg == 'leftG') || ($theme.params.showInfoMsg == '1stleftG')}
                    </td>
                  </tr>
                </table>
		    {/if}
              </td>
	    {if ($theme.params.showInfoMsg == 'top') || ($theme.params.showInfoMsg == '1sttop') || ($theme.params.showInfoMsg == 'topG') || ($theme.params.showInfoMsg == '1sttopG')}
	    </tr>
	    <tr>
	    {/if}
              <td style="text-align:center" valign="top">
	  {else}
              <td id="gsSidebarCol" valign="top">
	  {/if} {* end showInfoMsg *}   
	{else} 
              <td id="gsSidebarCol" valign="top">
	{/if} {* end empty($theme.parents)*}
        {* / Auhor *}

                <div id="gsContent" style="text-align:center; width:100%;">
	 	{* for base album *}
		{if empty($theme.parents)}

                  <table style="width:100%; text-align:left; pading-right:10px;" {if (($theme.params.GTitle != 'none') && !empty($theme.item.title)) || (($theme.params.GDescription != 'none') && !empty($theme.item.description)) || $theme.params.showGalleryOwner || $theme.params.GDate || $theme.params.GSize || $theme.params.GViewCount || (!empty($rating) && $theme.params.GRating && isset($theme.permissions.rating_view))}class="gcBorder1Top"{/if}>

                    <tr valign="top" style="vertical-align:top">

		      {if empty($theme.parents) && (($theme.params.GTitle == 'side' && !empty($theme.item.title)) || ($theme.params.GDescription == 'side' && !empty($theme.item.description)) || ($theme.params.GInfo == 'side' && (!empty($theme.params.showAlbumOwner) || !empty($theme.params.GDate) || !empty($theme.params.GSize) || !empty($theme.params.GViewCount) || (!empty($rating) && !empty($theme.params.GRating) && isset($theme.permissions.rating_view)))))}
                      <td>
                        <table class="sideInfo">
                          <tr><td></td></tr>
			</table>
		      </td>
		      {/if}

		      {if ($theme.params.topNavPics == 'left' || $theme.params.topNavPics == 'leftNN')} 
                      <td style="width: 1%; text-align:left;" valign="top">
                        {g->theme include="navigatorTop.tpl"}
                      </td>
		      {/if}

                      <td style="width: {if $theme.params.GInfo == 'top'}64{else}81{/if}%;" valign="top">
                        <table style="height:25px; width:100%">
                          <tr>
                            <td style="padding-left:0px;" valign="top">
			    {if $theme.params.GTitle == 'topL' || $theme.params.GTitle == 'topR'}
			      {if !empty($theme.item.title)}
                              <h2 
				{if $theme.params.GTitle == 'topR'}
				  style="text-align:right"
				{else}
				  style="text-align:left"
				{/if}>
				{$theme.item.title|markup}
                              </h2>
			      {/if}
			    {/if}
			    {if $theme.params.GDescription == 'topL' || $theme.params.GDescription == 'topR'}
			      {if !empty($theme.item.description)}
                              <p class="giDescription" 
				{if $theme.params.GDescription == 'topR'}
				  style="text-align:right"
				{else}
				  style="text-align:left"
				{/if}>
                                {$theme.item.description|markup}
                              </p>
			      {/if}
			    {/if}
                            </td>
                          </tr>
                        </table>
                      </td>

		      {if (!empty($theme.params.showGalleryOwner) || !empty($theme.params.GDate) || !empty($theme.params.GSize) || !empty($theme.params.GViewCount) || (!empty($rating) && !empty($theme.params.GRating) && isset($theme.permissions.rating_view))) && ($theme.params.GInfo == 'top')}
                      <td style="width: 17%; white-space: nowrap" valign="top">
			<div style="floating:center;text-align:center">
			  <table>
			    <tr>
			      <td>
			 	{g->block type="core.ItemInfo"
	                                item=$theme.item
        	                        showDate=$theme.params.GDate
	                                showOwner=$theme.params.showGalleryOwner
	                          	showSize=$theme.params.GSize
	       		          	showViewCount=$theme.params.GViewCount
	                          	class="giInfo"}
			      </td>
			    </tr>
			  </table>
			</div>

		        {* ratings *}
		        {if !empty($rating) && !empty($theme.params.GRating) && isset($theme.permissions.rating_view)}
	                  {assign var=item value=$theme.item}
                          {g->callback type="rating.LoadRating" itemId=$item.id}
		          {if !empty($block.rating.RatingData)}
                          <table align="center" class="tableacpic">
                            <tr>
                              <td>
                                <div style="border:1px; text-align:center" class="{$class}">
                                  {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
		                     	RatingData=$block.rating.RatingData
		                        RatingSummary=$block.rating.RatingSummary
		                        l10Domain="modules_rating"}
                                </div>
                              </td>
                            </tr>
                          </table>
		          {/if}
		        {/if}
                      </td>
		      {/if}

		      {if ($theme.params.topNavPics == 'right' || $theme.params.topNavPics == 'rightNN')} 

                      <td style="width: 1%; text-align:right;" valign="top">
                        {g->theme include="navigatorTop.tpl"}
                      </td>
		      {/if}
	        {else}
		{* / for base album *}

                  <table border="0" style="width:100%; height: 40px; text-align:left;" class="gcBorder1Top">
                    <tr>

		      {if !empty($theme.parents) && (($theme.params.ATitle == 'side' && !empty($theme.item.title)) || ($theme.params.ADescription == 'side' && !empty($theme.item.description)) || ($theme.params.AInfo == 'side' && (!empty($theme.params.showAlbumOwner) || !empty($theme.params.ADate) || !empty($theme.params.ASize) || !empty($theme.params.AViewCount) || (!empty($rating) && !empty($theme.params.ARating) && isset($theme.permissions.rating_view)))))}
                      <td>
                        <table class="sideInfo">
                          <tr>
				    <td>
				    </td>
				  </tr>
			      </table>
		          </td>
		      {/if}

  		      {if ($theme.params.topNavPics == 'left' || $theme.params.topNavPics == 'leftNN')}
                      <td style="width:1%; text-align:left; vertical-align:top">
                        {g->theme include="navigatorTop.tpl"}
                      </td>
		      {/if}

                      <td style="width: {if $theme.params.AInfo == 'top'}64{else}81{/if}%;" valign="top">
                        <table style="height:25px; width:100%" border="0">
                          <tr>
                            <td style="padding-left:0px;" valign="top">
			    {if $theme.params.ATitle == 'topL' || $theme.params.ATitle == 'topR'}
			      {if !empty($theme.item.title)}
                              <h2 {if $theme.params.ATitle == 'topR'}style="text-align:right"{else}style="text-align:left"{/if}>{$theme.item.title|markup}
                              </h2>
			      {/if}
			    {/if}
			    {if $theme.params.ADescription == 'topL' || $theme.params.ADescription == 'topR'}
			      {if !empty($theme.item.description)}
                              <p class="giDescription" {if $theme.params.ADescription == 'topR'}style="text-align:right"{else}style="text-align:left"{/if}>
                                {$theme.item.description|markup}
                              </p>
			      {/if}
			    {/if}
                            </td>
                          </tr>
                        </table>
                      </td>
		      {if (!empty($theme.params.showAlbumOwner) || !empty($theme.params.ADate) || !empty($theme.params.ASize) || !empty($theme.params.AViewCount)) && ($theme.params.AInfo == 'top')}
                      <td style="width:1%"></td>
                      <td style="width: 11%; white-space: nowrap" valign="top">

			 	{g->block type="core.ItemInfo"
	                     		item=$child
	               	                showDate=$showDate
               	      	           	showOwner=$showOwner
	                          	showSize=$theme.params.ISize
       			          	showViewCount=$showViewCount
                                       	showSummaries=$showSummaries
	     	                  	class="giInfo"}

			<div style="floating:center;text-align:center">
			  <table align="center">
			    <tr>
			      <td>
			 	{g->block type="core.ItemInfo"
	                                item=$theme.item
	                                showDate=$theme.params.ADate
	                                showOwner=$theme.params.showAlbumOwner
	                          	showSize=$theme.params.ASize
	       		          	showViewCount=$theme.params.AViewCount
	                          	class="giInfo"}

			      </td>
			    </tr>
			  </table>
			</div>

		        {if !empty($rating) && !empty($theme.params.ARating) && isset($theme.permissions.rating_view)}
	                  {assign var=item value=$theme.item}
                          {g->callback type="rating.LoadRating" itemId=$item.id}
		          {if !empty($block.rating.RatingData)}
                        <table align="center" class="tableacpic">
                          <tr>
                            <td>
                              <div style="border:1px; text-align:center" class="{$class}">
                                {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
	                       		RatingData=$block.rating.RatingData
	                        	RatingSummary=$block.rating.RatingSummary
		                        l10Domain="modules_rating"}
                              </div>
                            </td>
                          </tr>
                        </table>
		          {/if}
		        {/if}
                      </td>
		      {/if}
		      {if ($theme.params.topNavPics == 'right' || $theme.params.topNavPics == 'rightNN')}
                      <td style="width: 1%; text-align:right;" valign="top">
                        {g->theme include="navigatorTop.tpl"}
                      </td>
		      {/if}
		{/if}

		{* for all album pages *}

	            </tr>
        	  </table>
	          {if !count($theme.children)}
        	  <div class="gbBlock giDescription gbEmptyAlbum">
	            <h3 class="emptyAlbum">
	  	      {g->text text="This album is empty."}
	   	      {if isset($theme.permissions.core_addDataItem)}
	   	      <br/>
	           	 <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
	 	      {/if}
	            </h3>
	          </div>
	          {else}
                  <table style="width:100%;" align="center" border="0">
                    <tr>

		      {if !empty($theme.parents) && ($theme.params.ATitle == 'side' && !empty($theme.item.title)) || ($theme.params.ADescription == 'side' && !empty($theme.item.description)) || ($theme.params.AInfo == 'side' && (!empty($theme.params.showAlbumOwner) || !empty($theme.params.ADate) || !empty($theme.params.ASize) || !empty($theme.params.AViewCount) || (!empty($rating) && !empty($theme.params.ARating) && isset($theme.permissions.rating_view))))}
		      <td></td>
		      {/if}

                      <td style="white-space: nowrap">
		      {if $theme.params.NavAlbum == 'top' || $theme.params.NavAlbum == 'both' }
			{if !empty($theme.navigator) && !empty($theme.jumpRange)}
                        <div class="gbNavigator">
                          {assign var='position' value='top'}
                          {g->theme include="navigatorAlbum.tpl"}
                        </div>
		        {/if}
		      {/if}
                      </td>
                    </tr>
                    <tr>

		      {if (!empty($theme.parents) && (($theme.params.ATitle == 'side' && !empty($theme.item.title)) || ($theme.params.ADescription == 'side' && !empty($theme.item.description)) || ($theme.params.AInfo == 'side' && (!empty($theme.params.showAlbumOwner) || !empty($theme.params.ADate) || !empty($theme.params.ASize) || !empty($theme.params.AViewCount) || (!empty($rating) && !empty($theme.params.ARating) && isset($theme.permissions.rating_view)))))) || (empty($theme.parents) && (($theme.params.GTitle == 'side' && !empty($theme.item.title)) || ($theme.params.GDescription == 'side' && !empty($theme.item.description)) || ($theme.params.GInfo == 'side' && (!empty($theme.params.showAlbumOwner) || !empty($theme.params.GDate) || !empty($theme.params.GSize) || !empty($theme.params.GViewCount) || (!empty($rating) && !empty($theme.params.GRating) && isset($theme.permissions.rating_view)))))) || ($theme.params.GBlocksSide == 'side' && !empty($albumSideBlocks))}

                      <td valign="top">
                        <table class="sideInfo" align="center" border="0">
                          <tr>
                            <td style="text-align:left" valign="top">
			      {if ((empty($theme.parents) && $theme.params.GTitle == 'side') || (!empty($theme.parents) && $theme.params.ATitle == 'side')) && !empty($theme.item.title)}
                              <br/>
                              <h2>{$theme.item.title|markup}</h2>
			      {/if}
			      {if ((empty($theme.parents) && $theme.params.GDescription == 'side') || (!empty($theme.parents) && $theme.params.ADescription == 'side')) && !empty($theme.item.description)}
                              <p class="giDescription">
                                {$theme.item.description|markup}
                              </p>
			      {/if}
			      {if (empty($theme.parents) && $theme.params.GInfo == 'side') || (!empty($theme.parents) && $theme.params.AInfo == 'side')}
			        {if (empty($theme.parents) && !empty($theme.params.showGalleryOwner)) || (!empty($theme.parents) && !empty($theme.params.showAlbumOwner))}
		                {assign var="showOwner" value=true}
		                {else}
		                {assign var="showOwner" value=false}
		                {/if}

			        {if (empty($theme.parents) && !empty($theme.params.GDate)) || (!empty($theme.parents) && !empty($theme.params.ADate))}
		                {assign var="showDate" value=true}
		                {else}
		                {assign var="showDate" value=false}
		                {/if}

			        {if (empty($theme.parents) && !empty($theme.params.GSize)) || (!empty($theme.parents) && !empty($theme.params.ASize))}
		                {assign var="showSize" value=true}
		                {else}
		                {assign var="showSize" value=false}
		                {/if}

			        {if (empty($theme.parents) && !empty($theme.params.GViewCount)) || (!empty($theme.parents) && !empty($theme.params.AViewCount))}
		                {assign var="showViewCount" value=true}
		                {else}
		                {assign var="showViewCount" value=false}
		                {/if}

			        <div style="floating:center;text-align:center">
				  <table>
				    <tr>
				      <td>
			 	        {g->block type="core.ItemInfo"
		                                item=$theme.item
		                                showDate=$showDate
        	                        	showOwner=$showOwner
		       	                   	showSize=$showSize
	       			          	showViewCount=$showViewCount
	        	                  	class="giInfo"}
				      </td>
				    </tr>
				  </table>
				</div>

			        {if !empty($rating) && ((empty($theme.parents) && !empty($theme.params.GRating)) || (!empty($theme.parents) && !empty($theme.params.ARating))) && isset($theme.permissions.rating_view)}
		                  {assign var=item value=$theme.item}
                      		  {g->callback type="rating.LoadRating" itemId=$item.id}
			          {if !empty($block.rating.RatingData)}
		                  <table align="center" class="tableacpic">
                   	            <tr>
                          	      <td>
                                        <div style="border:1px; text-align:center" class="{$class}">
 	        	                  {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
		                          RatingData=$block.rating.RatingData
		                          RatingSummary=$block.rating.RatingSummary
		                        l10Domain="modules_rating"}
                        	        </div>
	                              </td>
        	                    </tr>
                	          </table>
			 	  {/if}
			        {/if}
    			      {/if}
                            </td>
                          </tr>

			  {if !empty($albumSideBlocks)}
			  <tr>
			    <td>
			      <table style="text-align:left">
			        <tr>
			  	  <td style="height:15px">
				  </td>
				</tr>

			        {foreach from=$theme.params.albumSideBlocks item=block}
			        <tr>
			          <td {if $block.0 == 'imageblock.ImageBlock'}style="text-align:center;"{else}style="text-align:left;"{/if}>
			 	    <div id="gsSideBlocks" style="width:100%;">
			 	      {g->block type=$block.0 params=$block.1}
				    </div>
			          </td>
			        </tr>
			        {/foreach}

			      </table>
			    </td>
			  </tr>
			  {/if}
                        </table>
                      </td>
		      {/if}

                      <td valign="top">
                        {assign var="childrenInColumnCount" value=0}
                        <div class="gbBlock">
                          <table {if empty($theme.params.Iinfo)}id="gsThumbMatrix"{/if} align="center" border="0">
                            <tr valign="top">
                              {foreach from=$theme.children item=child}

			      {* Move to a new row *}
			      {if (empty($theme.parents) && ($childrenInColumnCount == $theme.params.Gcolumns)) || (!empty($theme.parents) && ($childrenInColumnCount == $theme.params.columns))}
                            </tr>
                            <tr valign="top">
                              {assign var='childrenInColumnCount' value=0}
			      {/if}

                              {assign var='name' value=$child.id}
                              {assign var=childrenInColumnCount value="`$childrenInColumnCount+1`"}

			      <td class="{if $child.canContainChildren}giAlbumCell {if !empty($theme.params.Iinfo)}gcBackground1{/if}{else}giItemCell{/if}" valign="top" align="center" style="padding-bottom:{$TspaceV}px; margin:0px;">
				{if ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')}
				  {assign var=frameType value='albumFrame'}
				  {capture assign=linkUrl}{strip}
				    {if ($theme.params.enterAlbumDirect == 'thumbs' || 
					($theme.params.enterAlbumDirect == 'thumbsNoAlbum' && $child.canContainChildren))}
				      {g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`" arg3="enterAlbum=`$child.canContainChildren`"}
				    {else}
				      {g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}
				    {/if}
				  {/strip}{/capture}
				{else}
				  {assign var=frameType value="itemFrame"}
				  {capture assign=linkUrl}{strip}
				    {if ($theme.params.enterAlbumDirect == 'thumbs' || 
					($theme.params.enterAlbumDirect == 'thumbsNoAlbum' && $child.canContainChildren))}
				      {if $theme.params.dynamicLinks == 'jump'}
				      	{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`" arg3="enterAlbum=`$child.canContainChildren`"}
				      {else}
				      	{g->url params=$theme.pageUrl arg1="itemId=`$child.id`" arg3="enterAlbum=`$child.canContainChildren`"}
				      {/if}
				    {else}
				      {if $theme.params.dynamicLinks == 'jump'}
				      	{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}
				      {else}
				      	{g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}
				      {/if}
				    {/if}
				  {/strip}{/capture}
				{/if}


				<div style="position:relative; top:0px; left:0px;padding-left:{$TspaceH}px; padding-right:{$TspaceH}px;" >

			          {if isset($theme.params.$frameType) && isset($child.thumbnail)}
			 	  {strip}
                                    {g->container type="imageframe.ImageFrame" frame=$theme.params.$frameType}
				    <div style="width:{$child.thumbnail.width}px"class="opacityT">
				    <a href="{$linkUrl}" class="opacityT"
				      {if !empty($theme.params.Iinfo) && !empty($theme.params.IinfoLink)}onmouseover="toggleLyr('infoI{$child.id}');"{/if}>
				      {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
					{g->image id="%ID%" item=$child image=$child.thumbnail class="%CLASS% giThumbnail" 
						title="Album - `$child.title`"}
				      {else}
					{g->image id="%ID%" item=$child image=$child.thumbnail class="%CLASS% giThumbnail" 
						title=$child.title}
				      {/if}
				    </a>
				    </div>

				    {if !empty($theme.params.Iinfo) && !empty($theme.params.IinfoLink)}
				    <div id="infoI{$child.id}" 
					style="position:absolute; left: 0px; top:0px; text-align:left; z-index: 35; visibility: hidden; padding:3px; cursor: help;" class="BlockOpacity">

				      {literal}<script type="text/JavaScript">
					//<![CDATA[
					<!--
					img = {/literal}"
<a href=\"javascript:void(0)\" onclick=\"toggleLyr('infoblockI{$child.id}');setLyr(this,'infoblockI{$child.id}',-20,-20);\" title=\"{g->text text='Image Info'}\" class=\"icon tLink-info_expand\" style=\"padding-bottom: 2px; padding-top: 2px; text-decoration: none; cursor: help;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Image Info'}\" title=\"{g->text text='Image Info'}\"\/><\/a>"{literal};
					function Viewinfo(){document.write(img);}
					Viewinfo();
					//-->
					//]]>
				      </script>{/literal}
				    </div>
				    {/if}
                      		    {/g->container}
				  {/strip}
			          {elseif isset($child.thumbnail)}
				  {strip}
				    <div style="width:{$child.thumbnail.width}px"class="opacityT">
				    <a href="{$linkUrl}" class="opacityT"
				      {if !empty($theme.params.Iinfo) && !empty($theme.params.IinfoLink)}onmouseover="toggleLyr('infoI{$child.id}');"{/if}>
				      {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
					{g->image id="%ID%" item=$child image=$child.thumbnail class="%CLASS% giThumbnail" 
						title="Album - `$child.title`"}
				      {else}
					{g->image id="%ID%" item=$child image=$child.thumbnail class="%CLASS% giThumbnail" 
						title=$child.title}
				      {/if}
				    </a>
				    </div>


				    {if !empty($theme.params.Iinfo) && !empty($theme.params.IinfoLink)}
				    <div id="infoI{$child.id}" 
					style="position:absolute; left:0px; top:0px; text-align:left; z-index: 35; visibility: hidden; padding:3px; cursor: help;" class="BlockOpacity">
				      {literal}<script type="text/JavaScript">
					//<![CDATA[
					<!--
					img = {/literal}"
<a href=\"javascript:void(0)\" onclick=\"toggleLyr('infoblockI{$child.id}');setLyr(this,'infoblockI{$child.id}',-20,-20)\" title=\"{g->text text='Image Info'}\" class=\"icon tLink-info_expand\" style=\"padding-bottom: 2px; padding-top: 2px; text-decoration: none; cursor: help;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Image Info'}\" title=\"{g->text text='Image Info'}\"\/><\/a>"{literal};
					function Viewinfo(){document.write(img);}
					Viewinfo();
					//-->
					//]]>
				      </script>{/literal}
				    </div>
				    {/if}

				  {/strip}
			          {else}
				    <table style="width:100px; text-align:center;" class="giThumbnail">
				      <tr>
					<td style="text-align:center;">
					  <h3 style="text-align:center;">
					    <a href="{$linkUrl}"><br/>
					      {g->text text="No Thumbnail"}
			          	      {if !empty($child.title)}
						{g->text text="for"}:<br/>
					      {/if}
			          	      {if ($theme.params.ITitle != 'both' && $theme.params.ITitle != 'albums' && $theme.params.ITitle != 'photos')}
					        {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
					          {g->text text="Album -"}
					        {/if}
					          "{$child.title}"
					      {/if}
					    </a>
					  </h3>
					</td>
				      </tr>
				    </table>
			          {/if}
				</div>

			        {if !empty($theme.params.Iinfo) && !empty($theme.params.IinfoLink)}
                                <div id="infoblockI{$child.id}" style="position:absolute; top:0px; left:0px; visibility: hidden; text-align:center; z-index: 30;" class="infoblockIopacity">
                                  <div {if !empty($theme.params.Iinfo)} style="width:220px;" class="gcBackground2 gcBorder2"{/if}>
                                    <table style="width:220px;" class="gcBorder1 gcBackground1">
                                      <tr>
                                        <td class="gcBorder1 gcBackground1" style="text-align:right">
 				          <div onmousedown="dragStart(event, 'infoblockI{$child.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
                                            <a onmouseover="hideLyr('infoblockI{$child.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
					  </div>
                                        </td>
                                      </tr>
 			              <tr>
				        <td class="gcBorder1">
				          <table>
					    <tr>
					      <td>
					        <table>
					          <tr>
					            <td style="padding: 6px; background-color: #fff;">
					              <a href="{$linkUrl}">
						        {g->image item=$child image=$child.thumbnail maxSize="100"}
						      </a>
					            </td>
					          </tr>
					        </table>
				              </td>
				            </tr>
                                            <tr>
                                              <td>

			          	      {if !empty($child.title) && ($theme.params.ITitle == 'both' || $theme.params.ITitle == 'bothF' || (($theme.params.ITitle == 'albums' || $theme.params.ITitle == 'albumsF') && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || (($theme.params.ITitle == 'photos' || $theme.params.ITitle == 'photosF') && !$child.canContainChildren))}
                                    	        <p class="giTitle">
				  	        <a href="{$linkUrl}">
				      	          {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
                                      		    {g->text text="&#9642;"}
 				      	          {/if}
                                      		    {$child.title|markup}
				      	          {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
                                      		    {g->text text="&#9642;"}
 				      	          {/if}
				  	        </a>
                                    	        </p>
			          	      {/if}
					      {if !empty($child.description) && ($theme.params.IDesc == 'bothF' || ($theme.params.IDesc == 'albumsF' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IDesc == 'photosF' && !$child.canContainChildren))}
                                  	        <p class="giDescription">
                                    	          {$child.description|markup|entitytruncate:256}
                                  	        </p>
			          	      {/if}
			            	      {if !empty($child.summary) && ($theme.params.ISum == 'bothF' || ($theme.params.ISum == 'albumsF' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.ISum == 'photosF' && !$child.canContainChildren))}
                                  	        <p class="giDescription">
                                      	          {$child.summary|markup|entitytruncate:256}
                                  	        </p>
				  	      {/if}

			          	      {if $theme.params.IDate == 'both' || ($theme.params.IDate == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IDate == 'photos' && !$child.canContainChildren)}
				              {assign var="showDate" value=true}
				              {else}
				              {assign var="showDate" value=false}
				  	      {/if}

			          	      {if $theme.params.showItemsOwner == 'both' || ($theme.params.showItemsOwner == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')&& $theme.params.showAlbumOwner) || ($theme.params.showItemsOwner == 'photos' && !$child.canContainChildren && !empty($theme.params.showImageOwner))}
				              {assign var="showOwner" value=true}
				              {else}
				              {assign var="showOwner" value=false}
			          	      {/if}

			          	      {if $theme.params.IViewCount == 'both' || ($theme.params.IViewCount == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IViewCount == 'photos' && !$child.canContainChildren)}
				              {assign var="showViewCount" value=true}
				              {else}
				              {assign var="showViewCount" value=false}
			          	      {/if}

			          	      {if $theme.params.ISummaries == 'both' || ($theme.params.ISummaries == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.ISummaries == 'photos' && !$child.canContainChildren)}
				              {assign var="showSummaries" value=true}
				              {else}
				              {assign var="showSummaries" value=false}
			          	      {/if}

					      <div style="align:left; text-align:left">
						<table align="left">
						  <tr>
						    <td style="text-align:center;align:center">
<span  style="text-align:center; align:center">
			 	                      {g->block type="core.ItemInfo"
	        	                      		item=$child
		                	                showDate=$showDate
 		              	      	           	showOwner=$showOwner
			                          	showSize=$theme.params.ISize
		       			          	showViewCount=$showViewCount
	                                            	showSummaries=$showSummaries
		 	       	                  	class="giInfo"}
</span>
						    </td>
						  </tr>
						</table>
					      </div>

			          	      {if !empty($rating) && ($theme.params.ISummaries == 'none') && isset($theme.permissions.rating_view)}
				    	        {if $theme.params.IRating == 'both' || ($theme.params.IRating == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IRating == 'photos' && !$child.canContainChildren)}
                                    	          {g->callback type="rating.LoadRating" itemId=$child.id}
				    	          {if !empty($block.rating.RatingData)}
                          	  	            <table align="center" class="tableacpic">
	                            	              <tr>
          	                      		        <td>
                      		        	          <div style="border:1px; text-align:center" class="{$class}">
                                        	            {include file="gallery:modules/rating/templates/RatingInterface.tpl" 
	                         	  			RatingData=$block.rating.RatingData
		                        	  		RatingSummary=$block.rating.RatingSummary
		              				        l10Domain="modules_rating"}
                                		          </div>
                              	      		        </td>
                            	    	              </tr>
	                          	            </table>
			            	          {/if}
			          	        {/if}
					      {/if}
                                	        <table class="tableacpic">
                                  	          <tr>
					            <td>
					            </td>
    				    	  	    {if empty($child.canContainChildren) && !empty($theme.params.IViewCart) && ((($theme.zencart =='1') &&  isset ($theme.permissions.zencart_add)) || ($theme.cart == '1') || (($theme.cart == '2' || $theme.cart == '3') && isset($theme.permissions.checkout_purchase)))}
                                    	  	    <td style="text-align:left; white-space: nowrap">
			              	    	      {if ($theme.cart == '1') || ($theme.cart == '3' && $theme.params.CartSelect == 'cart')}
                                      	 	      <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
				        	        <img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
				      	   	      </a>
				      	      	      {/if}
				      	      	      {if ($theme.cart == '2') || ($theme.cart == '3' && $theme.params.CartSelect == 'checkout')}
                                      	      	      <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
				        	        <img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
				      	      	      </a>
				      	      	      {/if}
				      	      	      {if ($theme.cart == '3') && ($theme.params.CartSelect == 'both')}
				      	                {literal}<script type="text/JavaScript">
				      		        //<![CDATA[
				      		        <!--
				      			  img = {/literal}"<a href='javascript:void(0)' onclick=\"toggleLyr('cartAddI{$child.id}');setLyr(this,'cartAddI{$child.id}',-130,-80)\" title=\"{g->text text='Add Item to Cart'}\" class=\"icon tLink-add_cart\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Add Item to Cart'}\" alt=\"{g->text text='Add Item to Cart'}\"\/><\/a>"{literal};
				      			  function Addcart(){document.write(img);}
				      			  Addcart();
				      		        //-->
				      		        //]]>
				      		        </script>{/literal}
				      		        <noscript>
 			              		        {if !empty($theme.zipcart) || !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}
				      		  	  <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{if $theme.zipcart}{g->text text='Download in Zip'}{if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4} || !empty($theme.print5){$separator}{g->text text='Print a copy'}{/if}{else}{g->text text='Print a copy'}{/if}">
			                	    	    {if $theme.zipcart}{g->text text='Zip'}{else}{g->text text='Print'}{/if}
				      		  	  </a>
				      		        {/if}
				      			  <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
				        	  	    <img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
				      			  </a>
				      		        </noscript>
				      	      	      {/if}

						      {if ($theme.zencart == '1')}
   	          					<a href="{g->url arg1="controller=zencart.PurchaseOptions" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
							</a>
				  		      {/if}


                                    	    	    </td>
				    	    	    {/if} 
			   	    	            {g->callback type="comment.AddComment" itemId=$child.id}
				                    {if !empty($block.comment.AddComment) && ($theme.params.IAddComment != 'none') && (isset ($theme.permissions.comment_add))}
                                    	            <td>
			 	      	              {if ($theme.params.IAddComment == 'floating')}
			  	      		        {literal}<script type="text/JavaScript">
				      		        //<![CDATA[
				      		        <!--
				      			  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('addcommentI{$child.id}');setLyr(this,'addcommentI{$child.id}',-300,-280)\" title=\"{g->text text='Add a Comment'}\" class=\"icon tLink-add_comment\"style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add a Comment'}\" title=\"{g->text text='Add a Comment'}\"\/><\/a>"{literal};
				      			  function Viewaddcom(){document.write(img);}
			 	      			  Viewaddcom();
				      		        //-->
				      		        //]]>
				      		        </script>{/literal}
				      		        <noscript>
						  	  <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$child.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment"style="padding-bottom: 2px; padding-top: 2px;">
					  	    	    <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
						  	  </a>
				      		        </noscript>
				      	              {else}
				      		        <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$child.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment"style="padding-bottom: 2px; padding-top: 2px;">
						          <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
				      		        </a>
				      	              {/if}
                                    	            </td>
					            {/if}
					            {if !empty($comments) && !empty($theme.params.IComments) && isset($theme.permissions.comment_view)}
	              			              {g->callback type="comment.LoadComments" itemId=$child.id show=$show}
			    	      	              {if !empty($block.comment.LoadComments.comments)}
                                    	              <td style="text-align:left; white-space: nowrap">
				      	      	        {literal}<script type="text/JavaScript">
				      		        //<![CDATA[
				      		        <!--
				      		          img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('commentsI{$child.id}');setLyr(this,'commentsI{$child.id}',-300,-280)\" title=\"{g->text text='View Comments'}\" class=\"icon tLink-view_comment\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Show Comments'}\" alt=\"{g->text text='Show Comments'}\"\/><\/a>"{literal};
				      		          function Viewcom(){document.write(img);}
				      		          Viewcom();
				      		        //-->
				      	 	        //]]>
				      		        </script>{/literal}
                                    	              </td>
				      	              {/if}
				    	            {/if}
				    	            {if !empty($exif) &&  !empty($theme.params.IExif) && empty($child.canContainChildren)}
   			              		      {capture assign="Eblock"}{g->block type="exif.ExifInfo" item=$child}{/capture}
			              		      {capture assign="Eblock"}{$Eblock|trim}{/capture}
      				      	              {if !empty($Eblock)}
                                    	              <td style="text-align:left; white-space: nowrap"> 
				      		        {literal}<script type="text/JavaScript">
				      		        //<![CDATA[
				      		        <!--
				      		          img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('exifI{$child.id}');setLyr(this,'exifI{$child.id}',-300,-280)\" title=\"{g->text text='Show EXIF'}\" class=\"icon tLink-exif_parser\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Show EXIF'}\" alt=\"{g->text text='Show EXIF'}\"\/><\/a>"{literal};
				      		          function Viewexif(){document.write(img);}
				      		          Viewexif();
				      		        //-->
				      		        //]]>
				      		        </script>{/literal}
                                    	              </td>
				      	              {/if}
				    	            {/if}

					 	    {if ($theme.params.IeCard) && !empty($theme.ecard) && isset ($theme.permissions.ecard_send)}
                                    	            <td style="text-align:left; white-space: nowrap"> 
						      <a href="{g->url arg1="view=ecard.SendEcard" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Send as eCard'}" class="icon tLink-ecard" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Send as eCard'}" alt="{g->text text='Send as eCard'}"/></a>
                                    	            </td>
	      					    {/if}
				  	          </tr>
                                	        </table>
					      </td>
					    </tr>
					  </table>
                                        </td>
                                      </tr>
                                    </table>
                                  </div>
                                </div>
		                {/if}

			        {if !empty($child.title) && ($theme.params.ITitle == 'both' || ($theme.params.ITitle == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.ITitle == 'photos' && !$child.canContainChildren))}
                                  <p class="giTitle">
				    <a href="{$linkUrl}">
				    {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
                                      {g->text text="&#9642;"}
 				    {/if}
                                    {$child.title|markup}
				    {if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
                                      {g->text text="&#9642;"}
 				    {/if}

				    </a>
                                  </p>{assign var='Tline' value=1}
			        {/if}
				{if !empty($child.description) && ($theme.params.IDesc == 'both' || ($theme.params.IDesc == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IDesc == 'photos' && !$child.canContainChildren))}
                                  <p class="giDescription">
                                    {$child.description|markup|entitytruncate:256}
                                  </p>{assign var='Tline' value=1}
			        {/if}
			        {if !empty($child.summary) && ($theme.params.ISum == 'both' || ($theme.params.ISum == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.ISum == 'photos' && !$child.canContainChildren))}
                                  <p class="giDescription">
                                    {$child.summary|markup|entitytruncate:256}
                                  </p>{assign var='Tline' value=1}
				{/if}
				{if !empty($Tline)}<br/>{/if}

			        {if empty($theme.params.Iinfo)}

				  {if $theme.params.IDate == 'both' || ($theme.params.IDate == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IDate == 'photos' && !$child.canContainChildren)}
			            {assign var="showDate" value=true}
				  {else}
				    {assign var="showDate" value=false}
				  {/if}

			          {if $theme.params.showItemsOwner == 'both' || ($theme.params.showItemsOwner == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')&& $theme.params.showAlbumOwner) || ($theme.params.showItemsOwner == 'photos' && !$child.canContainChildren && !empty($theme.params.showImageOwner))}
				    {assign var="showOwner" value=true}
				  {else}
				    {assign var="showOwner" value=false}
			          {/if}

			          {if $theme.params.IViewCount == 'both' || ($theme.params.IViewCount == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IViewCount == 'photos' && !$child.canContainChildren)}
				    {assign var="showViewCount" value=true}
				  {else}
				    {assign var="showViewCount" value=false}
			          {/if}

			          {if $theme.params.ISummaries == 'both' || ($theme.params.ISummaries == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.ISummaries == 'photos' && !$child.canContainChildren)}
				    {assign var="showSummaries" value=true}
				  {else}
				    {assign var="showSummaries" value=false}
			          {/if}

			          <div style="floating:center;text-align:center">
				    <table align="center">
				      <tr>
				        <td>
			 	          {g->block type="core.ItemInfo"
        	                      		item=$child
	                	                showDate=$showDate
	              	      	           	showOwner=$showOwner
		                          	showSize=$theme.params.ISize
	       			          	showViewCount=$showViewCount
                                           	showSummaries=$showSummaries
	 	       	                  	class="giInfo"}
				        </td>
				      </tr>
				    </table>
				  </div>

			          {if !empty($rating) && ($theme.params.ISummaries == 'none') && isset($theme.permissions.rating_view)}
				    {if $theme.params.IRating == 'both' || ($theme.params.IRating == 'albums' && ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')) || ($theme.params.IRating == 'photos' && !$child.canContainChildren)}
                                      {g->callback type="rating.LoadRating" itemId=$child.id}
				      {if !empty($block.rating.RatingData)}
                          	  	<table align="center" class="tableacpic">
	                            	  <tr>
          	                      	    <td>
                      		              <div style="border:1px; text-align:center" class="{$class}">
                                        	{include file="gallery:modules/rating/templates/RatingInterface.tpl" 
	                         	  			RatingData=$block.rating.RatingData
		                        	  		RatingSummary=$block.rating.RatingSummary
		                        			l10Domain="modules_rating"}
                                	      </div>
                              	      	    </td>
                            	    	  </tr>
	                         	</table>
			              {/if}
			            {/if}
				  {/if}

                                  <table class="tableacpic">
                                    <tr>
				      <td>
				      </td>
    				      {if empty($child.canContainChildren) && !empty($theme.params.IViewCart) && ((($theme.zencart =='1') &&  isset ($theme.permissions.zencart_add)) || ($theme.cart == '1') || (($theme.cart == '2' || $theme.cart == '3') && isset($theme.permissions.checkout_purchase)))}
                                      <td style="text-align:left; white-space: nowrap">
			              	{if ($theme.cart == '1') || ($theme.cart == '3' && $theme.params.CartSelect == 'cart')}
                                      	  <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
				            <img src="{$imageURL_base}blank.gif" U.S.C. Title 18, Section 2257 Compliance Noticetitle="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
				      	  </a>
				      	{/if}
				      	{if ($theme.cart == '2') || ($theme.cart == '3' && $theme.params.CartSelect == 'checkout')}
                                      	  <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
				            <img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
				      	  </a>
				      	{/if}
				      	{if ($theme.cart == '3') && ($theme.params.CartSelect == 'both')}
				      	  {literal}<script type="text/JavaScript">
				      	    //<![CDATA[
				      	    <!--
				      	      img = {/literal}"<a href='javascript:void(0)' onclick=\"toggleLyr('cartAddI{$child.id}');setLyr(this,'cartAddI{$child.id}',-130,-80)\" title=\"{g->text text='Add Item to Cart'}\" class=\"icon tLink-add_cart\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Add Item to Cart'}\" alt=\"{g->text text='Add Item to Cart'}\"\/><\/a>"{literal};
				     	      function Addcart(){document.write(img);}
				      	      Addcart();
				      	    //-->
				      	    //]]>
				          </script>{/literal}
				          <noscript>
 			              	    {if !empty($theme.zipcart) || !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}
				      	      <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{if $theme.zipcart}{g->text text='Download in Zip'}{if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}{$separator}{g->text text='Print a copy'}{/if}{else}{g->text text='Print a copy'}{/if}">
			                    	{if $theme.zipcart}{g->text text='Zip'}{else}{g->text text='Print'}{/if}
				      	      </a>
				      	    {/if}
				      	    <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
				          	<img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
				      	    </a>
				      	  </noscript>
				      	{/if}
	 			        {if ($theme.zencart == '1')}
   	          			  <a href="{g->url arg1="controller=zencart.PurchaseOptions" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/>
					  </a>
				        {/if}
                                      </td>
				      {/if} 

			   	      {g->callback type="comment.AddComment" itemId=$child.id}
				      {if !empty($block.comment.AddComment) && ($theme.params.IAddComment != 'none') && (isset ($theme.permissions.comment_add))}
                                      <td>
			 	        {if ($theme.params.IAddComment == 'floating')}
			  	      	  {literal}<script type="text/JavaScript">
				      	    //<![CDATA[
				            <!--
				              img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('addcommentI{$child.id}');setLyr(this,'addcommentI{$child.id}',-300,-280)\" title=\"{g->text text='Add a Comment'}\" class=\"icon tLink-add_comment\"style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add a Comment'}\" title=\"{g->text text='Add a Comment'}\"\/><\/a>"{literal};
				      	      function Viewaddcom(){document.write(img);}
			 	      	      Viewaddcom();
				      	    //-->
				      	    //]]>
				      	  </script>{/literal}
				      	  <noscript>
					    <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$child.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment"style="padding-bottom: 2px; padding-top: 2px;">
					      <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
					    </a>
				      	  </noscript>
				      	{else}
				      	  <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$child.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment"style="padding-bottom: 2px; padding-top: 2px;">
					    <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
				      	  </a>
				      	{/if}
                                      </td>
				      {/if}
				      {if !empty($comments) && !empty($theme.params.IComments) && isset($theme.permissions.comment_view)}
	              			{g->callback type="comment.LoadComments" itemId=$child.id show=5}
			    	      	{if !empty($block.comment.LoadComments.comments)}
                                    	  <td style="text-align:left; white-space: nowrap">
				      	    {literal}<script type="text/JavaScript">
				      	      //<![CDATA[
				      	      <!--
				      		img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('commentsI{$child.id}');setLyr(this,'commentsI{$child.id}',-300,-280)\" title=\"{g->text text='View Comments'}\" class=\"icon tLink-view_comment\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Show Comments'}\" alt=\"{g->text text='Show Comments'}\"\/><\/a>"{literal};
				      		function Viewcom(){document.write(img);}
				      		Viewcom();
				      	      //-->
				      	      //]]>
				      	    </script>{/literal}
                                    	  </td>
				      	{/if}
				      {/if}
				      {if !empty($exif) &&  !empty($theme.params.IExif) && empty($child.canContainChildren)}
   			                {capture assign="Eblock"}{g->block type="exif.ExifInfo" item=$child}{/capture}
			              	{capture assign="Eblock"}{$Eblock|trim}{/capture}
      				      	{if !empty($Eblock)}
                                    	  <td style="text-align:left; white-space: nowrap"> 
				      	    {literal}<script type="text/JavaScript">
				      	      //<![CDATA[
				      	      <!--
				      		img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('exifI{$child.id}');setLyr(this,'exifI{$child.id}',-300,-280)\" title=\"{g->text text='Show EXIF'}\" class=\"icon tLink-exif_parser\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Show EXIF'}\" alt=\"{g->text text='Show EXIF'}\"\/><\/a>"{literal};
				      		function Viewexif(){document.write(img);}
				      		Viewexif();
				      	      //-->
				      	      //]]>
				      	    </script>{/literal}
                                    	  </td>
				      	{/if}
				      {/if}
			 	      {if ($theme.params.IeCard) && !empty($theme.ecard) && isset ($theme.permissions.ecard_send)}
                                    	<td style="text-align:left; white-space: nowrap"> 
					  <a href="{g->url arg1="view=ecard.SendEcard" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Send as eCard'}" class="icon tLink-ecard" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Send as eCard'}" alt="{g->text text='Send as eCard'}"/></a>
                                    	</td>
	      			      {/if}
				    </tr>
                                  </table>
			        {/if}

    				{if empty($child.canContainChildren) && ($theme.cart == '3') && ($theme.params.CartSelect == 'both') && !empty($theme.params.IViewCart) && (($theme.cart == '1') || (($theme.cart == '2' || $theme.cart == '3') && isset($theme.permissions.checkout_purchase)))}
                                  <div id="cartAddI{$child.id}" style="position:absolute; left: 0px; top: 0px; text-align:left; z-index: 35; visibility: hidden;" class="BlockOpacity">
                                    <table style="width:165px" class="gcBackground2 gcBorder2">
				      <tr>
                               	        <td class="gcBorder1 gcBackground1">
			     	          <div onmousedown="dragStart(event, 'cartAddI{$child.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
				            <table style="width:100%" class="gcBackground1">
					      <tr>
					        <td style="text-align:left">
         	    				  <h3>&nbsp;{$child.title|markup}</h3>
				 	        </td>
					        <td style="text-align:right">
                                               	  <a onmouseover="hideLyr('cartAddI{$child.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
					        </td>
					      </tr>		
					    </table>
			 		  </div>
		      		        </td>
		    		      </tr>
				      <tr>
                                        <td style="align:center">
                                        {if !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}
                                          <table style="text-align:left; width:160px;">
                                            <tr>
                                              <td style="width:75px;">
                                                {g->text text='Print with'}
                                              </td>
                                              <td>
                                                <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" >
                                          	    {if !empty($theme.print)}{$theme.print}<br/>{/if}
                                            	    {if !empty($theme.print1)}{$theme.print1}<br/>{/if}
                                            	    {if !empty($theme.print2)}{$theme.print2}<br/>{/if}
                                            	    {if !empty($theme.print3)}{$theme.print3}<br/>{/if}
                                                    {if !empty($theme.print4)}{$theme.print4}<br/>{/if}
                                                    {if !empty($theme.print4)}{$theme.print5}{/if}
                                                </a>
                                              </td>
                                            </tr>
                                          </table>
                                        {/if}
                                        {if !empty($theme.zipcart)}
                                          {if !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}
                                        </td>
				      </tr>
				      <tr> 
                               	        <td style="align:center">
                                          {/if}
                               		  <table  style="text-align:left; width:160px;">
                                       	    <tr>
                                       	      <td style="width:75px;">
                                       	        {g->text text='Download in'}
                                       	      </td>
                                       	      <td>
                                       	        <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}" >
                                       		  {g->text text='Zip'}
                                       	        </a>
                                       	      </td>
                                       	    </tr>
                               		  </table>
                               		{/if}
                               		{if !empty($theme.zipcart) || !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}
                               	        </td>
			 	      </tr>
			 	      <tr> 
                              	        <td style="align:center">
                               		{/if}
                               		  <table  style="text-align:left; width:160px;">
                                       	    <tr>
                                       	      <td>
                                       	        <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$child.id`" arg3="return=`$child.id`"}">
                                       	          {g->text text='Purchase Item'}
                                       	        </a>
                                      	      </td>
                                       	    </tr>
                               		  </table>
                               	        </td>
                               	      </tr>
                               	    </table>
                        	  </div>
			        {/if }

		                {if !empty($block.comment.AddComment) && ($theme.params.IAddComment == 'floating') && ($theme.params.IAddComment != 'none') && (isset ($theme.permissions.comment_add))}
                                  <div id="addcommentI{$child.id}" style="position:absolute; left: 0px; top: 0px; text-align:left; z-index: 35; visibility: hidden;" class="BlockOpacity">
                                    <table class="gcBackground2 gcBorder2">
				      <tr>
                               	        <td class="gcBorder1 gcBackground1">
			     	          <div onmousedown="dragStart(event, 'addcommentI{$child.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
				            <table style="width:100%" class="gcBackground1">
					      <tr>
					        <td style="text-align:left">
         	    				  <h3>&nbsp;{$child.title|markup}</h3>
				 	        </td>
					        <td style="text-align:right">
                                               	  <a onmouseover="hideLyr('addcommentI{$child.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
					        </td>
					      </tr>		
					    </table>
			 		  </div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="gcBorder1">
                                          {g->block type="comment.AddComment" expand=false item=$child}
                                        </td>
                                      </tr>
                                    </table>
                                  </div>
			 	{/if}
			        {if !empty($comments) && !empty($block.comment.LoadComments.comments) && !empty($theme.params.IComments) && isset($theme.permissions.comment_view)}
                                  <div id="commentsI{$child.id}" style="position:absolute; left: 0px; top: 0px; text-align:left; z-index: 35; visibility: hidden;" class="BlockOpacity">
                                    <table style="width:500px" class="gcBackground2 gcBorder2">
				      <tr>
                               	        <td class="gcBorder1 gcBackground1">
			     	          <div onmousedown="dragStart(event, 'commentsI{$child.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
				            <table style="width:100%" class="gcBackground1">
					      <tr>
					        <td style="text-align:left">
         	    			         <h3>&nbsp;{$child.title|markup}</h3>
				 	        </td>
					        <td style="text-align:right">
                                                  <a onmouseover="hideLyr('commentsI{$child.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
					        </td>
					      </tr>		
					    </table>
			 		  </div>
		      		        </td>
		    		      </tr>
                                      <tr>
                                        <td class="gcBorder1">
                                          {g->block type="comment.ViewComments" item=$child }
                                        </td>
                                      </tr>
                                    </table>
                                  </div>
			    	{/if }
			        {if !empty($exif) && !empty($Eblock) && !empty($theme.params.IExif) && empty($child.canContainChildren)}
                                  <div id="exifI{$child.id}" style="position:absolute; left: 0px; top: 0px; text-align:left; z-index: 35; visibility: hidden;" class="BlockOpacity">
                                    <div id="exifIIn{$child.id}" style="position: relative; left: 0px; top: 0px; z-index: 10;">
                                      <table style="width:500px" class="gcBackground2 gcBorder2">
				        <tr>
                               	          <td class="gcBorder1 gcBackground1">
			     	            <div onmousedown="dragStart(event, 'exifI{$child.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
				              <table style="width:100%" class="gcBackground1">
					        <tr>
					          <td style="text-align:left">
         	    				    <h3>&nbsp;{$child.title|markup}</h3>
				 	          </td>
					          <td style="text-align:right">
                                               	    <a onmouseover="hideLyr('exifI{$child.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
					          </td>
					        </tr>		
					      </table>
			 		    </div>
		      		          </td>
		    		        </tr>
                                        <tr>
					  <td class="gcBorder1">
					    <table style="width:500px">
					      <tr>
					        <td>
                                                  {$Eblock}
					        </td>
					      </tr>
					    </table>
				          </td>
				        </tr>
				      </table>
                                    </div>
                                  </div>
				{/if}

		          	{if ($theme.guestPreviewMode != 1) && ($user.isAdmin || ($child.ownerId == $user.id))}
			    	  {g->block type="core.ItemLinks" item=$child links=$child.itemLinks}
				{/if}
		                </td>
			      {/foreach}

			    </tr>
		          </table>
		        </div>
                      </td>
                    </tr>

		    {if ($theme.params.NavAlbum == 'bottom' || $theme.params.NavAlbum == 'both') && (!empty($theme.navigator) && !empty($theme.jumpRange))}
                    <tr>
		      {if !empty($theme.parents) && ($theme.params.ATitle == 'side' && !empty($theme.item.title)) || ($theme.params.ADescription == 'side' && !empty($theme.item.description)) || ($theme.params.AInfo == 'side' && (!empty($theme.params.showAlbumOwner) || !empty($theme.params.ADate) || !empty($theme.params.ASize) || !empty($theme.params.AViewCount) || (!empty($rating) && !empty($theme.params.ARating) && isset($theme.permissions.rating_view))))}
		      <td></td>
		      {/if}
		      <td style="white-space: nowrap">
                        <div class="gbNavigator">
                          {assign var='position' value='bottom'}
                          {g->theme include="navigatorAlbum.tpl"}
                        </div>
                      </td>
		    </tr> 
		    {/if}
                  </table>
	          {/if}
                  <table>
		    <tr>
		      <td style="height:7px">
		      </td>
		    </tr>
		  </table>
                </div>
    
              </td>
            </tr>
          </table>

      {if ($theme.params.showInfoMsg == 'top') || ($theme.params.showInfoMsg == '1sttop')}
	    </td>
	  </tr>
	</table>
      {/if}

          </td>
        </tr>
      </table>

    </td><td style="width:1%"></td>
  </tr>
</table>


      {* static comments *}
      {assign var=item value=$theme.item}
      {g->callback type="comment.AddComment" itemId=$item.id}
      {g->callback type="comment.LoadComments" itemId=$item.id show=5}

      {if isset ($theme.permissions.comment_view) && !empty($comments) && !empty ($block.comment.LoadComments.comments) && ((empty($theme.parents) && !empty($theme.params.GStaticComments)) || (!empty($theme.parents) && !empty($theme.params.AStaticComments)))}
      <br/>
      <table border="0" style="width:98%">
	<tr>
	  <td>
	    <table style="width:600px" class="gcBorder1" align="{if !empty($theme.params.BlocksAlign)}{$theme.params.BlocksAlign}{else}center{/if}">
              <tr>
                <td style="text-align:right">
  	   	{if !empty($block.comment.AddComment) && ((empty($theme.parents) && ($theme.params.GAddComment != 'none')) || (!empty($theme.parents)&& ($theme.params.AAddComment != 'none'))) && isset($theme.permissions.comment_add)}
		  {if ($theme.params.AAddComment == 'floating') || ($theme.params.GAddComment == 'floating')}
	 	    {literal}<script type="text/JavaScript">
		    //<![CDATA[
		    <!--
		    img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('addcomment');setLyr(this,'addcomment',-550,-450)\" title=\"{g->text text='Add a Comment'}\" class=\"icon tLink-add_comment\"style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add a Comment'}\" title=\"{g->text text='Add a Comment'}\"\/><\/a>"{literal};
		    function Viewaddcom(){document.write(img);}
		    Viewaddcom();
		    //-->
		    //]]>
	    	    </script>{/literal}
		    <noscript>
		      <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment"style="padding-bottom: 2px; padding-top: 2px;">
			<img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
		      </a>
	  	    </noscript>
	  	  {else}
		    <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment"style="padding-bottom: 2px; padding-top: 2px;">
		      <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
		    </a>
	    	  {/if}
		  <div id="addcomment" style="position: absolute; left:0px; top:0px; text-align:left; z-index: 25; visibility: hidden;" class="BlockOpacity">
 		    <table style="width:500px" class="gcBorder2 gcBackground2">
		      <tr>
		        <td class="gcBorder1 gcBackground1">
			  <div onmousedown="dragStart(event, 'addcomment')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			    <table style="width:100%" class="gcBackground1">
			      <tr>
				<td style="text-align:left">
         	    		  <h3>&nbsp;{$item.title|markup}</h3>
				</td>
				<td style="text-align:right">
			          <a onmouseover="hideLyr('addcomment')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
				</td>
			      </tr>		
			    </table>
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
          	</td>
              </tr>
              <tr>
                <td style="text-align:left">
                  {g->block type="comment.ViewComments" params=$block.1}
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      {/if}
      {* /static comments *}

      {* Show any other album blocks (comments, exif etc) *}


      {if !empty($theme.params.albumBlocks) && ((empty($theme.parents) && empty($theme.params.GBlocksBtn)) || (!empty($theme.parents) && empty($theme.params.ABlocksBtn)))}
      <br/>

	{if !empty($showBlocks)}
      <table border="0" style="width:98%">
	<tr>
	  <td>
	    <table style="width:600" align="{if $theme.params.BlocksAlign}{$theme.params.BlocksAlign}{else}center{/if}">
	      <tr>
	        <td></td>
	      </tr>
	      {foreach from=$theme.params.albumBlocks item=block}
	      {if (empty($theme.parents) && ((($block.0 == "comment.AddComment") && ($theme.params.GAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.GComments) || !empty($theme.params.GStaticComments))) || (($block.0 == "rating.Rating") && !empty($theme.params.GRating)) || (($block.0 == "cart.ShowCart") && !empty($theme.params.GViewCart)))) || (!empty($theme.parents) && ((($block.0 == "comment.AddComment") && ($theme.params.AAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.AComments) || !empty($theme.params.AStaticComments))) || (($block.0 == "rating.Rating") && !empty($theme.params.ARating)) || (($block.0 == "cart.ShowCart") && !empty($theme.params.AViewCart))))}
{assign var="block" value=0}{/if}

	      {if !empty($block)}
 	      <tr>
	        <td>
	          <table align="{if $theme.params.BlocksInAlign}{$theme.params.BlocksInAlign}{else}center{/if}">
		    <tr>
		      <td>
                        {g->block type=$block.0 params=$block.1}
		      </td>
		    </tr>
		  </table>
		</td>
	      </tr>
              {/if}
	      {/foreach}
	    </table>
	  </td>
	</tr>
      </table>
	{/if}
      {/if}
<br/>
{g->block type="core.GuestPreview" class="gbBlock"}


	{* Our emergency edit link, if the user removes all blocks containing edit links *}

	{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="sidebar,album,albumSide"}

<br/>






















