{*
 * $Revision: 1043 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}

{assign var="interactiveframe" value=$theme.params.interactiveframe}
{assign var="framePP" value=$theme.params.framePP}
{assign var="frameColor" value=$theme.params.frameColor|default:""}
{assign var="frameTheight" value=$theme.params.frameTheight|default:"30"} 
{assign var="frameLwidth" value=$theme.params.frameLwidth|default:"$frameTheight"}
{assign var="frameRwidth" value=$theme.params.frameRwidth|default:"$frameTheight"}

{if !empty($theme.params.frameBheight)}
  {assign var="frameBheight" value=$theme.params.frameBheight}
{else}
  {if !empty($theme.params.frameTheight)}
    {assign var="frameBheight" value=$theme.params.frameTheight|default:"50"}
  {else}
    {assign var="frameBheight" value="50"}
  {/if}
{/if}

{assign var="frameFont" value=$theme.params.frameFont|default:""}
{assign var="frameFontColor" value=$theme.params.frameFontColor|default:""}
{assign var="frameFontSize" value=$theme.params.frameFontSize|default:"10px"}
{assign var="framePP" value=$theme.params.framePP|default:""}
{assign var="framePPColor" value=$theme.params.framePPColor|default:""}
{assign var="framePPTheight" value=$theme.params.framePPTheight|default:"30"}
{assign var="framePPLwidth" value=$theme.params.framePPLwidth|default:"$framePPTheight"}
{assign var="framePPRwidth" value=$theme.params.framePPRwidth|default:"$framePPTheight"}
{assign var="framePPBheight" value=$theme.params.framePPBheight|default:"$framePPTheight"}
{assign var="framePPFont" value=$theme.params.framePPFont|default:""}
{assign var="framePPFontColor" value=$theme.params.framePPFontColor|default:""}
{assign var="framePPFontSize" value=$theme.params.framePPFontSize|default:"10px"}
{assign var="frameParentTitle" value=$theme.params.frameParentTitle|default:""}
{assign var="frameParentPS" value=$theme.params.frameParentPS|default:""}
{assign var="frameFontParent" value=$theme.params.frameFontParent|default:""}
{assign var="frameFontColorParent" value=$theme.params.frameFontColorParent|default:""}
{assign var="framePPFontColorParent" value=$theme.params.frameFontColorParent|default:""}
{assign var="frameFontSizeParent" value=$theme.params.frameFontSizeParent|default:"1.3em"}
{assign var="frameFontSpacingParent" value=$theme.params.frameFontSpacingParent|default:"0.5em"}
{assign var="frameStyleParent" value=$theme.params.frameStyleParent|default:""}
{assign var="frameParentAlign" value=$theme.params.frameParentAlign|default:""}
{assign var="frameItemTitle" value=$theme.params.frameItemTitle|default:""}
{assign var="frameTitlePS" value=$theme.params.frameTitlePS|default:""}
{assign var="frameFontTitle" value=$theme.params.frameFontTitle|default:""}
{assign var="frameFontColorTitle" value=$theme.params.frameFontColorTitle|default:""}
{assign var="framePPFontColorTitle" value=$theme.params.frameFontColorTitle|default:""}
{assign var="frameFontSizeTitle" value=$theme.params.frameFontSizeTitle|default:"1.3em"}
{assign var="frameFontSpacingTitle" value=$theme.params.frameFontSpacingTitle|default:"0.5em"}
{assign var="frameStyleTitle" value=$theme.params.frameStyleTitle|default:""}
{assign var="frameTitleAlign" value=$theme.params.frameTitleAlign|default:""}
{assign var="frameItemDescription" value=$theme.params.frameItemDescription|default:""}
{assign var="frameDescriptionAlign" value=$theme.params.frameDescriptionAlign|default:""}
{assign var="frameDescriptionStyle" value=$theme.params.frameDescriptionStyle|default:""}
{assign var="frameCopyright" value=$theme.params.frameCopyright|default:""}
{assign var="frameCopyrightStyle" value=$theme.params.frameCopyrightStyle|default:""}
{assign var="frameFreeText1" value=$theme.params.frameFreeText1|default:""}
{assign var="frameFreeText1Style" value=$theme.params.frameFreeText1Style|default:""}
{assign var="frameFreeText1pos" value=$theme.params.frameFreeText1pos|default:""}
{assign var="frameFreeText2" value=$theme.params.frameFreeText2|default:""}
{assign var="frameFreeText2Style" value=$theme.params.frameFreeText2Style|default:""}
{assign var="frameFreeText2pos" value=$theme.params.frameFreeText2pos|default:""}



