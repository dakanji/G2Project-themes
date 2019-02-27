<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2007 Bharat Mediratta
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
 *
 * Originally derived from the Matrix Theme with pieces taken from the Siriux Theme
 * Modified for NZ Digital Images Theme
 * Gallery 2.2 - NZDI Theme
 */

/**
 * NZ Digitial Images Gallery Theme
 * @package Themes
 * @subpackage NZDI
 * @author John Phillips <info@nzwhost.com>
 * @version $Revision: 1091 $
 */
class NZDITheme extends GalleryTheme {
	/**
	 * Constructor
	 */
	public function __construct() {
		global $gallery;

		$this->setId('nzdi');
		$this->setName($gallery->i18n('NZDI'));
		$this->setDescription(
			$gallery->i18n(
				'NZ Digital Images theme'
			)
		);

		$this->setVersion('2.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredThemeApi(array(3, 0));

		$this->setStandardSettings(
			array(
				'rows'               => 3,
				'columns'            => 3,
				'showImageOwner'     => 0,
				'showAlbumOwner'     => 0,
				'showSummaries'      => 0,
				'colorpack'          => '',
				// 'showMicroThumbs' => 0,
				'enableImageMap'     => 1,
				'fullsizepopup'      => 1,
				'LatestImagesAlbum'  => 1,
				'GalleryBreadcrumbs' => 0,
				'ItemViewCount'      => 1,
				'maxThumbnails'      => 8,
				'sizeThumbnails'     => 65,
				'showCorePager'      => 0,
				'showFooter'         => 1,
				'nzdiFooter'         => '',
				'sidebarBlocks'      => serialize(
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
				'albumBlocks'        => serialize(
					array(
						array('comment.ViewComments', array()),
					)
				),
				'photoBlocks'        => serialize(
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
				'systemLinks',
				'itemLinks',
				'itemSummaries',
				'permissions',
				'thumbnails',
				'pageNavigator',
				'jumpRange',
			),
			$childIds
		);

		if ($ret) {
			return array($ret, null);
		}

		// Add in our extra stuff
		$theme                   =& $template->getVariableByReference('theme');
		$theme['columnWidthPct'] = floor(100 / $params['columns']);

		// Add our header and styles
		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showPhotoPage
	 */
	public function showPhotoPage(&$template, $item, $params) {
		$dataTypes = array(
			'owner',
			'parents',
			'systemLinks',
			'itemLinks',
			'permissions',
			'itemLinksDetailed',
			'itemNavigator',
			'imageViews',
		);

		if (!empty($params['showMicroThumbs'])) {
			$dataTypes[] = 'navThumbnails';
		}
		$ret = $this->loadCommonTemplateData($template, $item, $params, $dataTypes);

		if ($ret) {
			return array($ret, null);
		}

		return array(null, 'theme.tpl');
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
			return array($ret, null);
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
			return array($ret, null);
		}

		// Add in our extra stuff
		$theme                  =& $template->getVariableByReference('theme');
		$theme['adminTemplate'] = $templateFile;

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
			return array($ret, null);
		}

		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::getSettings()
	 */
	public function getSettings($itemId = null) {
		list($ret, $settings, $params) = parent::getSettings($itemId);

		if ($ret) {
			return array($ret, null);
		}

		// Add in our custom settings
		$settings[] = array(
			'key'   => 'GalleryBreadcrumbs',
			'name'  => $this->translate('Show gallery breadcrumbs'),
			'type'  => 'checkbox',
			'value' => $params['GalleryBreadcrumbs'],
		);
		$settings[] = array(
			'key'   => 'enableImageMap',
			'name'  => $this->translate('Prev/Next on image hover'),
			'type'  => 'checkbox',
			'value' => $params['enableImageMap'],
		);
		$settings[] = array(
			'key'   => 'fullsizepopup',
			'name'  => $this->translate('Full size image in popup window'),
			'type'  => 'checkbox',
			'value' => $params['fullsizepopup'],
		);
		$settings[] = array(
			'key'   => 'LatestImagesAlbum',
			'name'  => $this->translate('Show thumbnail preview on photo pages'),
			'type'  => 'checkbox',
			'value' => $params['LatestImagesAlbum'],
		);
		$settings[] = array(
			'key'        => 'maxThumbnails',
			'name'       => $this->translate('Maximum number of thumbnails to show'),
			'type'       => 'text-field',
			'typeParams' => array(
				'size' => 2,
			),
			'value'      => $params['maxThumbnails'],
		);
		$settings[] = array(
			'key'        => 'sizeThumbnails',
			'name'       => $this->translate('Size of thumbnails in pixels'),
			'type'       => 'text-field',
			'typeParams' => array(
				'size' => 2,
			),
			'value'      => $params['sizeThumbnails'],
		);
		$settings[] = array(
			'key'   => 'showSummaries',
			'name'  => $this->translate('Show summary data with thumbnails'),
			'type'  => 'checkbox',
			'value' => $params['showSummaries'],
		);
		$settings[] = array(
			'key'   => 'ItemViewCount',
			'name'  => $this->translate('Show item view count'),
			'type'  => 'checkbox',
			'value' => $params['ItemViewCount'],
		);
		$settings[] = array(
			'key'   => 'showCorePager',
			'name'  => $this->translate('Show pager links on album pages'),
			'type'  => 'checkbox',
			'value' => $params['showCorePager'],
		);
		$settings[] = array(
			'key'   => 'showFooter',
			'name'  => $this->translate('Support gallery - Show gallery footer'),
			'type'  => 'checkbox',
			'value' => $params['showFooter'],
		);
		$settings[] = array(
			'key'        => 'nzdiFooter',
			'name'       => $this->translate('Custom footer below gallery'),
			'type'       => 'text-field',
			'typeParams' => array(
				'size' => 40,
			),
			'value'      => $params['nzdiFooter'],
		);

		return array(null, $settings);
	}
}
