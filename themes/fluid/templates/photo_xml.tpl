{*
 * $Revision: 525 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !empty($theme.imageViews)}
  {assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

{if !empty($theme.imageViews)}
	<imageViews>
	{foreach from=$theme.imageViews item=thisView}
		<iView>
			<id>{$thisView.id}</id>
			<width>{$thisView.width}</width>
			<height>{$thisView.height}</height>
			<isBroken>{$thisView.isBroken}</isBroken>
			<link><![CDATA[{g->url arg1="view=core.DownloadItem"
			 arg2="itemId=`$thisView.id`" arg3="serialNumber=`$thisView.serialNumber`"
			 htmlEntities=false forceFullUrl=true}]]></link>
		</iView>
	{/foreach}
	</imageViews>
	<itemLinks>
	{foreach from=$theme.itemLinks item=link}
		<link>
			<text><![CDATA[{$link.text}]]></text>
			<url><![CDATA[{g->url params=$link.params htmlEntities=false forceFullUrl=true}]]></url>
		</link>
	{/foreach}
	</itemLinks>

{/if}