{if $theme.params.setiframe == '1'}
  {if $frameColor}
    {assign var="frameColor" value=$frameColor}
  {else}
    {assign var="frameColor" value="#eeeeee"}
  {/if}
  {if $frameTheight}
    {assign var="frameTheight" value=$frameTheight}
  {else}
    {assign var="frameTheight" value="70"}
  {/if}
  {if $frameLwidth}
    {assign var="frameLwidth" value=$frameLwidth}
  {else}
    {assign var="frameLwidth" value="70"}
  {/if}
  {if $frameRwidth}
    {assign var="frameRwidth" value=$frameRwidth}
  {else}
    {assign var="frameRwidth" value="70"}
  {/if}
  {if $frameBheight}
    {assign var="frameBheight" value=$frameBheight}
  {else}
    {assign var="frameBheight" value="90"}
  {/if}
  {if $frameFont}
    {assign var="frameFont" value=$frameFont}
  {else}
    {assign var="frameFont" value=""}
  {/if}
  {if $frameFontColor}
    {assign var="frameFontColor" value=$frameFontColor}
  {else}
    {assign var="frameFontColor" value=""}
  {/if}
  {if $frameFontSize}
    {assign var="frameFontSize" value=$frameFontSize}
  {else}
    {assign var="frameFontSize" value="1.0em"}
  {/if}
  {if $framePP}
    {assign var="framePP" value=$framePP}
  {else}
    {assign var="framePP" value=""}
  {/if}
  {if $framePPColor}
    {assign var="framePPColor" value=$framePPColor}
  {else}
    {assign var="framePPColor" value=""}
  {/if}
  {if $framePPTheight}
    {assign var="framePPTheight" value=$framePPTheight}
  {else}
    {assign var="framePPTheight" value=""}
  {/if}
  {if $framePPLwidth}
    {assign var="framePPLwidth" value=$framePPLwidth}
  {else}
    {assign var="framePPLwidth" value=""}
  {/if}
  {if $framePPRwidth}
    {assign var="framePPRwidth" value=$framePPRwidth}
  {else}
    {assign var="framePPRwidth" value=""}
  {/if}
  {if $framePPBheight}
    {assign var="framePPBheight" value=$framePPBheight}
  {else}
    {assign var="framePPBheight" value=""}
  {/if}
  {if $framePPFont}}
    {assign var="framePPFont" value=$framePPFont}
  {else}
    {assign var="framePPFont" value=""}
  {/if}
  {if $framePPFontColor}
    {assign var="framePPFontColor" value=$framePPFontColor}
  {else}
    {assign var="framePPFontColor" value=""}
  {/if}
  {if $framePPFontSize}
    {assign var="framePPFontSize" value=$framePPFontSize}
  {else}
    {assign var="framePPFontSize" value=""}
  {/if}

  {assign var="frameParentTitle" value=$theme.params.frameParentTitle|default:"top"}

  {if $frameParentPS}
    {assign var="frameParentPS" value=$frameParentPS}
  {else}
    {assign var="frameParentPS" value="&#9632;"}
  {/if}
  {if $frameFontParent}
    {assign var="frameFontParent" value=$frameFontParent}
  {else}
    {assign var="frameFontParent" value=""}
  {/if}
  {if $frameFontColorParent}
    {assign var="frameFontColorParent" value=$frameFontColorParent}
  {else}
    {assign var="frameFontColorParent" value=""}
  {/if}
  {if $framePPFontColorParent}
    {assign var="framePPFontColorParent" value=$framePPFontColorParent}
  {else}
    {assign var="framePPFontColorParent" value=""}
  {/if}
  {if $frameFontSizeParent}
    {assign var="frameFontSizeParent" value=$frameFontSizeParent}
  {else}
    {assign var="frameFontSizeParent" value="1.3em"}
  {/if}
  {if $frameFontSpacingParent}
    {assign var="frameFontSpacingParent" value=$frameFontSpacingParent}
  {else}
    {assign var="frameFontSpacingParent" value="1.5em"}
  {/if}
  {if $frameStyleParent}
    {assign var="frameStyleParent" value=$frameStyleParent}
  {else}
    {assign var="frameStyleParent" value=""}
  {/if}
  {if $frameParentAlign}
    {assign var="frameParentAlign" value=$frameParentAlign}
  {else}
    {assign var="frameParentAlign" value="center"}
  {/if}

  {assign var="frameItemTitle" value=$theme.params.frameItemTitle|default:"bottom"}

  {if $frameTitlePS}
    {assign var="frameTitlePS" value=$frameTitlePS}
  {else}
    {assign var="frameTitlePS" value=""}
  {/if}
  {if $frameFontTitle}
    {assign var="frameFontTitle" value=$frameFontTitle}
  {else}
    {assign var="frameFontTitle" value="Times New Roman"}
  {/if}
  {if $frameFontColorTitle}
    {assign var="frameFontColorTitle" value=$frameFontColorTitle}
  {else}
    {assign var="frameFontColorTitle" value=""}
  {/if}
  {if $framePPFontColorTitle}
    {assign var="framePPFontColorTitle" value=$framePPFontColorTitle}
  {else}
    {assign var="framePPFontColorTitle" value=""}
  {/if}
  {if $frameFontSizeTitle}
    {assign var="frameFontSizeTitle" value=$frameFontSizeTitle}
  {else}
    {assign var="frameFontSizeTitle" value="1.5em"}
  {/if}
  {if $frameFontSpacingTitle}
    {assign var="frameFontSpacingTitle" value=$frameFontSpacingTitle}
  {else}
    {assign var="frameFontSpacingTitle" value="0.0em"}
  {/if}
  {if $frameStyleTitle}
    {assign var="frameStyleTitle" value=$frameStyleTitle}
  {else}
    {assign var="frameStyleTitle" value=""}
  {/if}
  {if $frameTitleAlign}
    {assign var="frameTitleAlign" value=$frameTitleAlign}
  {else}
    {assign var="frameTitleAlign" value=""}
  {/if}

  {assign var="frameItemDescription" value=$theme.params.frameItemDescription|default:""}

  {if $frameDescriptionAlign}
    {assign var="frameDescriptionAlign" value=$frameDescriptionAlign}
  {else}
    {assign var="frameDescriptionAlign" value=""}
  {/if}
  {if $frameDescriptionStyle}
    {assign var="frameDescriptionStyle" value=$frameDescriptionStyle}
  {else}
    {assign var="frameDescriptionStyle" value=""}
  {/if}

  {assign var="frameCopyright" value=$theme.params.frameCopyright|default:"frame"}

  {if $frameCopyrightStyle}
    {assign var="frameCopyrightStyle" value=$frameCopyrightStyle}
  {else}
    {assign var="frameCopyrightStyle" value="text-align:right"}
  {/if}
  {if $frameFreeText1}
    {assign var="frameFreeText1" value=$frameFreeText1}
  {else}
    {assign var="frameFreeText1" value=""}
  {/if}
  {if $frameFreeText1Style}
    {assign var="frameFreeText1Style" value=$frameFreeText1Style}
  {else}
    {assign var="frameFreeText1Style" value=""}
  {/if}
  {if $frameFreeText1pos}
    {assign var="frameFreeText1pos" value=$frameFreeText1pos}
  {else}
    {assign var="frameFreeText1pos" value=""}
  {/if}
  {if $frameFreeText2}
    {assign var="frameFreeText2" value=$frameFreeText2}
  {else}
    {assign var="frameFreeText2" value=""}
  {/if}
  {if $frameFreeText2Style}
    {assign var="frameFreeText2Style" value=$frameFreeText2Style}
  {else}
    {assign var="frameFreeText2Style" value=""}
  {/if}
  {if $frameFreeText2pos}
    {assign var="frameFreeText2pos" value=frameFreeText2pos}
  {else}
    {assign var="frameFreeText2pos" value=""}
  {/if}
{/if}

