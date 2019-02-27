<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2008 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
 *//**
 * Standard gallery theme
 * @package Themes
 * @subpackage ShadowMatrix
 * @author Bharat Mediratta <bharat@menalto.com>
 * @author Wayne Patterson <suprsidr@flashyourweb.com>
 * @version $Revision: 18172 $
 */
class ShadowMatrixTheme extends GalleryTheme {
	public function __construct() {
		global $gallery;

		$this->setId('shadowmatrix');
		$this->setName($gallery->i18n('ShadowMatrix'));
		$this->setDescription(
			$gallery->i18n(
				'Matrix Theme with Shadowbox'
			)
		);

		$this->setVersion('2.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredThemeApi(array(3, 0));

		$this->setStandardSettings(
			array(
				'rows'            => 3,
				'columns'         => 3,
				'showImageOwner'  => 0,
				'showAlbumOwner'  => 1,
				'albumFrame'      => '',
				'itemFrame'       => '',
				'photoFrame'      => '',
				'colorpack'       => '',
				'showMicroThumbs' => 0,
				'dynamicLinks'    => 'browse',
				'sidebarBlocks'   => serialize(
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
				'albumBlocks'     => serialize(array(array('comment.ViewComments', array()))),
				'photoBlocks'     => serialize(
					array(
						array(
							'exif.ExifInfo',
							array(),
						),
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
		$ret = $this->loadCommonTemplateData($template, $item, $params, array('owner', 'viewCount', 'childCount', 'descendentCount', 'parents', 'systemLinks', 'itemLinks', 'itemSummaries', 'permissions', 'thumbnails', 'pageNavigator', 'jumpRange'), $childIds);

		if ($ret) {
			return array($ret, null);
		}


		// Add in our extra stuff
		$theme                   = &$template->getVariableByReference('theme');
		$theme['columnWidthPct'] = floor(100 / $params['columns']);


		// Add resizeId for shadowbox urls
		$i = 0;

		foreach ($theme['children'] as $child) {
			if ($child['entityType'] == 'GalleryPhotoItem') {
				list($ret, $id) = $this->getBestImageId($child['id']);

				if ($ret) {
					return array($ret, null);
				}
				$theme['children'][$i]['resizeId'] = $id;
			} else {
				$theme['children'][$i]['resizeId'] = $child['id'];
			}
			$i++;
		}

		if ($item->getEntityType() != 'GalleryDynamicAlbum') {
			list($ret, $allIds) = GalleryCoreApi::fetchChildItemIds($item);

			if ($ret) {
				return array($ret, null);
			}
		}

		if (empty($allIds) && !empty($theme['allChildIds'])) {
			$allIds = $theme['allChildIds'];
		}

		if (!empty($allIds)) {
			list($ret, $allChildren) = GalleryCoreApi::loadEntitiesById($allIds);

			if ($ret) {
				return array($ret, null);
			}
			$tmp = array();
			$i   = 0;

			foreach ($allChildren as $item) {
				$itemId = $item->getId();

				if (in_array($itemId, $childIds)) {
					foreach ($theme['children'] as $child) {
						if ($itemId == $child['id']) {
							$tmp[$i] = $child;
						}
					}
				} else {
					list($ret, $id) = $this->getBestImageId($itemId);

					if ($ret) {
						return array($ret, null);
					}
					$tmp[$i]['id']          = $itemId;
					$tmp[$i]['resizeId']    = $id;
					$tmp[$i]['entityType']  = $item->getEntityType();
					$tmp[$i]['title']       = $item->getTitle();
					$tmp[$i]['summary']     = $item->getSummary();
					$tmp[$i]['description'] = $item->getDescription();
				}
				$i++;
			}
			$theme['item']['childIds'] = $childIds;
			$theme['children']         = $tmp;
		}


		// Add our header and styles
		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showPhotoPage
	 */
	public function showPhotoPage(&$template, $item, $params) {
		$dataTypes = array('owner', 'parents', 'systemLinks', 'itemLinks', 'permissions', 'itemLinksDetailed', 'itemNavigator', 'imageViews');

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
		$ret = $this->loadCommonTemplateData($template, $item, $params, array('parents', 'systemLinks'));

		if ($ret) {
			return array($ret, null);
		}

		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showAdminPage
	 */
	public function showAdminPage(&$template, $item, $params, $templateFile) {
		$ret = $this->loadCommonTemplateData($template, $item, $params, array('parents', 'systemLinks'));

		if ($ret) {
			return array($ret, null);
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
		$ret = $this->loadCommonTemplateData($template, $item, $params, array('parents', 'systemLinks'));

		if ($ret) {
			return array($ret, null);
		}

		return array(null, 'theme.tpl');
	}

	public function getBestImageId($masterId) {
		global $gallery;

		$maxImageHeight = $maxImageWidth = 600;

		$potentialImages = array();

		//how about the original?
		$ret = GalleryCoreApi::assertHasItemPermission($masterId, 'core.viewSource');

		if (!$ret) {
			//is there a preferred derivative of the original?
			list($ret, $preferred) = GalleryCoreApi::fetchPreferredsByItemIds(array($masterId));

			if ($ret) {
				return array($ret, null);
			}

			if (!empty($preferred[$masterId])) {
				$potentialImages[] = $preferred[$masterId];
			} else {
				//if no preferred, use the original original
				list($ret, $item) = GalleryCoreApi::loadEntitiesById($masterId);

				if ($ret) {
					return array($ret, null);
				}

				if ($item->getEntityType() != 'GalleryPhotoItem') {
					return array(null, $masterId);
				}
				$potentialImages[] = $item;
			}
		}
		// If the user can see resized versions consider those too
		$ret = GalleryCoreApi::assertHasItemPermission($masterId, 'core.viewResizes');

		if (!$ret) {
			list($ret, $resizes) = GalleryCoreApi::fetchResizesByItemIds(array($masterId));

			if ($ret) {
				return array($ret, null);
			}

			if (!empty($resizes)) {
				foreach ($resizes[$masterId] as $resize) {
					$potentialImages[] = $resize;
				}
			}
		}
		//can always use the thumbnail
		list($ret, $thumbs) = GalleryCoreApi::fetchThumbnailsByItemIds(array($masterId));

		if ($ret) {
			return array($ret, null);
		}
		$potentialImages[] = $thumbs[$masterId];

		usort($potentialImages, array($this, 'bySize'));
		//print_r($potentialImages);exit;

		// find the closest match
		$closest   = $potentialImages[0];
		$requested = $maxImageHeight * $maxImageWidth;
		$delta     = ($potentialImages[0]->height * $potentialImages[0]->width) - $requested;

		if ($delta < 0) {
			$delta *= -1;
		}

		foreach ($potentialImages as $potentialImage) {
			$current = $potentialImage->height * $potentialImage->width - $requested;

			if ($current < 0) {
				$current *= -1;
			}

			if ($current < $delta) {
				$delta   = $current;
				$closest = $potentialImage;
			}
		}

		return array(null, $closest->getId());
	}

	public function bySize($a, $b) {
		if (($a->width * $a->height) == ($b->width * $b->height)) {
			return 0;
		}

		return ($a->width * $a->height) < ($b->width * $b->height) ? - 1 : 1;
	}
}
