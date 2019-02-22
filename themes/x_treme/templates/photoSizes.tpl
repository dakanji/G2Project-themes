{*
 * $Revision: 1043 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
<div class="{$class}">
   {if count($theme.imageViews) > 1}

     {g->text text="Size: "}
     <select onchange="{literal}if (this.value) { newLocation = this.value; this.options[0].selected = true; location.href= newLocation; }{/literal}">
     {section name=imageView loop=$theme.imageViews}
       <option value="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`"
	arg3="imageViewsIndex=`$smarty.section.imageView.index`"}"{if
	$smarty.section.imageView.index==$theme.imageViewsIndex} selected="selected"{/if}>
	 {if empty($theme.imageViews[imageView].width)}
	   {if isset($theme.imageViews[imageView].isSource)}
	     {g->text text="Source"}
	   {else}
	     {g->text text="Unknown"}
	   {/if}
	 {else}
	   {g->text text="%dx%d" arg1=$theme.imageViews[imageView].width
	       arg2=$theme.imageViews[imageView].height}
	 {/if}
       </option>
     {/section}
     </select>
     <br/>
   {/if}

   {if !empty($theme.sourceImage)}
     {capture name="fullSize"}
       {if empty($theme.sourceImage.width)}
	 {$theme.sourceImage.itemTypeName.0}
       {else}
	 {g->text text="%dx%d" arg1=$theme.sourceImage.width
	     arg2=$theme.sourceImage.height}
       {/if}
     {/capture}


     {if count($theme.imageViews) > 1}
     {g->text text="Full size: "}
       {if ($theme.params.PopSize =="show") || ($theme.params.PopSize =="even")}
        <a href="javascript:void(0);" onclick="fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;" title="{g->text text='popup window'}">
       {else}
       <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`"
	arg3="imageViewsIndex=`$theme.sourceImageViewIndex`"}">
       {/if}
	 {$smarty.capture.fullSize}
       </a>
     {else}
       {if ($theme.params.InfoSize =="even")}
         {g->text text="Full size: "}
         {if ($theme.params.PopSize =="even")}
            <a href="javascript:void(0);" onclick="fsizeopen('{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}'); return false;" title="{g->text text='popup window'}">
         {/if}
         {$smarty.capture.fullSize}
         {if ($theme.params.PopSize =="even")}
           </a>
         {/if}
       {/if}
     {/if}
     <br/>
   {/if}
</div>