{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
{if (($theme.params.PAddCart == "photoNav") || ($theme.params.PViewCart == "photoNav")) || empty ($callTopNav)}
  <table border="0" width="100%" align="center" style="padding:0; margin:0;">
    <tr>
      <td style="width:200px; text-align:left; " nowrap="nowrap">
      {if ($theme.params.NavPhoto != "none") && empty ($callTopNav)}
        <table border="0" class="tableacpic" align="left">
          <tr>
            <td nowrap="nowrap">
	    {strip}
              {if isset($theme.navigator.first)}
                <a href="{g->url params=$theme.navigator.first.urlParams}" title="{g->text text='First'}" class="icon tLink-first" style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='First'}" title="{g->text text='First'}"/>
		</a>
              {/if}
              {if isset($theme.navigator.back)}
                <a href="{g->url params=$theme.navigator.back.urlParams}" title="{g->text text='Previous'}" class="icon tLink-back" style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Previous'}" title="{g->text text='Previous'}"/>
		</a>
              {/if}
	    {/strip}
            </td>
          </tr>
        </table>
      {/if}
      </td>
      <td style="text-align:center;" nowrap="nowrap">
        <table border="0" align="center" class="tableacpic" style="width: 100%;">
          <tr>
            <td nowrap="nowrap" style="text-align:center;">
{/if}

	    {if (($theme.params.PActionsPos == "topNav") && !empty ($callTopNav)) || (($theme.params.PActionsPos == "photoNav") && empty ($callTopNav))}
	      {if ($theme.params.NavPop != "none") && !empty($theme.sourceImage.width)}
    		{if ($imagewidth != $theme.item.width) || ($theme.params.NavPop =="even")}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;\" title=\"{g->text text='Full Image Popup'}\" class=\"icon tLink-image_popup\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Full Image Popup'}\" title=\"{g->text text='Full Image Popup'}\"\/><\/a>"{literal};
		  function ViewPopup(){document.write(img);}
		  ViewPopup();
		  //-->
		  //]]>
		  </script>{/literal}
		{/if}
	      {/if}
	      {* Load up the Comments data *}
	      {assign var=item value=$theme.item}
	      {g->callback type="comment.LoadComments" itemId=$item.id show=5}
	      {if isset ($theme.permissions.comment_add) && !empty($comments) && ($theme.params.PAddComment != 'none') && (empty ($theme.params.PStaticComments) || empty($block.comment.LoadComments.comments))}
		{if ($theme.params.PAddComment == 'floating')}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('addcomment');{if $position =='bottom'}{if empty($theme.panoramaItem)}setLyr(this,'addcomment',-580,-320){else}setLyr(this,'addcomment',-350,-320){/if}{else}setLyr(this,'addcomment',30,-320){/if}\" title=\"{g->text text='Add a Comment'}\" class=\"icon tLink-add_comment\"style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add a Comment'}\" title=\"{g->text text='Add a Comment'}\"\/><\/a>"{literal};
		  function Viewaddcom(){document.write(img);}
		  Viewaddcom();
		  //-->
		  //]]>
		  </script>{/literal}
		  <noscript>
		    <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment" style="padding-bottom: 2px; padding-top: 2px;">
		      <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
		    </a>
		  </noscript>
	    	{else}
	 	  <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment" style="padding-bottom: 2px; padding-top: 2px;">
		    <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
		  </a>
		{/if}
	      {/if}
	      {if isset ($theme.permissions.comment_view) && !empty($comments) && ($theme.params.PComments) && empty ($theme.params.PStaticComments)}
		{if !empty($block.comment.LoadComments.comments)}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"{if isset ($theme.permissions.comment_add) && !empty($comments) && ($theme.params.PAddComment) && empty ($theme.params.PStaticComments)}{/if}<a href=\"javascript:void(0)\" onclick=\"toggleLyr('comments');{if $position =='bottom'}{if empty($theme.panoramaItem)}setLyr(this,'comments',-300,-320){else}setLyr(this,'comments',-50,-320){/if}{else}setLyr(this,'comments',30,-320){/if}\" title=\"{g->text text='View Comments'}\" class=\"icon tLink-view_comment\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Show Comments'}\"  title=\"{g->text text='Show Comments'}\"\/><\/a>"{literal};
		  function Viewcom(){document.write(img);}
		  Viewcom();
		  //-->
		  //]]>
		  </script>{/literal}
		{/if}
	      {/if}
	      {if !empty($exif) && ($theme.params.PExif)}
	        {assign var=item value=$theme.item}
		{* Load up the EXIF data *}
		{g->callback type="exif.LoadExifInfo" itemId=$item.id}
		{if !empty($block.exif.LoadExifInfo.exifData)}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('exif');{if $position =='bottom'}{if empty($theme.panoramaItem)}setLyr(this,'exif',-300,-320){else}setLyr(this,'exif',-50,-320){/if}{else}setLyr(this,'exif',30,-320){/if}\" title=\"{g->text text='View EXIF'}\" class=\"icon tLink-exif_parser\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Show EXIF'}\" title=\"{g->text text='Show EXIF'}\"\/><\/a>"{literal};
		  function Viewexif(){document.write(img);}
		  Viewexif();
		  //-->
		  //]]>
		  </script>{/literal}
		{/if}
	      {/if}
 	      {* ecard *}
	      {if ($theme.params.PeCard) && !empty($theme.ecard) && isset ($theme.permissions.ecard_send)}
		<a href="{g->url arg1="view=ecard.SendEcard" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Send as eCard'}" class="icon tLink-ecard" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Send as eCard'}" alt="{g->text text='Send as eCard'}"/></a>
	      {/if}
	      {* ecard end *}

	      {if ($theme.params.photoBlocks) && ($theme.params.PBlocksBtn)}
	        {foreach from=$theme.params.photoBlocks item=block}
		  {g->callback type="comment.LoadComments" itemId=$item.id show=5}
		  {g->callback type="exif.LoadExifInfo" itemId=$item.id}
		  {g->callback type="rating.LoadRating" itemId=$item.id}
		  {if !empty($block.0)}
		    {if ($block.0 == "rating.Rating")}
		      {if ($theme.params.PRating == 'none')}
		        {assign var="showblockR" value="1"}
		      {else}
		        {assign var="showblockR" value="0"}
		      {/if}
		    {else}
		      {assign var="showblockR" value="0"}
		    {/if}
		    {if ($block.0 == "comment.ViewComments")}
		      {if empty($theme.params.PComments)}
		        {assign var="showblockVC" value="1"}
		      {else}
		        {assign var="showblockVC" value="0"}
		      {/if}
		    {else}
		      {assign var="showblockVC" value="0"}
		    {/if}
		    {if ($block.0 == "comment.AddComment")}
		      {if ($theme.params.PAddComment == 'none')}
		        {assign var="showblockAC" value="1"}
		      {else}
		        {assign var="showblockAC" value="0"}
		      {/if}
		    {else}
		      {assign var="showblockAC" value="0"}
		    {/if}
		    {if ($block.0 == "exif.ExifInfo")}
		      {if empty($theme.params.PExif)}
		        {assign var="showblockE" value="1"}
		      {else}
		        {assign var="showblockE" value="0"}
		      {/if}
		    {else}
		      {assign var="showblockE" value="0"}
		    {/if}
		    {if (($block.0 != "rating.Rating") || ($theme.params.PRating == 'none')) && (($block.0 != "comment.ViewComments") || empty($theme.params.PComments)) && (($block.0 != "comment.AddComment") || ($theme.params.PAddComment == 'none')) && (($block.0 != "exif.ExifInfo") || empty($theme.params.PExif))}
		      {assign var="showblock0" value="1"}
		    {/if}
		  {/if}
	        {/foreach}
		{if !empty($showblock0) || (!empty($showblock0) && (!empty($showblockR) || !empty($showblockVC) || !empty($showblocAC) || !empty($showblockE)))} 
		  {assign var="showblockpic" value="1"}
		{/if}
		{if !empty($showblockpic)}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('blocks');{if $position =='bottom'}{if empty($theme.panoramaItem)}setLyr(this,'blocks',-300,-320){else}setLyr(this,'blocks',-30,-320){/if}{else}setLyr(this,'blocks',50,-320){/if}\" title=\"{g->text text='More Information'}\" class=\"icon tLink-image_block\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\{g->text text='More Information'}\" title=\"{g->text text='More Information'}\"\/><\/a>"{literal};
		  function Viewblocks(){document.write(img);}
		  Viewblocks();
		  //-->
		  //]]>
		  </script>{/literal}
		{/if}
	      {/if}
	    {/if}
	    {if (($theme.params.PAddCart == "photoNav") && empty ($callTopNav)) || (($theme.params.PAddCart == "topNav") && !empty ($callTopNav))}
  	      {if (($theme.zencart =='1') &&  isset ($theme.permissions.zencart_add)) || ($theme.cart =='1') || (($theme.cart =='2' || $theme.cart =='3') &&  isset ($theme.permissions.checkout_purchase))}

	        {if ($theme.cart =="1") || ($theme.cart =="3" && $theme.params.CartSelect =="cart")}
		  <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/></a>
	        {/if}
	        {if ($theme.cart =="2") || ($theme.cart =="3" && $theme.params.CartSelect =="checkout")}
		  <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/></a>
		{/if}

		{if ($theme.cart =='3') && ($theme.params.CartSelect =="both")}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href='javascript:void(0)' onclick=\"toggleLyr('cartAdd');setLyr(this,'cartAdd',30,-80)\" title=\"{g->text text='Add Item to Cart'}\" class=\"icon tLink-add_cart\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add Item to Cart'}\" title=\"{g->text text='Add Item to Cart'}\" \/><\/a>"{literal};
		  function Addcart(){document.write(img);}
		  Addcart();
		  //-->
		  //]]>
		  </script>{/literal}
	  	  <noscript>
		    {if $theme.zipcart || $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}
		      <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{if $theme.zipcart}{g->text text='Download in Zip'}{if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}{$separator}{g->text text='Print a copy'}{/if}{else}{g->text text='Print a copy'}{/if}">
		        {if $theme.zipcart}{g->text text='Zip'}{else}{g->text text='Print'}{/if}
		      </a>
		    {/if}
		    <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/></a>
		  </noscript>
                  <div id="cartAdd" style="position: absolute; left:0px; top:0px; width:200px; text-align:left; z-index: 30; visibility: hidden;" onmousedown="dragStart(event, 'cartAdd')" class="BlockOpacity">
                    <table width="200px" class="gcBackground2 gcBorder2">
		      <tr>
			<td class="gcBorder1 gcBackground1" style="text-align:right">
			  <div onmousedown="dragStart(event, 'cartAdd')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			    <a onmouseover="hideLyr('cartAdd')" title="{g->text text='Close'}" class="icon tLink-close"><img src='{$imageURL_base}blank.gif' alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
			  </div>
			</td>
		      </tr>
                      <tr>
                        <td style="align:center">
                        {if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}
                          <table style="text-align:left; width:160px;">
                            <tr>
                              <td style="width:75px;">
                                {g->text text='Print with'}
                              </td>
                              <td>
                                <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" >
                                  {if $theme.print}{$theme.print}<br/>{/if}
                                  {if $theme.print1}{$theme.print1}<br/>{/if}
                                  {if $theme.print2}{$theme.print2}<br/>{/if}
                                  {if $theme.print3}{$theme.print3}<br/>{/if}
                                  {if $theme.print4}{$theme.print4}<br/>{/if}
                                  {if $theme.print5}{$theme.print5}{/if}
                                </a>
                              </td>
                            </tr>
                          </table>
                        {/if}
                        {if $theme.zipcart}
                          {if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}
                        </td>
		      </tr>
		      <tr class="gcBorder1"> 
                        <td style="align:center">
                          {/if}
                          <table  style="text-align:left; width:160px;">
                            <tr>
                              <td style="width:75px;">
                                {g->text text='Download in'}
                              </td>
                              <td>
                                <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" >
                                  {g->text text='Zip'}
                                </a>
                              </td>
                            </tr>
                          </table>
                        {/if}
                        {if $theme.zipcart || $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}
                        </td>
		      </tr>
		      <tr class="gcBorder1"> 
                        <td style="align:center">
                        {/if}
                          <table  style="text-align:left; width:160px;">
                            <tr>
                              <td>
                                <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" >
                                  {g->text text='Purchase Item'}
                                </a>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
		{/if}


		{if ($theme.zencart == '1')}
   	          <a href="{g->url arg1="controller=zencart.PurchaseOptions" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Item to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Item to Cart'}" alt="{g->text text='Add Item to Cart'}"/></a>
		{/if}
	      {/if}
	    {/if} {* add cart end *}

	    {if (($theme.params.PViewCart == "photoNav") && empty ($callTopNav)) || (($theme.params.PViewCart == "topNav") && !empty ($callTopNav))}
	      {if (($theme.zencart =='1') &&  isset ($theme.permissions.zencart_view)) || ($theme.cart =='1') || (($theme.cart =='2' || $theme.cart =='3') &&  isset ($theme.permissions.checkout_purchase))}
	        {if $theme.cart =='1' || $theme.cart =='3'}{g->callback type="cart.LoadCart"}{/if}
	        {if $theme.cart =='2' || $theme.cart =='3'}{g->callback type="checkout.countCheckoutItems"}{/if}
	        {if ($theme.cart =="1") || ($theme.cart =="3" && ($theme.params.CartSelect =="cart" || ($theme.params.CartSelect =="both" && $block.checkout.ShowCart.total == 0)))}
	          {if $block.cart.ShowCart.total != 0}
	 	    <a href="{g->url arg1="view=cart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}{g->text text='View Cart'}" alt="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}{g->text text='View Cart'}"/></a>
	          {/if}
	        {/if}
	        {if ($theme.cart =="2") || ($theme.cart =="3" && ($theme.params.CartSelect =="checkout" || ($theme.params.CartSelect =="both" && $block.cart.ShowCart.total == 0)))}
	          {if $block.checkout.ShowCart.total != 0}
	 	    <a href="{g->url arg1="view=checkout.SelectProducts" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" alt="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}"/></a>
	          {/if}
	        {/if}
	        {if ($theme.cart =='3') && ($theme.params.CartSelect =="both")}
	          {if $block.cart.ShowCart.total != 0 && $block.checkout.ShowCart.total != 0}
	 	    {literal}<script type="text/JavaScript">
		    //<![CDATA[
		    <!--
		    img = {/literal}"<a href='javascript:void(0)' onclick=\"toggleLyr('cart');setLyr(this,'cart',30,-120)\" title=\"{g->text text='View Cart'}\" class=\"icon tLink-view_cart\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='View Cart'}\" title=\"{g->text text='View Cart'}\"\/><\/a>"{literal}; 
		    function Viewcart(){document.write(img);}
		    Viewcart();
	 	    //-->
		    //]]>
		    </script>{/literal}
		    <noscript>
		      {if $theme.zipcart || $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}
		        <a href="{g->url arg1="controller=cart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{if $theme.zipcart}{g->text text='Items to Download in Zip'}{if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4 || $theme.print5}{$separator}{g->text text='Items to Print'}{/if}{else}{g->text text='Print a copy'}{/if}">
		          {if $theme.zipcart}{g->text text='Zip'}{else}{g->text text='Print'}{/if}
		        </a>
		      {/if}
		      <a href="{g->url arg1="view=checkout.SelectProducts" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart) - " many="(%d items in your cart) - " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text one="(%d item in your cart) - " many="(%d items in your cart) - " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" alt="{g->text one="(%d item in your cart) - " many="(%d items in your cart) - " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}"/></a>
		    </noscript>

	            <div id="cart" style="position: absolute; left:0px; top: 0px; width:230px; text-align:left; z-index: 20; visibility: hidden;" onmousedown="dragStart(event, 'cart')" class="BlockOpacity">
	              <table width="230px" class="gcBackground2 gcBorder2">
		        <tr>
		          <td class="gcBorder1 gcBackground1" style="text-align:right">
		            <div onmousedown="dragStart(event, 'cart')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
		     	      <a onmouseover="hideLyr('cart')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" title="{g->text text='Close'}" alt="{g->text text='Close'}"/></a>
			    </div>
		          </td>
		        </tr>
	                <tr>
          	          <td class="gcBorder1">
                  	  {if ($block.cart.ShowCart.total != 0) && ($theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4) || $theme.print5}
                    	    <a href="{g->url arg1="view=cart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}">{g->text text='View Photos to Print '}{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}</a>
                  	  {/if}
                  	  {if $block.checkout.ShowCart.total != 0}
                    	    {if ($block.cart.ShowCart.total != 0) && ($theme.print || $theme.print1 || $theme.print2) || $theme.print3 || $theme.print4 || $theme.print5}
                  	  </td>
			  <td>
			  </td>
	                </tr>
          	        <tr>
                	  <td class="gcBorder1">
                    	    {/if}
                    	    <a href="{g->url arg1="view=checkout.SelectProducts" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}">{g->text text='Shopping '}{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}</a>
                  	  {/if}
                  	  </td>
              	        </tr>
            	      </table>
	            </div>
	          {/if}
	        {/if}

		{if ($theme.zencart == '1')}
   	          <a href="{g->url arg1="controller=zencart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='View Cart'}" alt="{g->text text='View Cart'}"/></a>
		{/if}

	      {/if}
	    {/if} {* view cart end *}

	    {if ($theme.params.PActionsPos == "photoNav") && empty ($callTopNav)}
              {g->block type="core.ItemLinks" item=$child links=$child.itemLinks}
            {/if}
	    {if (($theme.params.PAddCart == "photoNav") || ($theme.params.PViewCart == "photoNav")) || empty ($callTopNav)}
            </td>
          </tr>
        </table>
      </td>
      <td style="text-align:right; width: 200px;" nowrap="nowrap">
      {if ($theme.params.NavPhoto != "none") && empty ($callTopNav)}
        <table border="0" class="tableacpic" align="right">
      	  <tr>
            <td nowrap="nowrap" style="text-align:right">
	    {strip}
              {if isset($theme.navigator.next)}
                <a href="{g->url params=$theme.navigator.next.urlParams}" title="{g->text text='Next'}" class="icon tLink-next" style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Next'}" title="{g->text text='Next'}"/>
		</a>
              {/if}
              {if isset($theme.navigator.last)}
                <a href="{g->url params=$theme.navigator.last.urlParams}" title="{g->text text='Last'}" class="icon tLink-last" style="padding-bottom: 2px; padding-top: 2px; ">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Last'}" title="{g->text text='Last'}"/>
		</a>
              {/if}
	    {/strip}
	    </td>
	  </tr>
	</table>
     {/if}
      </td>
    </tr>
  </table>
	    {/if}