{if $theme.params.setiframe == '2'}
  {if $frameColor}
    {assign var="frameColor" value=$frameColor}
  {else}
    {assign var="frameColor" value="#dddddd"}
  {/if}
  {if $frameTheight}
    {assign var="frameTheight" value=$frameTheight}
  {else}
    {assign var="frameTheight" value="70"}
  {/if}
  {if $frameLwidth}
    {assign var="frameLwidth" value=$frameLwidth}
  {else}
    {assign var="frameLwidth" value="70"}
  {/if}
  {if $frameRwidth}
    {assign var="frameRwidth" value=$frameRwidth}
  {else}
    {assign var="frameRwidth" value="70"}
  {/if}
  {if $frameBheight}
    {assign var="frameBheight" value=$frameBheight}
  {else}
    {assign var="frameBheight" value="70"}
  {/if}
  {if $frameFont}
    {assign var="frameFont" value=$frameFont}
  {else}
    {assign var="frameFont" value=""}
  {/if}
  {if $frameFontColor}
    {assign var="frameFontColor" value=$frameFontColor}
  {else}
    {assign var="frameFontColor" value=""}
  {/if}
  {if $frameFontSize}
    {assign var="frameFontSize" value=$frameFontSize}
  {else}
    {assign var="frameFontSize" value="1.0em"}
  {/if}
  {if $framePP}
    {assign var="framePP" value=$framePP}
  {else}
    {assign var="framePP" value="1"}
  {/if}
  {if $framePPColor}
    {assign var="framePPColor" value=$framePPColor}
  {else}
    {assign var="framePPColor" value="#ffffff"}
  {/if}
  {if $framePPTheight}
    {assign var="framePPTheight" value=$framePPTheight}
  {else}
    {assign var="framePPTheight" value="25"}
  {/if}
  {if $framePPLwidth}
    {assign var="framePPLwidth" value=$framePPLwidth}
  {else}
    {assign var="framePPLwidth" value="25"}
  {/if}
  {if $framePPRwidth}
    {assign var="framePPRwidth" value=$framePPRwidth}
  {else}
    {assign var="framePPRwidth" value="25"}
  {/if}
  {if $framePPBheight}
    {assign var="framePPBheight" value=$framePPBheight}
  {else}
    {assign var="framePPBheight" value="25"}
  {/if}
  {if $framePPFont}}
    {assign var="framePPFont" value=$framePPFont}
  {else}
    {assign var="framePPFont" value=""}
  {/if}
  {if $framePPFontColor}
    {assign var="framePPFontColor" value=$framePPFontColor}
  {else}
    {assign var="framePPFontColor" value=""}
  {/if}
  {if $framePPFontSize}
    {assign var="framePPFontSize" value=$framePPFontSize}
  {else}
    {assign var="framePPFontSize" value=""}
  {/if}

  {assign var="frameParentTitle" value=$theme.params.frameParentTitle|default:"top"}

  {if $frameParentPS}
    {assign var="frameParentPS" value=$frameParentPS}
  {else}
    {assign var="frameParentPS" value="&#9632;"}
  {/if}
  {if $frameFontParent}
    {assign var="frameFontParent" value=$frameFontParent}
  {else}
    {assign var="frameFontParent" value=""}
  {/if}
  {if $frameFontColorParent}
    {assign var="frameFontColorParent" value=$frameFontColorParent}
  {else}
    {assign var="frameFontColorParent" value=""}
  {/if}
  {if $framePPFontColorParent}
    {assign var="framePPFontColorParent" value=$framePPFontColorParent}
  {else}
    {assign var="framePPFontColorParent" value=""}
  {/if}
  {if $frameFontSizeParent}
    {assign var="frameFontSizeParent" value=$frameFontSizeParent}
  {else}
    {assign var="frameFontSizeParent" value="1.5em"}
  {/if}
  {if $frameFontSpacingParent}
    {assign var="frameFontSpacingParent" value=$frameFontSpacingParent}
  {else}
    {assign var="frameFontSpacingParent" value="1.5em"}
  {/if}
  {if $frameStyleParent}
    {assign var="frameStyleParent" value=$frameStyleParent}
  {else}
    {assign var="frameStyleParent" value=""}
  {/if}
  {if $frameParentAlign}
    {assign var="frameParentAlign" value=$frameParentAlign}
  {else}
    {assign var="frameParentAlign" value="center"}
  {/if}

  {assign var="frameItemTitle" value=$theme.params.frameItemTitle|default:"bottom"}

  {if $frameTitlePS}
    {assign var="frameTitlePS" value=$frameTitlePS}
  {else}
    {assign var="frameTitlePS" value=""}
  {/if}
  {if $frameFontTitle}
    {assign var="frameFontTitle" value=$frameFontTitle}
  {else}
    {assign var="frameFontTitle" value=""}
  {/if}
  {if $frameFontColorTitle}
    {assign var="frameFontColorTitle" value=$frameFontColorTitle}
  {else}
    {assign var="frameFontColorTitle" value=""}
  {/if}
  {if $framePPFontColorTitle}
    {assign var="framePPFontColorTitle" value=$framePPFontColorTitle}
  {else}
    {assign var="framePPFontColorTitle" value=""}
  {/if}
  {if $frameFontSizeTitle}
    {assign var="frameFontSizeTitle" value=$frameFontSizeTitle}
  {else}
    {assign var="frameFontSizeTitle" value="1.7em"}
  {/if}
  {if $frameFontSpacingTitle}
    {assign var="frameFontSpacingTitle" value=$frameFontSpacingTitle}
  {else}
    {assign var="frameFontSpacingTitle" value="-0.1em"}
  {/if}
  {if $frameStyleTitle}
    {assign var="frameStyleTitle" value=$frameStyleTitle}
  {else}
    {assign var="frameStyleTitle" value=""}
  {/if}
  {if $frameTitleAlign}
    {assign var="frameTitleAlign" value=$frameTitleAlign}
  {else}
    {assign var="frameTitleAlign" value="center"}
  {/if}

  {assign var="frameItemDescription" value=$theme.params.frameItemDescription|default:""}

  {if $frameDescriptionAlign}
    {assign var="frameDescriptionAlign" value=$frameDescriptionAlign}
  {else}
    {assign var="frameDescriptionAlign" value=""}
  {/if}
  {if $frameDescriptionStyle}
    {assign var="frameDescriptionStyle" value=$frameDescriptionStyle}
  {else}
    {assign var="frameDescriptionStyle" value=""}
  {/if}

  {assign var="frameCopyright" value=$theme.params.frameCopyright|default:"frame"}

  {if $frameCopyrightStyle}
    {assign var="frameCopyrightStyle" value=$frameCopyrightStyle}
  {else}
    {assign var="frameCopyrightStyle" value="text-align:right"}
  {/if}
  {if $frameFreeText1}
    {assign var="frameFreeText1" value=$frameFreeText1}
  {else}
    {assign var="frameFreeText1" value=""}
  {/if}
  {if $frameFreeText1Style}
    {assign var="frameFreeText1Style" value=$frameFreeText1Style}
  {else}
    {assign var="frameFreeText1Style" value=""}
  {/if}
  {if $frameFreeText1pos}
    {assign var="frameFreeText1pos" value=$frameFreeText1pos}
  {else}
    {assign var="frameFreeText1pos" value=""}
  {/if}
  {if $frameFreeText2}
    {assign var="frameFreeText2" value=$frameFreeText2}
  {else}
    {assign var="frameFreeText2" value=""}
  {/if}
  {if $frameFreeText2Style}
    {assign var="frameFreeText2Style" value=$frameFreeText2Style}
  {else}
    {assign var="frameFreeText2Style" value=""}
  {/if}
  {if $frameFreeText2pos}
    {assign var="frameFreeText2pos" value=frameFreeText2pos}
  {else}
    {assign var="frameFreeText2pos" value=""}
  {/if}
{/if}


