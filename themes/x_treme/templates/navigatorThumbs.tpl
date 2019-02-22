{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
{if !empty ($theme.params.MTends)}
{g->callback type="core.LoadPeers" item=$item|default:$theme.item
 windowSize=$theme.params.peerWindowSize|default:null loadThumbnails=true}
{else}
{g->callback type="core.LoadPeers" item=$item|default:$theme.item
 windowSize=$theme.params.peerWindowSize|default:null loadThumbnails=true addEnds=false}
{/if}

{* set variables for microthumbs table dimensions *}
{assign var='tdThumbs' value=$theme.params.sizeMT+$theme.params.MTpadding+$theme.params.MTborder+$theme.params.MTborder+6}

{assign var="data" value=$block.core.LoadPeers}

{assign var="peerTotal" value=0}
{foreach from=$data.peers item=peer}
  {assign var="peerTotal" value=$peerTotal+1}
{/foreach}

{if ($theme.params.MTposition == 'bottomF1R') || ($theme.params.MTposition == 'bottom1R')}
{assign var="tableThumbs" value=$peerTotal*$tdThumbs+$peerTotal*5}
{else}
{assign var="tableThumbs" value=$theme.params.columnsMT*$tdThumbs+$theme.params.columnsMT*7}
{/if}

{assign var='tablewidth' value=$tableThumbs+20}

{assign var='lastIndex' value=0}
{assign var='Index' value=0}

<table align="center" border="0">
  <tr>
    <td style="text-align:center">
      <table class="gcBackground2 gcBorder2" align="center" style="text-align:center">


{if !empty($theme.params.MTmargin)}
  	<tr>
    	  <td><table style="width:{$theme.params.MTmargin}px; height:{$theme.params.MTmargin}px;"><tr><td></td></tr></table></td><td></td><td></td>
	</tr>
	<tr><td></td>
{else}
<tr>
{/if}
	  <td>
	    <table border="0">

  	{if !empty($data.peers)}
    	  {foreach from=$data.peers item=peer}

	    {assign var='MTname' value=$peer.id}
	    {if $peer.canContainChildren}
	      {assign var='MTtitle' value="album: `$peer.title`"}
	    {else}
	      {assign var='MTtitle' value=$peer.title}
	    {/if}
            {assign var='MTwidth' value=$peer.thumbnail.width|default:$theme.params.sizeMT}
	    {assign var='MTheight' value=$peer.thumbnail.height|default:$theme.params.sizeMT}
	    {if !empty($theme.params.MTmore)}
	      {if empty($theme.params.MTends)}
	        {if ($peer.peerIndex - $lastIndex) != 1}
	          {assign var='first' value=1 }
	        {/if}
	        {if ($peer.id != $theme.navigator.last.item.id) && ($peer.peerIndex != $data.thisPeerIndex)}
	          {assign var='last' value=1 }
	        {else}
	          {assign var='last' value=0 }
	        {/if}
	      {else}
	        {if ($peer.peerIndex - $lastIndex > 1)}
	          {if ($lastIndex==1) && ($peer.id != $theme.navigator.first.item.id) 
			&& ($peer.peerIndex != $data.thisPeerIndex)}
 	            {assign var='first' value=1 }
          	  {else}
             	    {assign var='last' value=1}
	          {/if}
	        {/if}
	      {/if}
	    {/if}
				  {capture assign=linkUrl}{strip}
				      {if $theme.params.dynamicLinks == 'jump'}
				      	{g->url arg1="view=core.ShowItem" arg2="itemId=`$peer.id`"}
				      {else}
				      	{g->url params=$theme.pageUrl arg1="itemId=`$peer.id`"}
				      {/if}
				  {/strip}{/capture}
		{strip}
{if $Index == 0}
	      <tr>
{/if}

	        <td style="text-align:center; padding:{$theme.params.MTpadding/2}px;">
	  	  {if ($peer.peerIndex == $data.thisPeerIndex)}
	            {if isset($peer.thumbnail)}
	              {g->image item=$peer image=$peer.thumbnail name="active" 
				maxSize=$theme.params.sizeMT alt="$MTtitle" 
				longdesc="$MTtitle" class="thumbSmallSelected" 
				style="text-align:center" title="$MTtitle"}
	            {else}
		      <table class="gcBackground2 gcBorder1"  align="center" width="{$theme.params.sizeMT-4}px">
			<tr>
			  <td height="{$theme.params.sizeMT-4}px">
		      	    <span class="MTtextThumb">{g->text text="no thumb"}</span>
			  </td>
			</tr>
		      </table>
       	 	    {/if}
          	  {else}
	            {if isset($peer.thumbnail)}
	              <a id="MThover{$MTname}" href="{$linkUrl}" title="{$MTtitle}" class="MTclass">
			{g->image item=$peer image=$peer.thumbnail name="pic$MTname" 
				maxSize=$theme.params.sizeMT alt="$MTtitle" 
				longdesc="$MTtitle" class="thumbSmall" 
				style="text-align:center" title="$MTtitle"}
		      </a>
	            {else}
		      <table class="gcBackground1 gcBorder1" align="center" width="{$theme.params.sizeMT-4}px" >
			<tr>
			  <td height="{$theme.params.sizeMT-4}px">
		      	    <a href="{$linkUrl}" class="giMissingThumbnail" title="{$MTtitle}">
			      {g->text text="no thumb"}
		      	    </a>
			  </td>
			</tr>
		      </table>
	            {/if}
        	  {/if}
		</td>
		{/strip}
      	  {assign var='Index' value=$Index+1}
	  {assign var='lastIndex' value=$peer.peerIndex}
	  {if ($theme.params.MTposition != 'bottomF1R') && ($theme.params.MTposition != 'bottom1R') && ($Index == $theme.params.columnsMT)}
	      </tr>

	      {assign var='Index' value=0}
	  {/if}
	  {/foreach}
	{/if}
{*
		<td></td> added for guest thumbs on right }

	      </tr>
*}

	  {if (($theme.params.MTposition == 'bottomF1R') || ($theme.params.MTposition == 'bottom1R'))}
	      </tr>
	  {/if}
	    </table>

	  </td>



	{if !empty($theme.params.MTmargin)}
	  <td></td>
	</tr>
	<tr>
	  <td></td><td></td><td><table style="width:{$theme.params.MTmargin}px; height:{$theme.params.MTmargin}px;"><tr><td></td></tr></table></td>
	</tr>
	{else}
	</tr>
	{/if}

      </table>

    </td>
  </tr>
  <tr>
    <td>




