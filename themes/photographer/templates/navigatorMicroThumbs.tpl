{*
* $Revision: 16235 $
* Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
{g->callback type="core.LoadPeers" item=$item|default:$theme.item
windowSize=$windowSize|default:13
addEnds=false loadThumbnails=true}
{assign var="data" value=$block.core.LoadPeers}
{if !empty($data.peers)}
<div align="center">
    <ul>
        {foreach from=$data.peers item=peer}
        {assign var="title" value=$peer.title|default:$peer.pathComponent}
        {if (!$peer.canContainChildren && $peer.entityType != 'GalleryLinkItem')}
        {if ($peer.peerIndex == $data.thisPeerIndex)}
        <li id="microThumbCurrent" align="center" style="width:44px; height:40px;">
            {if isset($peer.thumbnail)}
            {g->image item=$peer image=$peer.thumbnail maxSize=40 title="$title"}
            {else}
            {g->text text="no thumbnail"}
            {/if}
        </li>
        {else}
        <li align="center" style="width:44px; height:40px;">
            {strip}<a href="{g->url params=$theme.pageUrl arg1="itemId=`$peer.id`"}">
                {if   isset($peer.thumbnail)}
                { g->image item=$peer   image=$peer.thumbnail   maxSize=40   title="$title"}
                {else}
                { g->text text="no thumbnail"}
                {/if}
                 </a>
            {/strip}
        </li>
        {/if}
        {/if}
        {/foreach}
    </ul>
</div>
{/if}