{if $theme.params.setiframe == 'base'}
  {if $frameColor}
    {assign var="frameColor" value=$frameColor}
  {else}
    {assign var="frameColor" value=""}
  {/if}
  {if $frameTheight}
    {assign var="frameTheight" value=$frameTheight}
  {else}
    {assign var="frameTheight" value=""}
  {/if}
  {if $frameLwidth}
    {assign var="frameLwidth" value=$frameLwidth}
  {else}
    {assign var="frameLwidth" value=""}
  {/if}
  {if $frameRwidth}
    {assign var="frameRwidth" value=$frameRwidth}
  {else}
    {assign var="frameRwidth" value=""}
  {/if}
  {if $frameBheight}
    {assign var="frameBheight" value=$frameBheight}
  {else}
    {assign var="frameBheight" value=""}
  {/if}
  {if $frameFont}
    {assign var="frameFont" value=$frameFont}
  {else}
    {assign var="frameFont" value=""}
  {/if}
  {if $frameFontColor}
    {assign var="frameFontColor" value=$frameFontColor}
  {else}
    {assign var="frameFontColor" value=""}
  {/if}
  {if $frameFontSize}
    {assign var="frameFontSize" value=$frameFontSize}
  {else}
    {assign var="frameFontSize" value=""}
  {/if}
  {if $framePP}
    {assign var="framePP" value=$framePP}
  {else}
    {assign var="framePP" value=""}
  {/if}
  {if $framePPColor}
    {assign var="framePPColor" value=$framePPColor}
  {else}
    {assign var="framePPColor" value=""}
  {/if}
  {if $framePPTheight}
    {assign var="framePPTheight" value=$framePPTheight}
  {else}
    {assign var="framePPTheight" value=""}
  {/if}
  {if $framePPLwidth}
    {assign var="framePPLwidth" value=$framePPLwidth}
  {else}
    {assign var="framePPLwidth" value=""}
  {/if}
  {if $framePPRwidth}
    {assign var="framePPRwidth" value=$framePPRwidth}
  {else}
    {assign var="framePPRwidth" value=""}
  {/if}
  {if $framePPBheight}
    {assign var="framePPBheight" value=$framePPBheight}
  {else}
    {assign var="framePPBheight" value=""}
  {/if}
  {if $framePPFont}}
    {assign var="framePPFont" value=$framePPFont}
  {else}
    {assign var="framePPFont" value=""}
  {/if}
  {if $framePPFontColor}
    {assign var="framePPFontColor" value=$framePPFontColor}
  {else}
    {assign var="framePPFontColor" value=""}
  {/if}
  {if $framePPFontSize}
    {assign var="framePPFontSize" value=$framePPFontSize}
  {else}
    {assign var="framePPFontSize" value=""}
  {/if}

  {assign var="frameParentTitle" value=$theme.params.frameParentTitle|default:""}

  {if $frameParentPS}
    {assign var="frameParentPS" value=$frameParentPS}
  {else}
    {assign var="frameParentPS" value=""}
  {/if}
  {if $frameFontParent}
    {assign var="frameFontParent" value=$frameFontParent}
  {else}
    {assign var="frameFontParent" value=""}
  {/if}
  {if $frameFontColorParent}
    {assign var="frameFontColorParent" value=$frameFontColorParent}
  {else}
    {assign var="frameFontColorParent" value=""}
  {/if}
  {if $framePPFontColorParent}
    {assign var="framePPFontColorParent" value=$framePPFontColorParent}
  {else}
    {assign var="framePPFontColorParent" value=""}
  {/if}
  {if $frameFontSizeParent}
    {assign var="frameFontSizeParent" value=$frameFontSizeParent}
  {else}
    {assign var="frameFontSizeParent" value=""}
  {/if}
  {if $frameFontSpacingParent}
    {assign var="frameFontSpacingParent" value=$frameFontSpacingParent}
  {else}
    {assign var="frameFontSpacingParent" value=""}
  {/if}
  {if $frameStyleParent}
    {assign var="frameStyleParent" value=$frameStyleParent}
  {else}
    {assign var="frameStyleParent" value=""}
  {/if}
  {if $frameParentAlign}
    {assign var="frameParentAlign" value=$frameParentAlign}
  {else}
    {assign var="frameParentAlign" value=""}
  {/if}

  {assign var="frameItemTitle" value=$theme.params.frameItemTitle|default:""}

  {if $frameTitlePS}
    {assign var="frameTitlePS" value=$frameTitlePS}
  {else}
    {assign var="frameTitlePS" value=""}
  {/if}
  {if $frameFontTitle}
    {assign var="frameFontTitle" value=$frameFontTitle}
  {else}
    {assign var="frameFontTitle" value=""}
  {/if}
  {if $frameFontColorTitle}
    {assign var="frameFontColorTitle" value=$frameFontColorTitle}
  {else}
    {assign var="frameFontColorTitle" value=""}
  {/if}
  {if $framePPFontColorTitle}
    {assign var="framePPFontColorTitle" value=$framePPFontColorTitle}
  {else}
    {assign var="framePPFontColorTitle" value=""}
  {/if}
  {if $frameFontSizeTitle}
    {assign var="frameFontSizeTitle" value=$frameFontSizeTitle}
  {else}
    {assign var="frameFontSizeTitle" value=""}
  {/if}
  {if $frameFontSpacingTitle}
    {assign var="frameFontSpacingTitle" value=$frameFontSpacingTitle}
  {else}
    {assign var="frameFontSpacingTitle" value=""}
  {/if}
  {if $frameStyleTitle}
    {assign var="frameStyleTitle" value=$frameStyleTitle}
  {else}
    {assign var="frameStyleTitle" value=""}
  {/if}
  {if $frameTitleAlign}
    {assign var="frameTitleAlign" value=$frameTitleAlign}
  {else}
    {assign var="frameTitleAlign" value=""}
  {/if}

  {assign var="frameItemDescription" value=$theme.params.frameItemDescription|default:""}

  {if $frameDescriptionAlign}
    {assign var="frameDescriptionAlign" value=$frameDescriptionAlign}
  {else}
    {assign var="frameDescriptionAlign" value=""}
  {/if}
  {if $frameDescriptionStyle}
    {assign var="frameDescriptionStyle" value=$frameDescriptionStyle}
  {else}
    {assign var="frameDescriptionStyle" value=""}
  {/if}

  {assign var="frameCopyright" value=$theme.params.frameCopyright|default:""}

  {if $frameCopyrightStyle}
    {assign var="frameCopyrightStyle" value=$frameCopyrightStyle}
  {else}
    {assign var="frameCopyrightStyle" value=""}
  {/if}
  {if $frameFreeText1}
    {assign var="frameFreeText1" value=$frameFreeText1}
  {else}
    {assign var="frameFreeText1" value=""}
  {/if}
  {if $frameFreeText1Style}
    {assign var="frameFreeText1Style" value=$frameFreeText1Style}
  {else}
    {assign var="frameFreeText1Style" value=""}
  {/if}
  {if $frameFreeText1pos}
    {assign var="frameFreeText1pos" value=$frameFreeText1pos}
  {else}
    {assign var="frameFreeText1pos" value=""}
  {/if}
  {if $frameFreeText2}
    {assign var="frameFreeText2" value=$frameFreeText2}
  {else}
    {assign var="frameFreeText2" value=""}
  {/if}
  {if $frameFreeText2Style}
    {assign var="frameFreeText2Style" value=$frameFreeText2Style}
  {else}
    {assign var="frameFreeText2Style" value=""}
  {/if}
  {if $frameFreeText2pos}
    {assign var="frameFreeText2pos" value=frameFreeText2pos}
  {else}
    {assign var="frameFreeText2pos" value=""}
  {/if}
{/if}

{if $interactiveframe || $framePP || !empty($theme.params.setiframe)}
     {g->theme include="iFrameRender.tpl"}
{/if}