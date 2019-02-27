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
 *//**
 * Simplified/Minimalist Theme
 * @package Themes
 * @subpackage Simplified
 * @author Chris Schwerdt <muti@afterglo.ws>
 * @version $Revision: 961 $
 */
class SimplifiedTheme extends GalleryTheme {
	public function __construct() {
		global $gallery;

		$this->setId('simplified');
		$this->setName($gallery->i18n('Simplified'));
		$this->setDescription(
			$gallery->i18n(
				'Simple, uncluttered look'
			)
		);

		$this->setVersion('2.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredThemeApi(array(3, 0));

		$this->setStandardSettings(
			array(
				'rows'           => 3,
				'columns'        => 5,
				'showImageOwner' => 0,
				'showAlbumOwner' => 1,
				'colorpack'      => '',
				'dynamicLinks'   => 'browse',
				'sidebarBlocks'  => serialize(
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
				'albumBlocks'    => serialize(
					array(
						array('comment.ViewComments', array()),
					)
				),
				'photoBlocks'    => serialize(
					array(
						array('exif.ExifInfo', array()),
						array('getid3.Getid3Info', array()),
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

		$theme =& $template->getVariableByReference('theme');

		list($ret, $preferences) = GalleryCoreApi::fetchDerivativePreferencesForItem($item->getId());

		// Grab album thumbnail size
		// default to 120, if we find an album thumb size, this will get overridden
		$albumThumbnailSize = 120;

		foreach ($preferences as $preference) {
			if ($preference['derivativeType'] == DERIVATIVE_TYPE_IMAGE_THUMBNAIL) {
				preg_match(
					'/(?:thumbnail)\|(\d+)?/',
					$preference['derivativeOperations'],
					$matches
				);

				if (isset($matches[1])) {
					$albumThumbnailSize = $matches[1];
				}
			}
		}
		$theme['params']['albumThumbnailSize'] = $albumThumbnailSize;

		$childrenInRowCount = 0;
		$currentRow         = 1;
		$maxRowSizes        = array();

		foreach ($theme['children'] as $index => $childItem) {
			if (!isset($maxRowSizes[$currentRow])) {
				$maxRowSizes[$currentRow] = 0;
			}

			// Searching for largest thumbnail in row
			if (isset($childItem['thumbnail'])) {
				if ($childItem['thumbnail']['height'] > $maxRowSizes[$currentRow]) {
					$maxRowSizes[$currentRow] = $childItem['thumbnail']['height'];
				} else {
					$maxRowSizes[$currentRow] = $maxRowSizes[$currentRow];
				}
			}

			// Resize albums to -24 px to account for white border
			if ($childItem['canContainChildren'] && isset($childItem['thumbnail']['width'])) {
				if ($childItem['thumbnail']['width'] > $childItem['thumbnail']['height']) {
					$maxAlbumThumbSize = $childItem['thumbnail']['width'] - 24;
				} else {
					$maxAlbumThumbSize = $childItem['thumbnail']['height'] - 24;
				}
				$theme['children'][$index]['maxAlbumThumbSize'] = $maxAlbumThumbSize;
			}

			// if we are at end of row
			if (($childrenInRowCount + 1) == $theme['params']['columns']) {
				$childrenInRowCount = 0;
				$currentRow++;
			} else {
				$childrenInRowCount++;
			}
		}

		foreach ($maxRowSizes as $index => $rowSize) {
			// if we didn't find any thumbnails in row, use default album thumbnail size
			if ($rowSize == 0) {
				$maxRowSizes[$index] = $albumThumbnailSize;
			}
		}

		// if we have an empty album, fill in default album thumbnail size
		if (!isset($maxRowSizes[1])) {
			$maxRowSizes[1] = $albumThumbnailSize;
		}
		$theme['params']['maxRowSizes'] = $maxRowSizes;

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
		$ret       = $this->loadCommonTemplateData($template, $item, $params, $dataTypes);

		if ($ret) {
			return array($ret->wrap(__FILE__, __LINE__), null);
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
