{*
 * $Revision: 1546 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
*}
<table border="0" style="width:99%">
  <tr>
    <td style="text-align:left; width:80px" nowrap="nowrap">
      <table border="0" class="tableacpic" align="left">
        <tr>
          <td nowrap="nowrap">
          {strip}
            {if isset($theme.navigator.first)}
              <a href="{g->url params=$theme.navigator.first.urlParams}" title="{g->text text='First'}" 
				class="icon tLink-first" 
				style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='First'}" title="{g->text text='First'}"/>
	      </a>
            {/if}
            {if isset($theme.navigator.back)}
              <a href="{g->url params=$theme.navigator.back.urlParams}" title="{g->text text='Previous'}" 
				class="icon tLink-back" 
				style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Previous'}" title="{g->text text='Previous'}"/>
 	      </a>
            {/if}
          {/strip}
          </td>
        </tr>
      </table>
    </td>
    <td style="text-align:center" nowrap="nowrap">

        {if !empty($theme.jumpRange)}
        <div id="gsPages" class="gbBlock gcBackground1" nowrap="nowrap">
          {g->block type="core.Pager"}
        </div>
        {/if}

    </td>
    <td style="text-align:right; width: 80px" nowrap="nowrap">
      <table border="0" class="tableacpic" align="right">
        <tr>
          <td nowrap="nowrap">
          {strip}
            {if isset($theme.navigator.next)}
              <a href="{g->url params=$theme.navigator.next.urlParams}" title="{g->text text='Next'}" 
				class="icon tLink-next" 
				style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Next'}" title="{g->text text='Next'}"/>

	      </a>
            {/if}
            {if isset($theme.navigator.last)}
              <a href="{g->url params=$theme.navigator.last.urlParams}" title="{g->text text='Last'}" 
				class="icon tLink-last" 
				style="padding-bottom: 2px; padding-top: 2px;">
		  <img src="{$imageURL_base}blank.gif" alt="{g->text text='Last'}" title="{g->text text='Last'}"/>

	      </a>
            {/if}
          {/strip}
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>