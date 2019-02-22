{*
* $Revision: 16349 $
* Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
<div id="gsContent">
    <div class="gbBlock gcBackground1">
        {if !empty($theme.item.title)}
        <h2 class="giAlbumTitle">{$theme.item.title|markup} </h2>
        {/if}
        {if !empty($theme.item.description)}
        <p class="giDescription">
            {$theme.item.description|markup}
        </p>
        {/if}
    </div>
    {if !empty($theme.navigator)}
    <div class="gbBlock gcBackground2 gbNavigator">
        {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
    </div>
    {/if}
    {if !count($theme.children)}
    <div class="gbBlock giDescription gbEmptyAlbum">
        <h3 class="emptyAlbum">{g->text text="This album is empty."}
            {if isset($theme.permissions.core_addDataItem)}
            <br/>
            <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> { g->text text="Add Items!"}  </a>
            {/if}
        </h3>
    </div>
    {else}
    {assign var="childrenInColumnCount" value=0}
    <div class="gbBlock">
        <section id="gsThumbMatrix">
            {foreach from=$theme.children item=child}
            <article class="gallery-item">
                {if ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')}
                {assign var=frameType value="albumFrame"}
                {capture assign=linkUrl}{g->url arg1="view=core.ShowItem"
                arg2="itemId=`$child.id`"}{/capture}
                {else}
                {assign var=frameType value="itemFrame"}
                {capture assign=linkUrl}{strip}
                {if $theme.params.dynamicLinks == 'jump'}
                {g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}
                {else}
                {g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}
                {/if}
                {/strip}{/capture}
                {/if}
                {if isset($child.thumbnail)}
                    {if !$child.canContainChildren}
                    <a class="inner-shadow" data-id="{$child.id}" rel="bookmark" href="{$linkUrl}">
                        {g->image item=$child image=$child.thumbnail class="giThumbnail `$child.entityType`"}
                    </a>
                    {else}
                    <a class="inner-shadow" data-id="{$child.id}" rel="bookmark" href="{$linkUrl}">
                        {g->image item=$child image=$child.thumbnail class="giThumbnail `$child.entityType`"}
                    </a>
                    {/if}
                {else}
                <a rel="bookmark" href="{$linkUrl}" class="giMissingThumbnail">
                    {g->text text="no thumbnail"}
                </a>
                {/if}
                {if !empty($child.title)}
                <span class="giInfo" style="width: 80%;">
                    {if $child.canContainChildren && (!isset($theme.params.albumFrame)
                    || $theme.params.albumFrame == $theme.params.itemFrame)}
                    {* Add prefix for albums unless imageframe will differentiate *}
                    <strong>{g->text text="Album: %s" arg1=$child.title|markup}</strong>
                    {else}
                    <strong>{$child.title|markup|regex_replace:"/[0-9]/s":""|regex_replace:"/_x+$/":""|regex_replace:"/_/s":""|entitytruncate:24}</strong>
                    {/if}
                    {if !empty($child.summary)}
                    <br />
                    <span class="giDescription">
                        {$child.summary|markup|entitytruncate:256}
                    </span>
                    {/if}
                    <br />
                    {capture name=childTimestamp}{g->date timestamp=$child.originationTimestamp}{/capture}
                    <time>{g->text text="Date: %s" arg1=$smarty.capture.childTimestamp}</time>
                    {g->block type="core.ItemLinks" item=$child links=$child.itemLinks}
                </span>
                {/if}
                {if $child.canContainChildren}
                <span class="giCount">
                    <a rel="bookmark" href="{$linkUrl}">
                        {$child.descendentCount}
                    </a>
                    <br />
                    Items
                </span>
                {/if}
            </article>
            {/foreach}
        </section>
    </div>
    <div class="clear">
        <!-- ClearFix -->
    </div>
    {/if}
    {if !empty($theme.navigator)}
    <div class="gbBlock gcBackground2 gbNavigator">
        {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
    </div>
    {/if}
    {if !empty($theme.jumpRange)}
    <div id="gsPages" class="gbBlock gcBackground1">
        {g->block type="core.Pager"}
    </div>
    {/if}
    {* Our emergency edit link, if the user removes all blocks containing edit links *}
    {g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="sidebar,album"}
    {* Show any other album blocks (comments, etc) *}
    {foreach from=$theme.params.albumBlocks item=block}
    {g->block type=$block.0 params=$block.1}
    {/foreach}
</div>
<div class="clear">
    <!-- ClearFix -->
</div>
{if $user.isAdmin}
{if !empty($theme.params.sidebarBlocks)}
{g->theme include="sidebar.tpl"}
<script type="text/javascript">
 {* hide the sidebar if there's nothing in it *}
 // <![CDATA[
 var el = document.getElementById("gsSidebar");
 var text = el.innerText;  // IE
 if (!text) text = el.textContent; // Firefox
 if (!text || !text.match(/\S/)) el.style.display = 'none';
 // ]]>  
</script>
{/if}
{/if}
<script>!window.jQuery && document.write(unescape('%3Cscript src="{g->theme url="js/jquery.min.js"}"%3E%3C/script%3E'))</script>
{literal}
<script>
    (function($) {
        $(document).ready(equalize);
        $('.gallery-item:last-child img').on('load', equalize);
        function equalize(){
            var LeftColumnHeight = RightColumnHeight = 0;
            
            var items = $('.gallery-item');
        
            for (var i = 0; i < items.length; i++) {
                //if(items.eq(i).hasClass('right'))items.eq(i).removeClass('right')
                if (LeftColumnHeight > RightColumnHeight) {
                    RightColumnHeight += items.eq(i).css({'float': 'right', 'clear': 'right'}).outerHeight(true);
                    //console.log('Right: '+items.eq(i).height());
                } else {
                    LeftColumnHeight += items.eq(i).css({'float': 'left', 'clear': 'left'}).outerHeight(true);
                    //console.log('Left: '+items.eq(i).height());
                }
            }
        
            return items;
        }
    })(jQuery);
</script>
{/literal}
