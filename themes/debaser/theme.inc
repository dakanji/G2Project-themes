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
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

/**
 * This theme is originally based upon Matrix.
 *
 * @package Themes
 * @subpackage Debaser
 * @author Chris Smith <chris@jacko.com>
 * @version $Revision: 908 $
 */
class DebaserTheme extends GalleryTheme {
	/**
	 * Constructor
	 */
	public function __construct() {
		global $gallery;

		$this->setId('debaser');
		$this->setName($gallery->i18n('Debaser'));
		$this->setDescription(
			$gallery->i18n(
				'Something different, something lower'
			)
		);

		$this->setVersion('1.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredThemeApi(array(3, 0));

		$this->setStandardSettings(
			array(
				'rows'                => 3,
				'columns'             => 3,
				'showImageOwner'      => 0,
				'showAlbumOwner'      => 1,
				'albumFrame'          => '',
				'itemFrame'           => '',
				'photoFrame'          => '',
				'colorpack'           => 'debaser_light',
				'showMicroThumbs'     => 0,
				'sidebarBlocks'       => serialize(
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
						array(
							'imageblock.ImageBlock',
							array(),
						),
					)
				),
				'albumBlocks'         => serialize(
					array(
						array(
							'comment.ViewComments',
							array(),
						),
					)
				),
				'photoBlocks'         => serialize(
					array(
						array(
							'comment.ViewComments',
							array(),
						),
					)
				),
				'showThumbTitles'     => 0,
				'specialEffects'      => 1,
				'roundedCorners'      => 1,
				'htmlHeaderBlock'     => null,
				'htmlFooterBlock'     => null,
				'backgroundImage'     => null,
				'backgroundItemImage' => null,
			)
		);
	}

	public function loadTemplate($view, &$template, $item, $params, $viewResults) {
		/* The only reason i'm overriding this is to decode these elements before
		 * they get rendered. I'm sure this is bad, but it gets the job done right now.
		 */
		$params['htmlHeaderBlock']     = html_entity_decode($params['htmlHeaderBlock']);
		$params['htmlFooterBlock']     = html_entity_decode($params['htmlFooterBlock']);
		$params['backgroundImage']     = html_entity_decode($params['backgroundImage']);
		$params['backgroundItemImage'] = html_entity_decode($params['backgroundItemImage']);

		list($ret, $result) = parent::loadTemplate(
			$view,
			$template,
			$item,
			$params,
			$viewResults
		);

		return array($ret, $result);
	}

	/**
	 * @see GalleryLayout::getSettings()
	 */
	public function getSettings($itemId = null) {
		list($ret, $settings, $params) = parent::getSettings($itemId);

		if ($ret) {
			return array($ret, null);
		}

		list($ret, $params) = $this->fetchParameters($itemId);

		if ($ret) {
			return array($ret, null);
		}

		// Add in our custom settings
		$params = array_merge(
			array(
				'showThumbTitles'     => 0,
				'specialEffects'      => 1,
				'roundedCorners'      => 1,
				'htmlHeaderBlock'     => null,
				'htmlFooterBlock'     => null,
				'backgroundImage'     => null,
				'backgroundItemImage' => null,
			),
			$params
		);

		$settings[] = array(
			'key'   => 'showThumbTitles',
			'name'  => $this->translate(
				'Show Item Titles with Thumbnails'
			),
			'type'  => 'checkbox',
			'value' => $params['showThumbTitles'],
		);

		$settings[] = array(
			'key'   => 'specialEffects',
			'name'  => $this->translate(
				'Special Effects (Do Fade-in and sliding)'
			),
			'type'  => 'checkbox',
			'value' => $params['specialEffects'],
		);

		$settings[] = array(
			'key'   => 'roundedCorners',
			'name'  => $this->translate(
				'Rounded Corners (of item frames and page elements)'
			),
			'type'  => 'checkbox',
			'value' => $params['roundedCorners'],
		);

		$settings[] = array(
			'key'   => 'htmlHeaderBlock',
			'name'  => $this->translate(
				'Header Content (HTML. If blank, the default will be used)'
			),
			'type'  => 'textarea',
			'value' => $params['htmlHeaderBlock'],
		);

		$settings[] = array(
			'key'   => 'htmlFooterBlock',
			'name'  => $this->translate(
				'Footer Content (HTML. If blank, the default will be used)'
			),
			'type'  => 'textarea',
			'value' => $params['htmlFooterBlock'],
		);

		$settings[] = array(
			'key'        => 'backgroundImage',
			'name'       => $this->translate(
				'Page Background Image (full URL)'
			),
			'type'       => 'text-field',
			'typeParams' => array(
				'size' => 40,
			),
			'value'      => $params['backgroundImage'],
		);

		$settings[] = array(
			'key'        => 'backgroundItemImage',
			'name'       => $this->translate(
				'Item Frame Background Image (full URL)'
			),
			'type'       => 'text-field',
			'typeParams' => array(
				'size' => 40,
			),
			'value'      => $params['backgroundItemImage'],
		);

		return array(null, $settings);
	}

	/**
	 * @see GalleryTheme::showAlbumPage
	 */
	public function showAlbumPage(&$template, $item, $params, $childIds) {
		$params['pageWindowSize'] = 3;
		$ret                      = $this->loadCommonTemplateData(
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
				'itemDetailFiles',
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
			'peers',
			'systemLinks',
			'itemLinks',
			'permissions',
			'itemLinksDetailed',
			'itemDetailFiles',
			'itemNavigator',
			'imageViews',
		);

		if (!empty($params['showMicroThumbs'])) {
			$dataTypes[] = 'peerThumbnails';
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
}
