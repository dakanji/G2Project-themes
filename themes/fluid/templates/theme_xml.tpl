{*
 * $Revision: 528 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{strip}
      {* Include the appropriate content type for the page we want to draw. *}
      {if $theme.pageType == 'album'}
        {g->theme include="album_xml.tpl"}
      {elseif $theme.pageType == 'photo'}
        <photo>
        {g->theme include="photo_xml.tpl"}
        </photo>
      {elseif $theme.pageType == 'admin'}
        {g->theme include="admin.tpl"}
      {elseif $theme.pageType == 'module'}
        {g->theme include="module.tpl"}
      {elseif $theme.pageType == 'progressbar'}
        {g->theme include="progressbar.tpl"}
      {/if}{/strip}

