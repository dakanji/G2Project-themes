<?php
/*
 * $RCSfile$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2006 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */
/**
 * @version $Revision: 527 $ $Date: 2006-03-28 08:45:22 -0800 (Tue, 28 Mar 2006) $
 * @package FluidTheme
 * @author Jeremy Despain <domainsquatter@gmail.com>
 */

/**
 * Fluid theme.  Note: based on a clone of Matrix Theme.
 *
 * @package FluidTheme
 * @subpackage Theme
 */
class FluidTheme extends GalleryTheme {
	/**
	 * Constructor
	 */
	public function __construct() {
		global $gallery;

		$this->setId('fluid');
		$this->setName($gallery->i18n('Fluid'));
		$this->setDescription(
			$gallery->i18n(
				'A Flash based Theme'
			)
		);

		$this->setVersion('1.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredThemeApi(array(3, 0));

		$this->setStandardSettings(
			array(
				'perPage'       => 12,
				'colorpack'     => '',
				'sidebarBlocks' => serialize(
					array(
						array(
							'search.SearchBlock',
							array(
								'showAdvancedLink' => true,
							),
						),
						array(
							'core.ItemLinks',
							array(
								'useDropdown' => false,
							),
						),
						array('core.PeerList', array()),
						array('imageblock.ImageBlock', array()),
					)
				),
				'albumBlocks'   => serialize(
					array(
						array('comment.ViewComments', array()),
					)
				),
				'photoBlocks'   => serialize(
					array(
						array('exif.ExifInfo', array()),
						array('comment.ViewComments', array()),
					)
				),
			)
		);
	}

	/**
	 * @see GalleryTheme::showAlbumPage
	 */
	public function showAlbumPage(&$template, $item, $params, $childIds) {
		$ret = $this->loadCommonTemplateData(
			$template,
			$item,
			$params,
			array(
				'owner',
				'viewCount',
				'childCount',
				'descendentCount',
				'parents',
				'peers',
				'systemLinks',
				'itemLinks',
				'itemSummaries',
				'permissions',
				'thumbnails',
				'pageNavigator',
				'jumpRange',
				'itemImageViews',
			),
			$childIds
		);

		if ($ret) {
			return array($ret->wrap(__FILE__, __LINE__), null);
		}

		// Add in our extra stuff
		$theme                   =& $template->getVariableByReference('theme');
		$theme['columnWidthPct'] = floor(100 / $params['perPage']);

		$showXml = GalleryUtilities::getRequestVariables('showxml');

		return array(null, $showXml == 'album' ? 'theme_xml.tpl' : 'theme_flash.tpl');
	}

	/**
	 * @see GalleryTheme::showPhotoPage
	 */
	public function showPhotoPage(&$template, $item, $params) {
		$ret = $this->loadCommonTemplateData(
			$template,
			$item,
			$params,
			array(
				'owner',
				'parents',
				'peers',
				'systemLinks',
				'itemLinks',
				'permissions',
				'itemLinksDetailed',
				'itemNavigator',
				'imageViews',
			)
		);

		if ($ret) {
			return array($ret->wrap(__FILE__, __LINE__), null);
		}

		$showXml = GalleryUtilities::getRequestVariables('showxml');

		return array(null, $showXml == 'album' ? 'theme_xml.tpl' : 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showModulePage
	 */
	public function showModulePage(&$template, $item, $params, $templateFile) {
		$ret = $this->loadCommonTemplateData(
			$template,
			$item,
			$params,
			array('parents', 'systemLinks')
		);

		if ($ret) {
			return array($ret->wrap(__FILE__, __LINE__), null);
		}

		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showAdminPage
	 */
	public function showAdminPage(&$template, $item, $params, $templateFile) {
		$ret = $this->loadCommonTemplateData(
			$template,
			$item,
			$params,
			array('parents', 'systemLinks')
		);

		if ($ret) {
			return array($ret->wrap(__FILE__, __LINE__), null);
		}

		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showErrorPage
	 */
	public function showErrorPage(&$template) {
		return array(null, 'error.tpl');
	}

	/**
	 * @see GalleryTheme::showProgressBarPage
	 */
	public function showProgressBarPage(&$template, $item, $params) {
		$ret = $this->loadCommonTemplateData(
			$template,
			$item,
			$params,
			array('parents', 'systemLinks')
		);

		if ($ret) {
			return array($ret->wrap(__FILE__, __LINE__), null);
		}

		return array(null, 'theme.tpl');
	}
}