{*************** microthumbs navigator *****************}

{assign var="totalPeer" value=$block.core.LoadPeers.peerCount}
{assign var="lastPeer" value=$peer.peerIndex}
{assign var="firstPeer" value=$peer.peerIndex-$theme.params.peerWindowSize+1}
{assign var="totalTPages" value=$totalPeer/$theme.params.peerWindowSize}
{assign var="actualTPage" value=$peer.peerIndex/$theme.params.peerWindowSize}

{if $firstPeer < 1}{assign var="firstPeer" value=1}{/if}
{if $totalTPages > $totalTPages|string_format:"%d"}{assign var="totalTPages" value=$totalTPages+1}{/if}
{if ($peer.peerIndex+1 != $totalPeer) && ($actualTPage > $actualTPage|string_format:"%d")}
  {assign var="actualTPage" value=$actualTPage+1}
{/if}

{g->callback type="core.LoadPeers" item=$item|default:$theme.item windowSize=9999|default:null}
{assign var="data" value=$block.core.LoadPeers}
{assign var="prevpage" value=1}

<table width="100%" style="padding:0; margin:0;" border="0">
  <tr>
    <td style="text-align:left; width:44px; vertical-align:top;" nowrap="nowrap">
      <table border="0" align="left" class="tableacpic" style="text-align:left; padding:0; margin:0; width:100%">
	<tr>
	  <td nowrap="nowrap" style="text-align:left;">
	    {strip}
	    {if isset($theme.navigator.first) && (($theme.params.MTnavigator=="FPpPL")||($theme.params.MTnavigator=="FIpIL")||($theme.params.MTnavigator=="FpL")||($theme.params.MTnavigator=="FPPL")||($theme.params.MTnavigator=="FIIL"))}
	      <a href="{g->url params=$theme.navigator.first.urlParams}" title="{g->text text='First Image'}" class="icon tLink-first" style="padding-bottom: 2px; padding-top: 2px;">
		<img src="{$imageURL_base}blank.gif" alt="{g->text text='First Image'}" title="{g->text text='First Image'}"/>
	      </a>
	    {/if}

	    {foreach from=$data.peers item=peer}
	      {capture assign=linkUrl}{strip}
	        {if $theme.params.dynamicLinks == 'jump'}
	          {g->url arg1="view=core.ShowItem" arg2="itemId=`$peer.id`"}
	        {else}
	          {g->url params=$theme.pageUrl arg1="itemId=`$peer.id`"}
	        {/if}
	      {/strip}{/capture}

	      {assign var="page" value=$peer.peerIndex/$theme.params.peerWindowSize}
	      {if $page > $page|string_format:"%d"}{assign var="page" value=$page+1}{/if}

	      {if $peer.peerIndex == 1}
	        {assign var="prevpageUrl" value=$linkUrl}
	      {else}
	        {if $data.thisPeerIndex == ($peer.peerIndex+$theme.params.peerWindowSize)}
	          {assign var="prevpageUrl" value=$linkUrl}
	        {/if}
	      {/if}
	    {/foreach}

            {if isset($theme.navigator.back) && (($theme.params.MTnavigator=="FIpIL")||($theme.params.MTnavigator=="IpI")||($theme.params.MTnavigator=="FIIL")||($theme.params.MTnavigator=="II"))}
              <a href="{g->url params=$theme.navigator.back.urlParams}" title="{g->text text='Previous Image'}" class="icon tLink-back" style="padding-bottom: 2px; padding-top: 2px;">
		<img src="{$imageURL_base}blank.gif" alt="{g->text text='Previous Image'}" title="{g->text text='Previous Image'}"/>
	      </a>
            {/if}

	    {if (!empty($prevpageUrl) && ($actualTPage|string_format:"%d" > 1)) && (($theme.params.MTnavigator=="FPpPL")||($theme.params.MTnavigator=="PpP")||($theme.params.MTnavigator=="FPPL")||($theme.params.MTnavigator=="PP"))}
	      <a href="{$prevpageUrl}" title="{g->text text='Previous Page'}" class="icon tLink-back" style="padding-bottom: 2px; padding-top: 2px;">
		<img src="{$imageURL_base}blank.gif" alt="{g->text text='Previous Page'}" title="{g->text text='Previous Page'}"/>
	      </a>
	    {/if}
	    {/strip}
	  </td>
	</tr>
      </table>
    </td>
    <td nowrap="nowrap" align="center">
      {if ($totalTPages|string_format:"%d" >1) && (($theme.params.MTnavigator=="p")||($theme.params.MTnavigator=="FPpPL")||($theme.params.MTnavigator=="FIpIL")||($theme.params.MTnavigator=="FpL")||($theme.params.MTnavigator=="PpP")||($theme.params.MTnavigator=="IpI"))}
      <table border="0" align="center" style="text-align:center; width: 95%; padding:0; margin:0;">
	<tr>
	  <td>
	    {if !empty ($theme.params.MTpageinfo)}
		<span class="MTtextPage">{g->text text='page'}</span><span class="MTtextB"> {$actualTPage|string_format:"%d"}</span> <span class="MTtextPage">{g->text text='of'}</span><span class="MTtextB"> {$totalTPages|string_format:"%d"}</span>

	    {else}
	    {foreach from=$data.peers item=peer}
	      {capture assign=linkUrl}{strip}
		{if $theme.params.dynamicLinks == 'jump'}
	          {g->url arg1="view=core.ShowItem" arg2="itemId=`$peer.id`"}
	        {else}
	          {g->url params=$theme.pageUrl arg1="itemId=`$peer.id`"}
	        {/if}
	      {/strip}{/capture}

	      {assign var="page" value=$peer.peerIndex/$theme.params.peerWindowSize}
	      {if $page > $page|string_format:"%d"}{assign var="page" value=$page+1}{/if}

	      {if $totalTPages|string_format:"%d" >1}
	        {if ($peer.peerIndex == 1)}
	          {if ($actualTPage|string_format:"%d" == $page|string_format:"%d")}
	            <span class="MTindexThis">{$page|string_format:"%d"}</span>
	          {else}
	            <a href="{$linkUrl}" 
				title="{g->text text='showing'} {$firstPeer} {g->text text='to'} {$lastPeer} 
				{g->text text='of the total'} 
				{$totalPeer} {g->text text='thumbnails'}">{$page|string_format:"%d"}</a>
	          {/if}
	        {else}
	          {if ($peer.peerIndex > $theme.params.peerWindowSize)}
	            {if $page|string_format:"%d" != $prevpage}
	              {if $actualTPage|string_format:"%d" == $page|string_format:"%d"}
	  	        <span class="MTindexThis">{$page|string_format:"%d"}</span>
	  		  {assign var="nextpage" value=$peer.peerIndex}
		      {else}
	                <a href="{$linkUrl}" 
				title="{g->text text='showing'} {$firstPeer} {g->text text='to'} {$lastPeer} 
				{g->text text='of the total'} 
				{$totalPeer} {g->text text='thumbnails'}">{$page|string_format:"%d"}</a>
			{assign var="next" value=$peer.peerIndex}
	              {/if}
	            {/if}
	 	    {assign var="prevpage" value=$page|string_format:"%d"}
	          {/if}
		{/if}
	      {/if}
	    {/foreach}
	    {/if}
	  </td>
	</tr>
      </table>
      {/if}
    </td>
    <td style="text-align:right; width:44px; vertical-align:top;" nowrap="nowrap">
      <table border="0" align="right" class="tableacpic" style="text-align:right; padding:0; margin:0">
	<tr>
	  <td nowrap="nowrap" style="text-align:right">
	    {foreach from=$data.peers item=peer}
	      {capture assign=linkUrl}{strip}
	        {if $theme.params.dynamicLinks == 'jump'}
	          {g->url arg1="view=core.ShowItem" arg2="itemId=`$peer.id`"}
	        {else}
	          {g->url params=$theme.pageUrl arg1="itemId=`$peer.id`"}
	        {/if}
	      {/strip}{/capture}
	      {if (($peer.peerIndex == $theme.params.peerWindowSize+1))}
	        {assign var="nextpageUrl" value=$linkUrl}
	      {else}
	        {if (($peer.peerIndex > $theme.params.peerWindowSize) && ($peer.peerIndex == ($theme.params.peerWindowSize+$nextpage)) && ($theme.params.peerWindowSize <= $peer.peerIndex))}
	          {assign var="nextpageUrl" value=$linkUrl}
	        {/if}
	      {/if}
	    {/foreach}
	    {strip}
	    {if (!empty($nextpageUrl) && ($actualTPage|string_format:"%d" != $totalTPages|string_format:"%d")) && (($theme.params.MTnavigator=="FPpPL")||($theme.params.MTnavigator=="PpP")||($theme.params.MTnavigator=="FPPL")||($theme.params.MTnavigator=="PP"))}
	      <a href="{$nextpageUrl}" title="{g->text text='Next Page'}" class="icon tLink-next" style="padding-bottom: 2px; padding-top: 2px;">
		<img src="{$imageURL_base}blank.gif" alt="{g->text text='Next Page'}" title="{g->text text='Next Page'}"/>
	      </a>
	    {/if}
            {if isset($theme.navigator.next) && (($theme.params.MTnavigator=="FIpIL")||($theme.params.MTnavigator=="IpI")||($theme.params.MTnavigator=="FIIL")||($theme.params.MTnavigator=="II"))}
              <a href="{g->url params=$theme.navigator.next.urlParams}" title="{g->text text='Next Image'}" class="icon tLink-next" style="padding-bottom: 2px; padding-top: 2px;">
		<img src="{$imageURL_base}blank.gif" alt="{g->text text='Next Image'}" title="{g->text text='Next Image'}"/>
	      </a>
            {/if}
	    {if isset($theme.navigator.last) && (($theme.params.MTnavigator=="FPpPL")||($theme.params.MTnavigator=="FIpIL")||($theme.params.MTnavigator=="FpL")||($theme.params.MTnavigator=="FPPL")||($theme.params.MTnavigator=="FIIL"))}
	      <a href="{g->url params=$theme.navigator.last.urlParams}" title="{g->text text='Last Image'}" class="icon tLink-last" style="padding-bottom: 2px; padding-top: 2px;">
		<img src="{$imageURL_base}blank.gif" alt="{g->text text='Last Image'}" title="{g->text text='Last Image'}"/>
	      </a>
	    {/if}
	    {/strip}
	  </td>
	</tr>
      </table>
    </td>
  </tr>
</table>



{if !empty ($theme.params.MTinfo)}
<div id="MTinfo">
<p class="MTtextThumb">
({g->text text='visible'}<span class="MTtextB"> {$firstPeer}</span> {g->text text='to'}<span class="MTtextB"> {$lastPeer}</span> {g->text text='of the total'} {$totalPeer} {g->text text='thumbnails'})
</p>
</div>
{/if}
