{*
 * $Revision: 1074 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}

  {if !empty($theme.params.bgcolor)}
    {literal}
#gallery, body.gallery, .PPBackground {background-color: {/literal}{$theme.params.bgcolor}{literal} !important;}
table.gbDataTable th { background-color: {/literal}{$theme.params.bgcolor}{literal} !important; }
    {/literal}
  {/if}

  {if !empty($theme.params.bg1color)}
    {literal}
.gcBackground1, .gbEven {background-color: {/literal}{$theme.params.bg1color}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.bg2color)}
    {literal}
.gcBackground2, .iframeBackground, .gbOdd {background-color: {/literal}{$theme.params.bg2color}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.border1color)}
    {literal}
.gcBorder1, .gcBorder1Author, .gcBorder1Top {border-color: {/literal}{$theme.params.border1color}{literal} !important;}
    {/literal}
  {elseif !empty($theme.params.bgcolor)}
    {literal}
.gcBorder1, .gcBorder1Author, .gcBorder1Top {border-color: {/literal}{$theme.params.bgcolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.border1size)}
    {literal}
.gcBorder1, .gcBorder1Author, .gcBorder1Top {border-width: {/literal}{$theme.params.border1size}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.border2color)}
    {literal}
.gcBorder2 {border-color: {/literal}{$theme.params.border2color}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.border2size)}
    {literal}
.gcBorder2 {border-width: {/literal}{$theme.params.border2size}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.Gfontcolor)}
    {literal}
#gallery, #gallery pre, #gallery tt, .giSubtitle, .giDescription, #gsNavBar div.gbBreadCrumb, div.gbTabBar, #gallery .gbMarkupBar input, #gsSidebar div ul, #gsSidebar div ul ul, .author, .authoremail, a.authorlink, .help, .help td {color: {/literal}{$theme.params.Gfontcolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.Gfontsize)}
    {literal}
#gallery, #gallery pre, #gallery tt, .giSubtitle, .giDescription, #gsNavBar div.gbBreadCrumb, div.gbTabBar, #gallery .gbMarkupBar input, #gsSidebar div ul, #gsSidebar div ul ul, .author, .authoremail, a.authorlink, .help, .help td {font-size: {/literal}{$theme.params.Gfontsize}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.Gfontfamily)}
    {literal}
#gallery, #gallery pre, #gallery tt, .giSubtitle, .giDescription, #gsNavBar div.gbBreadCrumb, div.gbTabBar, #gallery .gbMarkupBar input, #gsSidebar div ul, #gsSidebar div ul ul, .author, .authoremail, a.authorlink, .help, .help td {font-family: {/literal}{$theme.params.Gfontfamily}{literal} !important;}
    {/literal}
  {/if}


  {if !empty($theme.params.linkcolor)}
    {literal}
#gallery a, a.authorlink {color: {/literal}{$theme.params.linkcolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.linkhovercolor)}
    {literal}
#gallery a:hover {color: {/literal}{$theme.params.linkhovercolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.linkactivecolor)}
    {literal}
#gallery a:active {color: {/literal}{$theme.params.linkactivecolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.BreadCrumbfontsize)}
    {literal}
#topNavBar td.BreadCrumb div span, #topNavBar td.BreadCrumb div a {font-size: {/literal}{$theme.params.BreadCrumbfontsize}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.SystemLinksfontsize)}
    {literal}
#topNavBar td.SystemLinks span a, #topNavBar td.SystemLinks a {font-size: {/literal}{$theme.params.SystemLinksfontsize}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.GTfontfamily)}
    {literal}
#gallery h2, #gallery h3, #gallery h4 {font-family: {/literal}{$theme.params.GTfontfamily}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.GTfontsize)}
    {literal}
.giTitle, #gallery h2, #gallery h3, #gallery h4 {font-size: {/literal}{$theme.params.GTfontsize}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.GTfontcolor)}
    {literal}
.giTitle, #gallery h2, #gallery h3, #gallery h4 {color: {/literal}{$theme.params.GTfontcolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.GIfontsize)}
    {literal}
.giInfo {font-size: {/literal}{$theme.params.GIfontsize}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.GIfontcolor)}
    {literal}
.giInfo {color: {/literal}{$theme.params.Gfontcolor}{literal} !important;}
    {/literal}
  {/if}

  {if !empty($theme.params.GNcolor)}
    {literal}
.giNew, .giUpdated {color: {/literal}{$theme.params.GNcolor}{literal}; border-color: {/literal}{$theme.params.GNcolor}{literal} !important;}
    {/literal}
  {/if}


