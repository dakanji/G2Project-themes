{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
{assign var='iconTwidth' value='55'}

<table align={if $theme.params.topNavPics == 'left'}"left"{else}"right"{/if} style="height:25px;">
  <tr>
    {if $theme.params.topNavPics == 'left' && !empty($theme.parents)}
    <td style="text-align:right; width: {$iconTwidth}px;" valign="top">
      <table class="tableacpic" style="text-align:left; width: {$iconTwidth}px;">
        <tr>
          <td style="text-align:left; white-space: nowrap">
            {section name=parent loop=$theme.parents}
            {if !$smarty.section.parent.last}
              {if $smarty.section.parent.first}
 	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.parents[parent.index_next].id`"}" title="{$theme.parents[parent].title}" class="icon tLink-gallery" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
              {else}
	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.parents[parent.index_next].id`"}" title="{$theme.parents[parent].title}" class="icon tLink-album" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
              {/if}
            {else}
              {if !$smarty.section.parent.first}
                {if ($theme.params.enterAlbumDirect == 'none' || (($theme.params.enterAlbumDirect == 'thumbs' || $theme.params.enterAlbumDirect == 'thumbsNoAlbum') && $theme.params.enterAlbumTopNav))}
 	          <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.item.id`"}" title="{$theme.parents[parent].title}" class="icon tLink-thumbnails" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
                {/if}
              {else}
	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.item.id`"}" title="{$theme.parents[parent].title}" class="icon tLink-gallery" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
              {/if}
              {if ($theme.params.Showslideshow && $theme.slideshow)}
		{literal}
		<script type="text/JavaScript">
		//<![CDATA[
		<!--
		sslink = {/literal}"<a href=\"{g->url arg1="view=slideshow.Slideshow" arg2="itemId=`$theme.item.id`"}\" title=\"{g->text text='SlideShow'}\" class=\"icon tLink-view_slideshow\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src=\"{$imageURL_base}blank.gif\" alt=\"{g->text text='SlideShow'}\"  title=\"{g->text text='SlideShow'}\"/><\/a>"{literal}; 
		function Viewsslink(){document.write(sslink);}
		Viewsslink();
		//-->
		//]]>
		</script>
		{/literal}
	      {/if}
            {/if}
            {/section}
          </td>
        </tr>
      </table>
    </td>
    {/if}

    <td valign="bottom">
      <table align="{if $theme.params.topNavPics == 'right'}right{else}left{/if}" class="tableacpic">
        <tr>
	  {if $theme.params.topNavPics == 'left'}
          <td style="width:20px">
          </td>
	  <td>
          {else}
          <td style="white-space: nowrap">
	  {/if}

          {* if item is a Photo *}
  	  {if !empty($photoItem)} 
    	    {if ($theme.params.PActionsPos == 'topNav') || ($theme.params.PViewCart == 'topNav') || ($theme.params.PAddCart == 'topNav')}
    	      {assign var='callTopNav' value='1'}
              {g->theme include='navigatorPhoto.tpl'}
    	    {/if}

          {* if item is an Album *}
	  {else} 
   	    {if (($theme.zencart =='1') &&  (isset ($theme.permissions.zencart_add)|| isset ($theme.permissions.zencart_view))) || ($theme.cart =='1') || (($theme.cart =='2' || $theme.cart =='3') && isset ($theme.permissions.checkout_purchase))}
	      {if (empty($theme.parents) && !empty($theme.params.GAddCart)) || (!empty($theme.parents) && !empty($theme.params.AAddCart))}

        	{if ($theme.cart == '1') || ($theme.cart == '3' && $theme.params.CartSelect == 'cart')}
              	  <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Album to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Album to Cart'}" alt="{g->text text='Add Album to Cart'}"/></a>
        	{/if}
        	{if ($theme.cart == '2') || ($theme.cart == '3' && $theme.params.CartSelect == 'checkout')}
              	  <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Album to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Album to Cart'}" alt="{g->text text='Add Album to Cart'}"/></a>
      		{/if}

		{if ($theme.cart == '3') && ($theme.params.CartSelect == 'both')}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href='javascript:void(0)' onclick=\"toggleLyr('cartAdd{$theme.item.id}');setLyr(this,'cartAdd{$theme.item.id}',5,-80)\" title=\"{g->text text='Add Album to Cart'}\" class=\"icon tLink-add_cart\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Add Album to Cart'}\" alt=\"{g->text text='Add Album to Cart'}\"\/><\/a>"{literal};
  		  function AddcartN(){document.write(img);}
		  AddcartN();
		  //-->
		  //]]>
		  </script>{/literal}
		  <noscript>
 		  {if !empty($theme.zipcart) || !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4)}
		    <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{if $theme.zipcart}{g->text text='Download in Zip'}{if $theme.print || $theme.print1 || $theme.print2 || $theme.print3 || $theme.print4} || !empty($theme.print5){$separator}{g->text text='Print a copy'}{/if}{else}{g->text text='Print copies'}{/if}">
		      {if $theme.zipcart}{g->text text='Zip'}{else}{g->text text='Print'}{/if}
		    </a>
		  {/if}
		  <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Album to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;">
		    <img src="{$imageURL_base}blank.gif" title="{g->text text='Add Album to Cart'}" alt="{g->text text='Add Album to Cart'}"/>
		  </a>
    	          </noscript>

                  <div id="cartAdd{$theme.item.id}" style="position:absolute; left: 0px; top: 0px; text-align:left; z-index: 35; visibility: hidden;" class="BlockOpacity">
	            <table style="width:165px" class="gcBackground2 gcBorder2">
		      <tr>
              	        <td class="gcBorder1 gcBackground1">
	     	          <div onmousedown="dragStart(event, 'cartAdd{$theme.item.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
		            <table style="width:100%" class="gcBackground1">
			      <tr>
			        <td style="text-align:left">
    				  <h3>&nbsp;{$theme.item.title|markup}</h3>
		 	        </td>
			        <td style="text-align:right">
                               	  <a onmouseover="hideLyr('cartAdd{$theme.item.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}" title="{g->text text='Close'}"/></a>
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
                                <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" >
                               	  {if !empty($theme.print)}{$theme.print}<br/>{/if}
                       	          {if !empty($theme.print1)}{$theme.print1}<br/>{/if}
                                  {if !empty($theme.print2)}{$theme.print2}<br/>{/if}
                                  {if !empty($theme.print3)}{$theme.print3}<br/>{/if}
                                  {if !empty($theme.print4)}{$theme.print4}<br/>{/if}
                                  {if !empty($theme.print5)}{$theme.print5}{/if}
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
                                <a href="{g->url arg1="controller=cart.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" >
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
                                <a href="{g->url arg1="controller=checkout.AddToCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}">
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

		{if ($theme.zencart == '1') && isset ($theme.permissions.zencart_add)}
   	          <a href="{g->url arg1="controller=zencart.PurchaseOptions" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='Add Album to Cart'}" class="icon tLink-add_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add Album to Cart'}" alt="{g->text text='Add Album to Cart'}"/></a>
		{/if}

          </td>
          <td>

	      {/if} {*/ add cart *}

              {if !empty($theme.params.AViewCart) || !empty($theme.params.GViewCart)}
	        {if $theme.cart == '1' || $theme.cart == '3'}{g->callback type="cart.LoadCart"}{/if}
	        {if $theme.cart == '2' || $theme.cart == '3'}{g->callback type="checkout.countCheckoutItems"}{/if}
	        {if $block.cart.ShowCart.total != 0 && (($theme.cart == '1') || ($theme.cart == '3' && ($theme.params.CartSelect == 'cart' || ($theme.params.CartSelect == 'both' && $block.checkout.ShowCart.total == 0))))}
	          <a href="{g->url arg1="view=cart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item  " many="(%d items " count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}{if !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4)}{if !empty($theme.zipcart)}{g->text text='to print/download'}{else}{g->text text='to print'}{/if}{elseif !empty($theme.zipcart)}{g->text text='to download'}{/if}{g->text text=' in your cart) - View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text one="(%d item " many="(%d items " count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}{if !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4)}{if !empty($theme.zipcart)}{g->text text='to print/download'}{else}{g->text text='to print'}{/if}{elseif !empty($theme.zipcart)}{g->text text='to download'}{/if}{g->text text=' in your cart) - View Cart'}" alt="{g->text one="(%d item " many="(%d items " count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}{if !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4)}{if !empty($theme.zipcart)}{g->text text='to print/download'}{else}{g->text text='to print'}{/if}{elseif !empty($theme.zipcart)}{g->text text='to download'}{/if}{g->text text=' in your cart) - View Cart'}"/></a>
		{/if}


	        {if $block.checkout.ShowCart.total != 0 && (($theme.cart == '2') || ($theme.cart == '3' && ($theme.params.CartSelect == 'checkout' || ($theme.params.CartSelect == 'both' && $block.cart.ShowCart.total == 0))))}
      	          <a href="{g->url arg1="view=checkout.SelectProducts" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" alt="{g->text one="(%d item in your cart) " many="(%d items in your cart) " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}"/></a>
	        {/if}
		{if ($block.cart.ShowCart.total != 0 && $block.checkout.ShowCart.total != 0) && ($theme.cart == '3') && ($theme.params.CartSelect == 'both')}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href='javascript:void(0)' onclick=\"toggleLyr('cart{$theme.item.id}');setLyr(this,'cart{$theme.item.id}',10,-200)\" title=\"{g->text text='View Cart'}\" class=\"icon tLink-view_cart\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='View Cart'}\" alt=\"{g->text text='View Cart'}\"/><\/a>"{literal}; 
		  function ViewcartN(){document.write(img);}
		  ViewcartN();
		  //-->
		  //]]>
		  </script>{/literal}

	          <noscript>
	          {if !empty($theme.zipcart) || !empty($theme.print) || !empty($theme.print1) 
		|| !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}
 	 	    <a href="{g->url arg1="controller=cart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{if $theme.zipcart}{g->text text='Items to Download in Zip'}{if !empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5)}{$separator}{g->text text='Items to Print'}{/if}{else}{g->text text='Print a copy'}{/if}">
		      {if !empty($theme.zipcart)}{g->text text='Zip'}{else}{g->text text='Print'}{/if}
		    </a>
		  {/if}
		  <a href="{g->url arg1="view=checkout.SelectProducts" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart) - " many="(%d items in your cart) - " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text one="(%d item in your cart) - " many="(%d items in your cart) - " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}" alt="{g->text one="(%d item in your cart) - " many="(%d items in your cart) - " count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}{g->text text='View Cart'}"/></a>
		  </noscript>

 	          <div id="cart{$theme.item.id}" style="position: absolute; left:0px; top:0px; width:230px; text-align:left; z-index: 20; visibility: hidden;" onmousedown="dragStart(event, 'cart{$theme.item.id}')" class="BlockOpacity">
	            <table style="width:230px" class="gcBackground2 gcBorder2">
	              <tr>
                        <td class="gcBorder1 gcBackground1" style="text-align:right">
  		          <div onmousedown="dragStart(event, 'cart{$theme.item.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
                            <a onmouseover="hideLyr('cart{$theme.item.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt="{g->text text='Close'}"/></a>
			  </div>
		        </td>
		      </tr>
		      <tr>
	                <td>
           		{if ($block.cart.ShowCart.total != 0) && (!empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5))}
                    	  <a href="{g->url arg1="view=cart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}">{g->text text='Photos to Print '}{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.cart.ShowCart.total arg1=$block.cart.ShowCart.total}</a>
                  	{/if}
                  	{if $block.checkout.ShowCart.total != 0}
	                  {if ($block.cart.ShowCart.total != 0) && (!empty($theme.print) || !empty($theme.print1) || !empty($theme.print2) || !empty($theme.print3) || !empty($theme.print4) || !empty($theme.print5))}
	                </td>

	              </tr>
	              <tr>
	                <td>
	                  {/if}
	                  <a href="{g->url arg1="view=checkout.SelectProducts" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}">{g->text text='Shopping '}{g->text one="(%d item in your cart)" many="(%d items in your cart)" count=$block.checkout.ShowCart.total arg1=$block.checkout.ShowCart.total}</a>
	                {/if}
	                </td>
	              </tr>
          	    </table>
	          </div>
	        {/if}

		{if ($theme.zencart == '1') && isset ($theme.permissions.zencart_view)}
   	          <a href="{g->url arg1="controller=zencart.ViewCart" arg2="itemId=`$theme.item.id`" arg3="return=`$theme.item.id`"}" title="{g->text text='View Cart'}" class="icon tLink-view_cart" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='View Cart'}" alt="{g->text text='View Cart'}"/></a>
		{/if}
          </td>
          <td>
	      {/if} {* view cart end *}
	    {/if}   {* cart end *}

	    {if !empty($comments)}
	      {* Load up the Comments data *}
	      {assign var=item value=$theme.item}
	      {g->callback type="comment.AddComment" itemId=$item.id}
	      {g->callback type="comment.LoadComments" itemId=$item.id show=5}

	      {* comments add *}
	      {if !empty($block.comment.AddComment) && ((empty($theme.parents) && ($theme.params.GAddComment != 'none')) || (!empty($theme.parents) && ($theme.params.AAddComment != 'none'))) && isset ($theme.permissions.comment_add) && ((empty($block.comment.LoadComments.comments)) || (empty($theme.parents) && empty($theme.params.GStaticComments)) || (!empty($theme.parents) && empty($theme.params.AStaticComments)))}
		{if ($theme.params.AAddComment == 'floating') || ($theme.params.GAddComment == 'floating')}
	 	  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('addcomment{$item.id}'); {if $theme.params.topNavPics == "left"}setLyr(this,'addcomment{$item.id}',15,-140){else}setLyr(this,'addcomment{$item.id}',15,-400){/if}\" title=\"{g->text text='Add a Comment'}\" class=\"icon tLink-add_comment\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='Add a Comment'}\" title=\"{g->text text='Add a Comment'}\"/><\/a>"{literal};
		  function Viewaddcom(){document.write(img);}
		  Viewaddcom();
		  //-->
		  //]]>
	    	  </script>{/literal}

	  	  <noscript>
		    <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$item.id`" arg3="return=`$item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment" style="padding-bottom: 2px; padding-top: 2px;">
		      <img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/>
		    </a>
	  	  </noscript>

	  	{else}
		  <a href="{g->url arg1="view=comment:AddComment" arg2="itemId=`$item.id`" arg3="return=`$item.id`"}" title="{g->text text='Add a Comment'}" class="icon tLink-add_comment" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{g->text text='Add a Comment'}" alt="{g->text text='Add a Comment'}"/></a>
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
			        <a onmouseover="hideLyr('addcomment{$item.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt='{g->text text='Close'}'/></a>
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
          </td>
          <td>
	      {/if}











	      {* comments view *}
	      {if isset($theme.permissions.comment_view) && ((empty($theme.parents) && !empty($theme.params.GComments) && empty($theme.params.GStaticComments)) || (!empty($theme.parents) && !empty($theme.params.AComments) && empty($theme.params.AStaticComments)))}{* comments view *}

                {if !empty($block.comment.LoadComments.comments)}
		  {literal}<script type="text/JavaScript">
		  //<![CDATA[
		  <!--
		  img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('comments{$item.id}');{if $theme.params.topNavPics == "left"}setLyr(this,'comments{$item.id}',20,-150){else}setLyr(this,'comments{$item.id}',20,-380){/if}\" title=\"{g->text text='Show Comments'}\" class=\"icon tLink-view_comment\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' title=\"{g->text text='Show Comments'}\" alt=\"{g->text text='Show Comments'}\"/><\/a>"{literal};
		  function Viewcom(){document.write(img);}
		  Viewcom();
		  //-->
		  //]]>
		  </script>{/literal}

 	          <div id="comments{$item.id}" style="position: absolute; left:0px; top:0px; text-align:left; z-index: 30; visibility: hidden;" class="BlockOpacity">
		    <table style="width:500px" class="gcBorder2 gcBackground2">
		      <tr>
		 	<td class="gcBorder1 gcBackground1">
			  <div  onmousedown="dragStart(event, 'comments{$item.id}')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			    <table style="width:100%" class="gcBackground1">
			      <tr>
			        <td style="text-align:left">
         	    		  <h3>&nbsp;{$item.title|markup}</h3>
				</td>
				<td style="text-align:right">
			          <a onmouseover="hideLyr('comments{$item.id}')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif" alt='{g->text text='Close'}'/></a>
				</td>
			      </tr>		
			    </table>
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
          </td>
          <td>  
	        {/if}
    	      {/if} {* comments view end*}
	    {/if} {* comments end *}

	    {* blocks *}

	    {if !empty($theme.params.albumBlocks) && ((empty($theme.parents) && !empty($theme.params.GBlocksBtn)) || (!empty($theme.parents) && !empty($theme.params.ABlocksBtn)))}
              {assign var=item value=$theme.item}
              {foreach from=$theme.params.albumBlocks item=block}
		{g->callback type="comment.LoadComments" itemId=$item.id show=5}
		{g->callback type="exif.LoadExifInfo" itemId=$item.id}
		{g->callback type="rating.LoadRating" itemId=$item.id}

		{if !empty($block.0)}
		  {if ($block.0 == 'rating.Rating') 
			&& ((empty($theme.parents) && empty($theme.params.GRating)) 
				|| (!empty($theme.parents) && empty($theme.params.ARating)))}
		    {assign var='showblockR' value='1'}
		  {else}
		    {assign var='showblockR' value=0}
		  {/if}

	          {if ($block.0 == 'comment.ViewComments') 
			&& ((empty($theme.parents) && empty($theme.params.GComments)) 
				|| (!empty($theme.parents) && empty($theme.params.AComments)))}
		    {assign var='showblockVC' value='1'}
		  {else}
		    {assign var='showblockVC' value=0}
		  {/if}
		  {if ($block.0 == 'comment.AddComment') 
			&& ((empty($theme.parents) && ($theme.params.GAddComment == 'none'))
				|| (!empty($theme.parents) && ($theme.params.AAddComment == 'none')))}
		    {assign var='showblockAC' value='1'}
		  {else}
		    {assign var='showblockAC' value=0}
		  {/if}
		  {if ($block.0 == 'cart.ShowCart')
			&& ((empty($theme.parents) && empty($theme.params.GViewCart))
				|| (!empty($theme.parents) && empty($theme.params.AViewCart)))}
		    {assign var='showblockCart' value='1'}
		  {else}
		    {assign var='showblockCart' value=0}
		  {/if}
		{/if}

		{if (($block.0 != 'rating.Rating') 
			|| (empty($theme.parents) && $theme.params.GRating == 'none') 
			|| (!empty($theme.parents) && $theme.params.ARating == 'none')) 
		    && (($block.0 != 'comment.ViewComments') 
			|| (empty($theme.parents) 
			  && (empty($theme.params.GComments) && empty($theme.params.GStaticComments))) 
			|| (!empty($theme.parents) 
			  && (empty($theme.params.AComments) && empty($theme.params.AStaticComments)))) 
		    && (($block.0 != 'comment.AddComment') 
			|| (empty($theme.parents) && ($theme.params.GAddComment == 'none')) 
			|| (!empty($theme.parents) && ($theme.params.AAddComment == 'none')))
 		    && (($block.0 != 'cart.ShowCart') 
			|| (empty($theme.parents) && empty($theme.params.GViewCart)) 
			|| (!empty($theme.parents) && empty($theme.params.AViewCart)))}
		  {assign var='showblock0' value='1'}
		{/if}
              {/foreach}



	      {if !empty($showblock0) || (!empty($showblock0) && (!empty($showblockR) || !empty($showblockVC) || !empty($showblockAC) || !empty($showblockCart)))} 
		{assign var='showblockpic' value='1'}
	      {/if}


