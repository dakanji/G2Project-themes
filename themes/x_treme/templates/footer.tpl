{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
<table width="100%">
  <tr>
    <td nowrap="nowrap">
      <div>
        <div style="position:relative; float:left;">
          <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
            {g->logoButton type="validation"}
	  </div>
          <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
            {g->logoButton type="donate"}
          </div>
	  {if ($user.isAdmin && ($theme.guestPreviewMode !=1)) || !empty($theme.params.g2btn)}
            <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
              {g->logoButton type="gallery2"}
            </div>
          {else}
	    <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
	      <a href="http://gallery.menalto.com" title="{g->text text='Gallery 2'}">
		&nbsp;{g->text text="G2.2"}&nbsp;
	      </a>
	    </div>
	  {/if}
          <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
            {g->logoButton type="gallery2-version"}
          </div>
	  {if ($user.isAdmin && ($theme.guestPreviewMode !=1)) || !empty($theme.params.x_btn)}
            <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
              <a href="http://www.pedrogilberto.net/g2" title="Theme - X_treme, by PedroGilberto.net - version: 1.0.6" target="_blank"><img src="{$imageURL_base}x&#95;treme.gif" alt="Theme - X_treme" longdesc="Theme - X_treme" style="border: 0" title="Theme - X_treme, by PedroGilberto.net - version: 1.0.6"/></a>
	    </div>
	  {else}
	    <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
	      <b>&nbsp;::&nbsp;</b>
	      <a href="http://www.pedrogilberto.net/g2" title="Theme - X_treme, by PedroGilberto.net - version: 1.0.6" target="_blank">X_treme</a> by
	      <a href="http://www.pedrogilberto.net" title="http://www.pedrogilberto.net" target="_blank"> PedroGilberto.net</a>
	    </div>
	  {/if}
	  {if !empty($theme.params.x_cpbtn)}
            <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
              {if !empty($theme.params.colorpack)}
          	<a href="http://www.pedrogilberto.net/g2" title="Colorpack - {$theme.params.colorpack}, by PedroGilberto.net" target="_blank">
            	  <img src="{g->url href="modules/colorpack/packs/"}{$theme.params.colorpack}/cpack.gif" alt="Colorpack - {$theme.params.colorpack}" longdesc="Colorpack - {$theme.params.colorpack}" style="border: 0" title="Colorpack - {$theme.params.colorpack}, by PedroGilberto.net" />
	        </a>
              {/if}
            </div>
            <div style="position:relative; float:left;" class="footerButton" onmouseover="this.className='footerButtonOn'" onmouseout="this.className='footerButton'">
              {if !empty($Xicons)}
          	<a href="http://www.pedrogilberto.net/g2" title="Iconpack - {$theme.iconpack}, by PedroGilberto.net" target="_blank">
            	  <img src="{g->url href='modules/icons/iconpacks/'}{$theme.iconpack}/ipack.gif" alt="Iconpack - {$theme.iconpack}" longdesc="Iconpack - {$theme.iconpack}" style="border: 0" title="Iconpack - {$theme.iconpack}, by PedroGilberto.net" />
	        </a>
              {/if}
            </div>
	  {/if}
        </div>
  <![if !IE]>
        <div style="position:relative; float:right;" class="footerCopyAlpha"  onmouseover="this.className='footerCopyAlphaOn'" onmouseout="this.className='footerCopyAlpha'">
  <![endif]>

  <![if lt IE 7]>
        <div style="position:relative; float:right;" class="footerCopy">
  <![endif]>


          {if !empty($theme.params.copyright)}
          <span class="footerCopyText">{g->text text="&copy;"}</span>
            {if !empty($theme.params.copyrightDate)}
              {if !empty($theme.params.copyrightDateText)}{$theme.params.copyrightDateText}{else}
                {capture name=childTimestamp}{g->date timestamp=$item.originationTimestamp format=%Y}{/capture}
                {g->text text="%s" arg1=$smarty.capture.childTimestamp}
              {/if}&nbsp;-
            {/if}
	    {if !empty($theme.params.showCopyrightEmail)}
            <a href="mailto:{if !empty($theme.params.copyrightEmail)}{$theme.params.copyrightEmail}{else}{$theme.item.owner.email}{/if}" title="{if !empty($theme.params.copyrightEmail)}{$theme.params.copyrightEmail}{else}{$theme.item.owner.email}{/if}">
	    {/if}
	    {if !empty($theme.params.copyrightName)}{$theme.params.copyrightName}{else}{$theme.item.owner.fullName|default:$theme.item.owner.fullName}{/if}		    {if !empty($theme.params.showCopyrightEmail)}</a>{/if}

          ({g->text text="all rights reserved"})
          {/if}
        </div>
      </div>
    </td>
  </tr>
</table>
<table>
  <tr>
    <td>
      {if !empty($theme.params.bannerFooter)}
	{g->theme include=$bannerFooter}
      {/if}
    </td>
  </tr>
</table>
