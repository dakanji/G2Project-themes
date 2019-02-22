{*
 * $Revision: 1252 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}

{if $user.isAdmin && !empty($AdminThemes.themeId) && $AdminThemes.themeId == "x_treme"}
  <table border="0" align="center" width="100%">
    <tr>
      <td>
	<table class="helplink gcBorder1" align="right">
	  <tr>
	    <td>
	      <a href="http://codex.gallery2.org/index.php/Gallery2:Themes:x_treme" target="new" 
			title="How To configure X_treme theme">
		&nbsp;How To configure X_treme Theme&nbsp;
	      </a>
	    </td>
	  </tr>
	</table>
      </td>
    </tr>
  </table>
{/if}

{include file="gallery:`$theme.adminTemplate`" l10Domain=$theme.adminL10Domain}

{if $sidebar=="floating" && $theme.params.sidebarBlocks}
  <div id='floatingSidebar' style='z-index: 1; visibility: hidden;'></div>
{/if}
