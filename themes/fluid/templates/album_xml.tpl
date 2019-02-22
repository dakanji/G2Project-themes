{*
 * $Revision: 525 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{"<?xml version='1.0' encoding='ISO-8859-1' standalone='no'?>"}

<album>
	<title><![CDATA[{$theme.item.title}]]></title>
	<summary><![CDATA[{$theme.item.summary}]]></summary>
	<description><![CDATA[{$theme.item.description}]]></description>
	<currentPage>{$theme.currentPage}</currentPage>
	<pages>
		{foreach from=$theme.jumpRange item=page}
			<page>
				<order>{$page}</order>
				<url><![CDATA[{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`" arg3="page=`$page`" htmlEntities=false forceFullUrl=true}]]></url>
			</page>
		{/foreach}
	</pages>
	<systemLinks>
		{foreach from=$theme.systemLinks item=link}
			<link>
				<text><![CDATA[{$link.text}]]></text>
				<url><![CDATA[{g->url params=$link.params htmlEntities=false forceFullUrl=true}]]></url>
			</link>
		{/foreach}
	</systemLinks>
	<albumLinks>
		{foreach from=$theme.itemLinks item=link}
			<link>
				<text><![CDATA[{$link.text}]]></text>
				<url><![CDATA[{g->url params=$link.params htmlEntities=false forceFullUrl=true}]]></url>
			</link>
		{/foreach}
	</albumLinks>
	<addDataItem><![CDATA[
		{if isset($theme.permission.core_addDataItem)}
		addDataItem is Yes
		{else}
		addDataItem is No
		{/if}
	]]></addDataItem>
	

	<parents>
	{foreach from=$theme.parents item=parent}
		<parent>
			<title><![CDATA[{$parent.title}]]></title>
			<summary><![CDATA[{$parent.summary}]]></summary>
			<description><![CDATA[{$parent.description}]]></description>
			<thumbnail><![CDATA[{g->url arg1="view=core.DownloadItem" arg2="itemId=`$parent.thumbnail.id`" arg3="serialNumber=$parent.thumbnail.serialNumber`" htmlEntities=false forceFullUrl=true}]]></thumbnail>
			<picture><![CDATA[{g->url arg1="view=core.DownloadItem" arg2="itemId=`$parent.id`" arg3="serialNumber=`$parent.serialNumber`" htmlEntities=false forceFullUrl=true}]]></picture>
			<galleryLink><![CDATA[{g->url arg1="view=core.ShowItem" arg2="itemId=`$parent.id`" arg3="serialNumber=`$parent.serialNumber`" htmlEntities=false forceFullUrl=true}]]></galleryLink>
		</parent>
	{/foreach}
	</parents>

	<childrenCount><![CDATA[
		{if !count($theme.children)}
			No Children
		{else}
			Yes Children figure out how to count
		{/if}
	]]></childrenCount>
	
	{*start each album*}
	{if count($theme.children)}
		<albumChildren>
		{foreach from=$theme.children item=child}
			<albumChild>
				<title><![CDATA[{$child.title}]]></title>
				<summary><![CDATA[{$child.summary}]]></summary>
				<description><![CDATA[{$child.description}]]></description>
				<isAlbum>{$child.canContainChildren}</isAlbum>
				<childMime><![CDATA[{$child.mimeType}]]></childMime>
				<childTheme><![CDATA[{$child.theme}]]></childTheme>
				<columnWidth>{$theme.columnWidthPct}</columnWidth>
				<thumbnail><![CDATA[{g->url arg1="view=core.DownloadItem" arg2="itemId=`$child.thumbnail.id`" arg3="serialNumber=`$child.thumbnail.serialNumber`" htmlEntities=false forceFullUrl=true}]]></thumbnail>
				<thumbMime><![CDATA[{$child.thumbnail.mimeType}]]></thumbMime>
				<picture><![CDATA[{g->url arg1="view=core.DownloadItem" arg2="itemId=`$child.id`" arg3="serialNumber=`$child.serialNumber`" htmlEntities=false forceFullUrl=true}]]></picture>
				<galleryLink><![CDATA[{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`" arg3="serialNumber=`$child.serialNumber`" htmlEntities=false forceFullUrl=true}]]></galleryLink>
			 	{*<itemLinks>{g->block type="core.ItemLinks" item=$child links=$child.itemLinks}</itenLinks>*}
				<itemLinks>
					{foreach from=$child.itemLinks item=link}
						<link>
							<text><![CDATA[{$link.text}]]></text>
							<url><![CDATA[{g->url params=$link.params htmlEntities=false forceFullUrl=true}]]></url>
						</link>
					{/foreach}
				</itemLinks>

			</albumChild>
		{/foreach}
		</albumChildren>
	{/if}

</album>