{***	      {if ($showblockpic == 1)}
***}
	{if !empty($showBlocks)}
		{literal}<script type="text/JavaScript">
		//<![CDATA[
		<!--
		img = {/literal}"<a href=\"javascript:void(0)\" onclick=\"toggleLyr('blocks');{if $theme.params.topNavPics == "left"}setLyr(this,'blocks',25,-160){else}setLyr(this,'blocks',25,-390){/if}\" title=\"{g->text text='More Information'}\" class=\"icon tLink-image_block\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src='{$imageURL_base}blank.gif' alt=\"{g->text text='More Information'}\" title=\"{g->text text='More Information'}\"/><\/a>"{literal};
		function Viewblocks(){document.write(img);}
		Viewblocks();
		//-->
		//]]>
		</script>{/literal}

	        <div id="blocks" style="position: absolute; left:0px; top:0px; text-align:left; z-index: 30; visibility: hidden;" class="BlockOpacity">
		  <table style="width:500px" class="gcBackground2 gcBorder2">
	  	    <tr>
	    	      <td class="gcBorder1 gcBackground1" style="text-align:right">
	      		<div onmousedown="dragStart(event, 'blocks')" class="BlockMove" style="text-align:right" title="{g->text text='click on this bar, drag and drop to move'}">
			  <a onmouseover="hideLyr('blocks')" title="{g->text text='Close'}" class="icon tLink-close"><img src="{$imageURL_base}blank.gif"  title="{g->text text='Close'}" alt="{g->text text='Close'}"/></a>
 	      		</div>
	    	      </td>
	  	    </tr>
	  	    <tr>
            	      <td>
	      	        <table style="width:100%" class="gcBorder1" align="{if $theme.params.BlocksAlign}{$theme.params.BlocksAlign}{else}center{/if}">
			  <tr>
	          	    <td>
		  	    </td>
			  </tr>

			  {foreach from=$theme.params.albumBlocks item=block}

		          {if (empty($theme.parents) && ((($block.0 == "comment.AddComment") && ($theme.params.GAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.GComments) || !empty($theme.params.GStaticComments))) || (($block.0 == "rating.Rating") && !empty($theme.params.GRating)) || (($block.0 == "cart.ShowCart") && !empty($theme.params.GViewCart)))) || (!empty($theme.parents) && ((($block.0 == "comment.AddComment") && ($theme.params.AAddComment != 'none')) || (($block.0 == "comment.ViewComments") && (!empty($theme.params.AComments) || !empty($theme.params.AStaticComments))) || (($block.0 == "rating.Rating") && !empty($theme.params.ARating)) || (($block.0 == "cart.ShowCart") && !empty($theme.params.AViewCart))))}
{assign var="block" value=0}{/if}

			  {if !empty($block)}
			  <tr>
		  	    <td>
		    	      <table align="{if $theme.params.BlocksInAlign}{$theme.params.BlocksInAlign}{else}center{/if}">
		      	        <tr>
				  <td {if $block.0 == 'imageblock.ImageBlock'} style="text-align:center;"{else}style="text-align:left;"{/if}>1
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
		  <br/>
      	        </div>

	      {/if}
 	    {/if} {* / blocks *}

	  {/if} {* / album items *}
          </td>

	  {if $theme.params.topNavPics == 'right'}
          <td style="width:10px">
          </td>
	  {/if}
	  
        </tr>
      </table>
      {if !empty($theme.itemLinks) && (empty($photoItem) && $theme.params.AInfo == 'top') || (!empty($photoItem) && $theme.params.PActionsPos == 'topNav')}
	{if (($theme.item.ownerId == $user.id) || $user.isAdmin) && $theme.guestPreviewMode != 1}
        <br/>
	{g->block type="core.ItemLinks" item=$item links=$theme.itemLinks}
	{/if}
      {/if}
    </td>

    {if $theme.params.topNavPics == 'right' && !empty($theme.parents)}
    <td style="text-align:right; width:{$iconTwidth}px;" valign="top">
      <table align="right" class="tableacpic" style="width:{$iconTwidth}px;">
        <tr>
          <td style="text-align:right; white-space: nowrap">
            {section name=parent loop=$theme.parents}
            {if !$smarty.section.parent.last}
              {if $smarty.section.parent.first}
 	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.parents[parent.index_next].id`"}" title="{$theme.parents[parent].title}" class="icon tLink-gallery" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
              {else}
	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.parents[parent.index_next].id`"}" title="{$theme.parents[parent].title}" class="icon tLink-album" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
              {/if}
            {else}
              {if !$smarty.section.parent.first}
                {if ($theme.params.enterAlbumDirect == 'none' || (($theme.params.enterAlbumDirect == 'thumbs' || $theme.params.enterAlbumDirect == 'thumbsNoAlbum') && $theme.params.enterAlbumTopNav))}
 	          <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.item.id`"}" title="{$theme.parents[parent].title}" class="icon tLink-thumbnails" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}" alt="{$theme.parents[parent].title}"/></a>
                {/if}
              {else}
	        <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.parents[parent].id`" arg3="highlightId=`$theme.item.id`"}" title="{$theme.parents[parent].title}" class="icon tLink-gallery" style="padding-bottom: 2px; padding-top: 2px;"><img src="{$imageURL_base}blank.gif" title="{$theme.parents[parent].title}"  alt="{$theme.parents[parent].title}"/></a>
              {/if}
              {if ($theme.params.Showslideshow && $theme.slideshow)}
		{literal}
		<script type="text/JavaScript">
		//<![CDATA[
		<!--
		sslink = {/literal}"<a href=\"{g->url arg1="view=slideshow.Slideshow" arg2="itemId=`$theme.item.id`"}\" title=\"{g->text text='SlideShow'}\" class=\"icon tLink-view_slideshow\" style=\"padding-bottom: 2px; padding-top: 2px;\"><img src=\"{$imageURL_base}blank.gif\" alt=\"{g->text text='SlideShow'}\"  title=\"{g->text text='SlideShow'}\"/><\/a>"{literal}; 
		function Viewsslink(){document.write(sslink);}
		Viewsslink();
		//-->
		//]]>
		</script>
		{/literal}
	      {/if}
            {/if}
            {/section}
          </td>
        </tr>
      </table>
    </td>
    {/if}
  </tr>
</table>

