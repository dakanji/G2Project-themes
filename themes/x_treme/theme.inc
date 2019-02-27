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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
 *//**
 * PedroGilberto.net gallery theme
 * @package Themes
 * @subpackage x_treme
 * @author Pedro Gilberto <x_treme@pedrogilberto.net>
 * @version $Revision: 1546 $
 */
class x_tremeTheme extends GalleryTheme {
	public function __construct() {
		global $gallery;

		$this->setId('x_treme');
		$this->setName($gallery->i18n('X_treme'));
		$this->setDescription(
			$gallery->i18n(
				'X-Treme Theme for Gallery2 by PedroGilberto.net'
			)
		);

		$this->setVersion('2.0.0');
		$this->setRequiredCoreApi(array(8, 0));
		$this->setRequiredThemeApi(array(3, 0));

		$this->setStandardSettings(
			array(
				'rows'                    => 4,
				'columns'                 => 4,
				'colorpack'               => '',
				'showMicroThumbs'         => 1,
				'sidebarBlocks'           => serialize(
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
				'albumBlocks'             => serialize(
					array(
						array('comment.ViewComments', array()),
					)
				),
				'photoBlocks'             => serialize(
					array(
						array('exif.ExifInfo', array()),
						array('comment.ViewComments', array()),
					)
				),
				'albumSideBlocks'         => serialize(array()),
				'photoSideBlocks'         => serialize(array()),
				'dynamicLinks'            => 'browse',
				'showGalleryOwner'        => 0,
				'showImageOwner'          => 0,
				'showAlbumOwner'          => 1,
				'showItemsOwner'          => 0,
				'pngfix'                  => '',
				'site'                    => '',
				'iestatus'                => 1,
				'logo'                    => 'left',
				'logoout'                 => 'logo.png',
				'logoon'                  => 'logo_hover.png',
				'logoWidth'               => 175,
				'logoHeight'              => 50,
				'bannerTop'               => '',
				'bannerTopurl'            => 'banner_top.tpl',
				'bannerFooter'            => '',
				'bannerFooterurl'         => 'banner_footer.tpl',
				'sidebar'                 => 'floating',
				'BreadCrumb'              => 0,
				'separator'               => '|',
				'link1'                   => '',
				'link1url'                => '',
				'link2'                   => '',
				'link2url'                => '',
				'link3'                   => '',
				'link3url'                => '',
				'externallinks'           => '',
				'BlocksAlign'             => '',
				'BlocksInAlign'           => '',
				'CartSelect'              => 'both',
				'RightClick'              => 'sidebarrc',
				'topNavPics'              => 'right',
				'icons'                   => 'none',

				'NavAlbum'                => 'bottom',
				'enterAlbumDirect'        => 'none',
				'enterAlbumTopNav'        => '',

				'Gcolumns'                => 4,
				'GTitle'                  => '',
				'GDescription'            => '',
				'GDate'                   => '',
				'GSize'                   => '',
				'GViewCount'              => '',
				'GRating'                 => '',
				'GInfo'                   => 'top',
				'GBlocksSide'             => '',
				'GAddCart'                => '',
				'GViewCart'               => '',
				'GAddComment'             => 'none',
				'GComments'               => '',
				'GStaticComments'         => '',
				'GBlocksBtn'              => '',

				'showInfoMsg'             => '1stleftG',
				'InfoMsgurl'              => '',
				'InfoMsgLink1'            => '',
				'InfoMsgLink1url'         => '',
				'InfoMsgLink2'            => '',
				'InfoMsgLink2url'         => '',
				'authorEmail'             => 'left',

				'ATitle'                  => 'topL',
				'ADescription'            => 'topL',
				'ADate'                   => '',
				'ASize'                   => '',
				'AViewCount'              => '',
				'ARating'                 => '',
				'AInfo'                   => 'top',
				'AAddCart'                => 1,
				'AViewCart'               => 1,
				'AAddComment'             => 'floating',
				'AComments'               => 1,
				'AStaticComments'         => '',
				'ABlocksBtn'              => 1,

				'opacityT'                => 1,
				'opacityTover'            => '0.6',
				'Tborder'                 => '',
				'TborderColor'            => '#000',
				'TspaceH'                 => '',
				'TspaceV'                 => '',
				'Iinfo'                   => 1,
				'IinfoLink'               => 1,
				'ITitle'                  => 'both',
				'IDesc'                   => '',
				'ISum'                    => 'albums',
				'IDate'                   => '',
				'ISize'                   => 'albums',
				'IViewCount'              => 'photos',
				'ISummaries'              => 'both',
				'IRating'                 => '',
				'IViewCart'               => '',
				'AddComment'              => '',
				'IComments'               => '',
				'IExif'                   => '',
				'IeCard'                  => '',
				'IAddComment'             => 0,

				'SIborder'                => 1,
				'SIborderColor'           => '#000',
				'NavPhoto'                => 'bottom',
				'NavPop'                  => 'show',
				'NavOver'                 => 'top',
				'NavOverPop'              => 'even',
				'NavOverLink'             => 'thumb',
				'NavPicWidth'             => 100,
				'NavLinkMargin'           => 6,
				'NavLinkBackground'       => '#fff',
				'NavLinkBorder'           => 1,
				'NavLinkBorderColor'      => '',
				'NavLinkBorderColorHover' => '',
				'PTitle'                  => 'topL',
				'PDescription'            => 'rightB',
				'PDate'                   => '',
				'PViewCount'              => '',
				'InfoSize'                => 'show',
				'PopSize'                 => 'even',

				'PInfo'                   => 'rightB',
				'PRating'                 => 'rightB',
				'PAddCart'                => 'topNav',
				'PViewCart'               => 'topNav',
				'PActionsPos'             => 'topNav',
				'PAddComment'             => 'floating',
				'PComments'               => 1,
				'PSaticComments'          => '',
				'PExif'                   => 1,
				'PeCard'                  => 1,
				'PBlocksBtn'              => 1,
				'imageFadin'              => '',

				'MTposition'              => 'right',
				'columnsMT'               => 4,
				'peerWindowSize'          => 20,
				'MTends'                  => '',
				'sizeMT'                  => 70,
				'opacityMT'               => '0.5',
				'opacityMTover'           => 1,
				'MTborder'                => 1,
				'MTborderColor'           => '',
				'MTpadding'               => 0,
				'MTmargin'                => 4,
				'MTnavigator'             => 'FPpPL',
				'MTpageinfo'              => '',
				'MTinfo'                  => '',

				'Showslideshow'           => 1,
				'ss'                      => 1,
				'ssTitle'                 => 1,
				'ssSummary'               => 1,
				'ssDescription'           => 1,
				'ssDate'                  => 1,
				'ssMoreInfo'              => 'show',
				'ssBack'                  => 1,
				'ssNext'                  => 1,
				'ssMoreOptions'           => '',
				'ssDelay'                 => 10,
				'ssDirection'             => 0,
				'ssSize'                  => 2,

				'g2btn'                   => 1,
				'x_btn'                   => 1,
				'x_cpbtn'                 => 1,
				'copyright'               => 1,
				'copyrightName'           => '',
				'copyrightDate'           => 1,
				'copyrightDateText'       => '2007',
				'showCopyrightEmail'      => '',
				'copyrightEmail'          => '',

				'bgcolor'                 => '',
				'bg'                      => '',
				'bg1color'                => '',
				'bg1'                     => '',
				'border1color'            => '',
				'border1size'             => '',
				'bg2color'                => '',
				'bg2'                     => '',
				'border2color'            => '',
				'border2size'             => '',
				'Gfontfamily'             => '',
				'Gfontsize'               => '',
				'Gfontcolor'              => '',
				'linkcolor'               => '',
				'linkhovercolor'          => '',
				'linkactivecolor'         => '',
				'BreadCrumbfontsize'      => '1.0em',
				'SystemLinksfontsize'     => '1.0em',
				'GTfontfamily'            => '',
				'GTfontsize'              => '',
				'GTfontcolor'             => '',
				'GIfontsize'              => '',
				'GIfontcolor'             => '',
				'GNcolor'                 => '',

				'interactiveframe'        => '',
				'setiframe'               => '',
				'frameColor'              => '',
				'frameTheight'            => 30,
				'frameLwidth'             => '',
				'frameRwidth'             => '',
				'frameBheight'            => '',
				'bgIframe'                => '',
				'frameFont'               => '',
				'frameFontColor'          => '',
				'frameFontSize'           => '10px',
				'framePP'                 => '',
				'framePPColor'            => '',
				'framePPTheight'          => 30,
				'framePPLwidth'           => '',
				'framePPRwidth'           => '',
				'framePPBheight'          => '',
				'bgPP'                    => '',
				'framePPFont'             => '',
				'framePPFontColor'        => '',
				'framePPFontSize'         => '10px',
				'frameParentTitle'        => 'top',
				'frameParentPS'           => '',
				'frameFontParent'         => '',
				'frameFontColorParent'    => '#888',
				'frameFontSizeParent'     => '1.3em',
				'frameFontSpacingParent'  => '0.5em',
				'frameParentAlign'        => 'center',
				'frameStyleParent'        => '',
				'frameItemTitle'          => 'bottom',
				'frameTitlePS'            => '',
				'frameFontTitle'          => '',
				'frameFontColorTitle'     => '#888',
				'frameFontSizeTitle'      => '1.1em',
				'frameFontSpacingTitle'   => '0.5em',
				'frameTitleAlign'         => 'center',
				'frameStyleTitle'         => '',
				'frameItemDescription'    => 'bottom',
				'frameDescriptionAlign'   => '',
				'frameDescriptionStyle'   => '',
				'frameCopyright'          => 'frame',
				'frameCopyrightStyle'     => '',
				'frameFreeText1'          => '',
				'frameFreeText1Style'     => '',
				'frameFreeText1pos'       => '',
				'frameFreeText2'          => '',
				'frameFreeText2Style'     => '',
				'frameFreeText2pos'       => '',
			)
		);
	}

	/**
	 * @see GalleryLayout::getSettings()
	 * @todo Refactor the theme to use advanced settings / loadSettingsTemplate.
	 * And thereby stop abusing setting entries as section titles.
	 */
	public function getSettings($itemId = null) {
		list($ret, $settings, $params) = parent::getSettings($itemId);

		if ($ret) {
			return array($ret, null, null);
		}

		// Add in our custom settings
		$titledivstart  = '</td><td></td></tr><tr><td colspan="2"></td></tr><tr>'
			. '<td colspan="2" class="admin_theme_settings"> :::::::::::::::::::: ';
		$stitledivstart = '</td><td></td></tr><tr><td colspan="2"></td></tr><tr>'
			. '<td colspan="2" class="admin_theme_settingsS"> :::::::::::::::::::: ';
		$ititledivstart = '</td><td></td></tr><tr><td colspan="2"></td></tr><tr>'
			. '<td colspan="2" class="admin_theme_settingsI"> :::::::::::::::::::: ';

		$titlediv   = ' ::::::::::::::::::::</b><br/><span class="admin_theme_applied">';
		$titlespeed = '</span></td></tr><tr><td colspan="2" '
			. 'style="text-align:right"><span class="speed">'
			. $this->translate(
				'NOTE: Selecting too many "Show" options can dramatically reduce speed!'
			)
			. '</span>';

		$titledivend = '</td></tr><tr><td colspan="2">';
		$att1        = '<a class="tLink-att_admin" style="cursor:pointer;" title="';
		$att2        = '"><img src="themes/x_treme/images/blank.gif"></a>';
		$help1       = '<span style="cursor:help; border-bottom: dashed 1px #f4560f; '
			. 'font-weight:bold" title="';
		$help2       = '">';
		$help3       = '</span>';


		/**
		 ***************** GLOBAL settings ****************
		 */
		$settings[] = array(
			'key'   => 'overall',
			'name'  => $titledivstart
				. $help1
				. $this->translate(
					'Implemented at: theme.tpl'
				)
				. $help2
				. $this->translate(
					'GLOBAL'
				)
				. $help3
				. $titlediv
				. $this->translate(
					'Settings applied all over Gallery ' .
					'<a title="Implemented at: theme.tpl" class="tLink-help_admin">'
				)
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		$settings[] = array(
			'key'   => 'pngfix',
			'name'  => $help1
				. $this->translate(
					'IE 5.5 to 7 - Show pages only when all items are loaded and'
					. ' onmousehover will not work'
				)
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. ' :: '
				. $this->translate('Add png suport for IE older versions'),
			'type'  => 'checkbox',
			'value' => $params['pngfix'],
		);
		$settings[] = array(
			'key'         => 'site',
			'name'        => $help1
				. $this->translate('(e.g.: MYSITE.COM)')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Site ID.')
				. ' :: '
				. $this->translate('To display on page Title'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['site'],
		);
		$settings[] = array(
			'key'     => 'logo',
			'name'    => $help1
				. $this->translate('images under x_treme/extra/logos/')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Logo')
				. ' :: '
				. $this->translate('Show on top page - select alignment'),
			'type'    => 'single-select',
			'choices' => array(
				'0'      => $this->translate('Do not show'),
				'left'   => $this->translate('Left'),
				'center' => $this->translate('Center'),
				'right'  => $this->translate('Right'),
			),
			'value'   => $params['logo'],
		);

		$settings[] = array(
			'key'         => 'logoout',
			'name'        => $help1
				. $this->translate('files under x_treme/templates/extra/logos')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Logo')
				. ' :: '
				. $this->translate('Enter file name and extension (default: logo.png)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['logoout'],
		);
		$settings[] = array(
			'key'         => 'logoon',
			'name'        => $help1
				. $this->translate('files under x_treme/templates/extra/logos/')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Logo')
				. ' :: '
				. $this->translate(
					'Enter logo hover file name and extension (default: logo_hover.png)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['logoon'],
		);
		$settings[] = array(
			'key'         => 'logoWidth',
			'name'        => $help1
				. $this->translate('default: 175')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Logo')
				. ' :: '
				. $this->translate('Enter image Width (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['logoWidth'],
		);
		$settings[] = array(
			'key'         => 'logoHeight',
			'name'        => $help1
				. $this->translate('default: 50')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Logo')
				. ' :: '
				. $this->translate('Enter image Height (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['logoHeight'],
		);

		$settings[] = array(
			'key'   => 'bannerTop',
			'name'  => $help1
				. $this->translate('files under x_treme/templates/extra/banners/')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Banner')
				. ' :: '
				. $this->translate('Show on top of the page (customize banner_top.tpl)'),
			'type'  => 'checkbox',
			'value' => $params['bannerTop'],
		);
		$settings[] = array(
			'key'         => 'bannerTopurl',
			'name'        => $help1
				. $this->translate('default: banner_top.tpl')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Banner')
				. ' :: '
				. $this->translate('Enter file name and extension'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bannerTopurl'],
		);
		$settings[] = array(
			'key'   => 'bannerFooter',
			'name'  => $help1
				. $this->translate('files under x_treme/templates/extra/banners/')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Banner')
				. ' :: '
				. $this->translate('Show on Footer (costumize banner_footer.tpl)'),
			'type'  => 'checkbox',
			'value' => $params['bannerFooter'],
		);
		$settings[] = array(
			'key'         => 'bannerFooterurl',
			'name'        => $help1
				. $this->translate('default: banner_footer.tpl')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Banner')
				. ' :: '
				. $this->translate('Enter file name and extension, to display on Footer'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bannerFooterurl'],
		);
		$settings[] = array(
			'key'     => 'sidebar',
			'name'    => $help1
				. $this->translate('You have to add Blocks to show in the sidebar')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('SideBar')
				. ' :: '
				. $this->translate('Behavior'),
			'type'    => 'single-select',
			'choices' => array(
				'floating' => $this->translate('Floating'),
				'static'   => $this->translate('Static'),
				'0'        => $this->translate('None'),
			),
			'value'   => $params['sidebar'],
		);
		$settings[] = array(
			'key'   => 'BreadCrumb',
			'name'  => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('Show where the user is (BreadCrumb)'),
			'type'  => 'checkbox',
			'value' => $params['BreadCrumb'],
		);
		$settings[] = array(
			'key'         => 'separator',
			'name'        => $help1
				. $this->translate('(e.g.: |)')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('Separator for items on BreadCrumb and Menu'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['separator'],
		);
		$settings[] = array(
			'key'         => 'link1',
			'name'        => $help1
				. $this->translate('(e.g.: Link to MyotherSite)')
				. $help2
				. $this-> translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('An external Link'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['link1'],
		);
		$settings[] = array(
			'key'         => 'link1url',
			'name'        => $help1
				. $this->translate('(e.g.: http://www.myothersite.com)')
				. $help2
				. $this-> translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('URL for this Link'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['link1url'],
		);
		$settings[] = array(
			'key'         => 'link2',
			'name'        => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('2nd Link'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['link2'],
		);
		$settings[] = array(
			'key'         => 'link2url',
			'name'        => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('URL for 2nd Link'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['link2url'],
		);
		$settings[] = array(
			'key'         => 'link3',
			'name'        => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('3rd Link'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['link3'],
		);
		$settings[] = array(
			'key'         => 'link3url',
			'name'        => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('URL for 3rd Link'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['link3url'],
		);
		$settings[] = array(
			'key'   => 'externallinks',
			'name'  => $help1
				. $this->translate('You have to add Title and URL at externalLinks.tpl')
				. $help2
				. $this->translate('GLOBAL')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Top Navigation')
				. ' :: '
				. $this->translate('More external Links'),
			'type'  => 'checkbox',
			'value' => $params['externallinks'],
		);
		$settings[] = array(
			'key'     => 'BlocksAlign',
			'name'    => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Blocks')
				. ' :: '
				. $this->translate(
					'Position Blocks Table with selected Blocks to show at pages bottom'
				),
			'type'    => 'single-select',
			'choices' => array(
				'0'      => ' ',
				'left'   => $this->translate('Left'),
				'center' => $this->translate('Center'),
				'right'  => $this->translate('Right'),
			),
			'value'   => $params['BlocksAlign'],
		);
		$settings[] = array(
			'key'     => 'BlocksInAlign',
			'name'    => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Blocks')
				. ' :: '
				. $this->translate('Align the Blocks inside Blocks Table'),
			'type'    => 'single-select',
			'choices' => array(
				'0'      => ' ',
				'left'   => $this->translate('Left'),
				'center' => $this->translate('Center'),
				'right'  => $this->translate('Right'),
			),
			'value'   => $params['BlocksInAlign'],
		);
		$settings[] = array(
			'key'     => 'CartSelect',
			'name'    => $this->translate('GLOBAL')
				. ' :: '
				. $this->translate(
					'If "Cart" and "Checkout" modules are activated, ' .
					'select the one or both to use with "Cart" buttons'
				),
			'type'    => 'single-select',
			'choices' => array(
				'both'     => $this->translate('Use both - selected by user'),
				'cart'     => $this->translate('Use only "CART" module'),
				'checkout' => $this->translate('Use only "CHECKOUT" module'),
			),
			'value'   => $params['CartSelect'],
		);
		$settings[] = array(
			'key'     => 'dynamicLinks',
			'name'    => $this->translate('GLOBAL')
				. ' :: '
				. $this->translate('Thumbnail links in dynamic albums'),
			'type'    => 'single-select',
			'choices' => array(
				'browse'   => $this->translate('Browse dynamic album'),
				'jump'     => $this->translate('Jump to original album'),
				'jumplink' => $this->translate(
					'Separate link to original album'
				),
			),
			'value'   => $params['dynamicLinks'],
		);
		$settings[] = array(
			'key'     => 'RightClick',
			'name'    => $help1
				. $this->translate(
					'Uses Javascript'
				)
				. $help2
				. $this->translate(
					'GLOBAL'
				)
				. $help3
				. ' :: '
				. $this->translate(
					'Mouse Right Click action'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate(
					'None'
				),
				'disable' => $this->translate(
					'Disable Right Click context menu'
				),
				'alert' => $this->translate(
					'Show "Copyright Alert Message"'
				),
				'sidebarrc' => $this->translate(
					'Show Floating Sidebar and Right Click context menu'
				),
				'sidebarnrc' => $this->translate(
					'Show Floating Sidebar, no R. C. context menu'
				),
				'sidebarrcalert' => $this->translate(
					'Show Floating Sidebar and "Copyright Alert Message"'
				),
			),
			'value'   => $params['RightClick'],
		);
		$settings[] = array(
			'key'     => 'topNavPics',
			'name'    => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Icons')
				. ' :: '
				. $this->translate(
					'Show icons actions/navigation bar on top (select alignment)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'right' => $this->translate(
					'On the right side of the page'
				),
				'left' => $this->translate(
					'On the left side of the page'
				),
				'rightNN' => $this->translate(
					'Only action icons on the right - no navigation icons'
				),
				'leftNN' => $this->translate(
					'Only action icons on the left - no navigation icons'
				),
				'none' => $this->translate(
					'Do not display any icons'
				),
			),
			'value'   => $params['topNavPics'],
		);

		$settings[] = array(
			'key'     => 'icons',
			'name'    => $this->translate('GLOBAL')
				. $this->translate(' - ')
				. $this->translate('Icons')
				. ' :: '
				. $this->translate('Select theme icons to override iconpack'),
			'type'    => 'single-select',
			'choices' => array(
				'none'           => $this->translate('none'),
				'default'        => $this->translate('default'),
				'x_treme'        => $this->translate('X_treme (png)'),
				'x_silk'         => $this->translate('X_silk (png)'),
				'x_sepia_fill'   => $this->translate('X_sepia_fill'),
				'x_silver_fill'  => $this->translate('X_silver_fill'),
				'x_black_fill'   => $this->translate('X_black_fill'),
				'x_sepia'        => $this->translate('X_sepia'),
				'x_blue'         => $this->translate('X_blue'),
				'x_brown'        => $this->translate('X_brown'),
				'x_charcoal'     => $this->translate('X_charcoal'),
				'x_silver'       => $this->translate('X_silver'),
				'x_snow'         => $this->translate('X_snow'),
				'default_3d'     => $this->translate('default (3d)'),
				'x_blue_3d'      => $this->translate('X_blue (3d)'),
				'x_brown_3d'     => $this->translate('X_brown (3d)'),
				'x_charcoal_3d'  => $this->translate('X_charcoal (3d)'),
				'x_silver_3d'    => $this->translate('X_silver (3d)'),
				'x_snow_3d'      => $this->translate('X_snow(3d)'),
				'default_3dH'    => $this->translate('default (3d hover)'),
				'x_blue_3dH'     => $this->translate('X_blue (3d hover)'),
				'x_brown_3dH'    => $this->translate('X_brown (3d hover)'),
				'x_charcoal_3dH' => $this->translate('X_charcoal (3d hover)'),
				'x_silver_3dH'   => $this->translate('X_silver (3d hover)'),
				'x_snow_3dH'     => $this->translate('X_snow (3d hover)'),
				'my_pngs'        => $this->translate('my_pngs - your one png icons'),
				'my_gifs'        => $this->translate('my_gifs - your one gif icons'),
			),
			'value'   => $params['icons'],
		);

		/**
		 ***************** ALBUM - all pages ****************
		 */
		$settings[] = array(
			'key'   => 'albumall',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: album.tpl; navigatorAlbum.tpl')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('all pages')
				. $titlediv
				. $this->translate('Settings applied to Album view')
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		$settings[] = array(
			'key'     => 'NavAlbum',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Global')
				. ' :: '
				. $this->translate(' Show album navigation bar (select position)'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'top'    => $this->translate('On Top'),
				'bottom' => $this->translate('On Bottom'),
				'both'   => $this->translate('Both'),
			),
			'value'   => $params['NavAlbum'],
		);
		$settings[] = array(
			'key'        => 'albumSideBlocks',
			'name'       => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Global')
				. ' :: '
				. $this->translate(
					'Blocks to show on album pages below information ' .
					'(if on side of thumbnails)'
				),
			'type'       => 'block-list',
			'typeParams' => array(
				'packType' => 'block-list',
			),
			'value'      => $params['albumSideBlocks'],
		);
		$settings[] = array(
			'key'     => 'enterAlbumDirect',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Global')
				. ' :: '
				. $this->translate('Link Albums directly to photo pages'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate(
					'No'
				),
				'thumbs' => $this->translate(
					'Clicking a thumbnail'
				),
				'thumbsNoAlbum' => $this->translate(
					'Clicking a thumbnail but only if album as no subalbums'
				),
				'all' => $this->translate(
					'All Links (breadcrumbs, album select menu, direct uri...)'
				),
				'allNoAlbum' => $this->translate(
					'All Links but only if album as no subalbums'
				),
			),
			'value'   => $params['enterAlbumDirect'],
		);
		$settings[] = array(
			'key'   => 'enterAlbumTopNav',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Global')
				. ' :: '
				. $this->translate(
					'If "clicking a thumbnail" above is selected, ' .
					'show a link to parent Album on "Icons Navigation Bar" at photo pages '
				),
			'type'  => 'checkbox',
			'value' => $params['enterAlbumTopNav'],
		);

		/**
		 ***************** 1st Page ALBUM settings ****************
		 */
		$settings[] = array(
			'key'   => '1stpage',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: album.tpl')
				. $help2
				. $this-> translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('1st page (GALLERY)')
				. $titlediv
				. $this->translate('Settings applied to first page of the Album')
				. $titlespeed
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);

		$settings[] = array(
			'key'         => 'Gcolumns',
			'name'        => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Columns (aplicable only for Album 1st page)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['Gcolumns'],
		);


		$settings[] = array(
			'key'     => 'GTitle',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Show Title on 1st page of the Gallery (select position)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'topL' => $this->translate('On top, left aligned'),
				'topR' => $this->translate('On top, right aligned'),
				'side' => $this->translate('On side of thumbnails'),
			),
			'value'   => $params['GTitle'],
		);
		$settings[] = array(
			'key'     => 'GDescription',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Show Description on 1st page of the Gallery (select position)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'topL' => $this->translate('On top, left aligned'),
				'topR' => $this->translate('On top, right aligned'),
				'side' => $this->translate('On side of thumbnails'),
			),
			'value'   => $params['GDescription'],
		);

		$settings[] = array(
			'key'   => 'showGalleryOwner',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Show Gallery owners on 1st page of the Gallery'),
			'type'  => 'checkbox',
			'value' => $params['showGalleryOwner'],
		);
		$settings[] = array(
			'key'   => 'GDate',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Show Gallery date on 1st page of the Gallery'),
			'type'  => 'checkbox',
			'value' => $params['GDate'],
		);
		$settings[] = array(
			'key'   => 'GSize',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Show Gallery size on 1st page of the Gallery'),
			'type'  => 'checkbox',
			'value' => $params['GSize'],
		);
		$settings[] = array(
			'key'   => 'GViewCount',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Show Gallery view count on 1st page of the Gallery'),
			'type'  => 'checkbox',
			'value' => $params['GViewCount'],
		);
		$settings[] = array(
			'key'   => 'GRating',
			'name'  => $this->translate('ALBUM') . $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Show Rating on 1st page of the Gallery')
				. $att1
				. $this-> translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['GRating'],
		);
		$settings[] = array(
			'key'     => 'GInfo',
			'name'    => $this->translate('ALBUM') . $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Show Information ' .
					'(select position to display Date, Size, View Count and Rating)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'top'  => $this->translate('On Top'),
				'side' => $this->translate('On side of thumbnails'),
			),
			'value'   => $params['GInfo'],
		);
		$settings[] = array(
			'key'     => 'GBlocksSide',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Show Blocks selected above to display on side of thumbnail'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show for 1st page'),
				'info' => $this->translate('Show bellow Info Message'),
				'side' => $this->translate('Show on side of Thumbnails'),
			),
			'value'   => $params['GBlocksSide'],
		);

		$settings[] = array(
			'key'   => 'GAddCart',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Display an "Add Cart" button '
					. '(Grant permissions in "Checkout" module if active)'
				),
			'type'  => 'checkbox',
			'value' => $params['GAddCart'],
		);
		$settings[] = array(
			'key'   => 'GViewCart',
			'name'  => $help1
				. $this->translate(
					'Go to Album or Photo page and Edit Permissions'
				)
				. $help2
				. $this-> translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Display a "View Cart" button '
					. '(Grant permissions in "Checkout" module if active)'
				),
			'type'  => 'checkbox',
			'value' => $params['GViewCart'],
		);

		$settings[] = array(
			'key'     => 'GAddComment',
			'name'    => $help1
				. $this->translate(
					'must set permissions and not add comments blocks to album pages'
				)
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate('Display an "Add a Comment" button'),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate('Do not show'),
				'floating' => $this->translate(
					'Clicking display a floating box to add comments'
				),
				'static'   => $this->translate(
					'Clicking redirect to Add Comments page'
				),
			),
			'value'   => $params['GAddComment'],
		);

		$settings[] = array(
			'key'   => 'GComments',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Display a "View Comments" buttons (must set permissions)'
				)
				. $att1
				. $this-> translate(
					'with many comments to display loading speed will decrease!'
				)
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['GComments'],
		);
		$settings[] = array(
			'key'   => 'GStaticComments',
			'name'  => $help1
				. $this->translate(
					'will disable View Comments Button and Add comments if there are comments'
				)
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Display a Static block with Comments below tumbnails ' .
					'(must set permissions)'
				)
				. $att1
				. $this-> translate(
					'with many comments to display loading speed will decrease!'
				)
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['GStaticComments'],
		);
		$settings[] = array(
			'key'   => 'GBlocksBtn',
			'name'  => $this->translate('ALBUM') . $this->translate(' - ')
				. $this->translate('1st Page')
				. ' :: '
				. $this->translate(
					'Display a "Blocks" button ' .
					'(when clicked Blocks selected to show: ' .
					'containing EXIF, Comments,etc, will be displayed on a floating box)'
				)
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['GBlocksBtn'],
		);

		/**
		 ***************** ALBUM - Info Message settings ****************
		 */
		$settings[] = array(
			'key'   => 'info',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: album.tpl; navigatorTop.tpl')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('Info Message')
				. $titlediv
				. $this->translate('Settings applied to Album view')
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);

		$settings[] = array(
			'key'     => 'showInfoMsg',
			'name'    => $this->translate('ALBUM') . $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('Show welcome message'),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate('Do not show'),
				'1sttopG'  => $this->translate('On TOP of Base Album 1st page'),
				'1stleftG' => $this->translate('On LEFT of Base Album 1st page'),
				'topG'     => $this->translate('On TOP of all Base Album pages'),
				'leftG'    => $this->translate('On LEFT of all Base Album pages'),
				'1sttop'   => $this->translate('On TOP of all Album 1st page'),
				'1stleft'  => $this->translate('On LEFT of all Album 1st page'),
				'top'      => $this->translate('On TOP of all Album pages'),
				'left'     => $this->translate('On LEFT of all Album pages'),
			),
			'value'   => $params['showInfoMsg'],
		);
		$settings[] = array(
			'key'         => 'InfoMsgurl',
			'name'        => $help1
				. $this->translate('files under x_treme/templates/extra/info')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('The Info Message tpl file name (default: default.tpl)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['InfoMsgurl'],
		);
		$settings[] = array(
			'key'         => 'InfoMsgLink1',
			'name'        => $help1
				. $this->translate('(e.g.: Equipment)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('1st link title (on the left)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['InfoMsgLink1'],
		);
		$settings[] = array(
			'key'         => 'InfoMsgLink1url',
			'name'        => $help1
				. $this->translate('(e.g.: equipment.tpl)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('1st link tpl file (default: default_link1.tpl)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['InfoMsgLink1url'],
		);
		$settings[] = array(
			'key'         => 'InfoMsgLink2',
			'name'        => $help1
				. $this->translate('(e.g.: Porfolio)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('2nd link title (on the right)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['InfoMsgLink2'],
		);
		$settings[] = array(
			'key'         => 'InfoMsgLink2url',
			'name'        => $help1
				. $this->translate('(e.g.: portfolio.tpl)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('2nd link tpl file (default: default_link2.tpl)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['InfoMsgLink2url'],
		);
		$settings[] = array(
			'key'     => 'authorEmail',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Info Message')
				. ' :: '
				. $this->translate('Show Author email'),
			'type'    => 'single-select',
			'choices' => array(
				'none'  => $this->translate('Do not show'),
				'left'  => $this->translate('Left Aligned'),
				'right' => $this->translate('Right Aligned'),
			),
			'value'   => $params['authorEmail'],
		);


		/**
		 ***************** ALBUM other pages settings ****************
		 */
		$settings[] = array(
			'key'   => 'album',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: album.tpl; navigatorTop.tpl')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('other pages')
				. $titlediv
				. $this->translate('Settings applied to other pages of the Album')
				. $titlespeed
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);


		$settings[] = array(
			'key'     => 'ATitle',
			'name'    => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show Title (select position)'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'topL' => $this->translate('On top, left aligned'),
				'topR' => $this->translate('On top, right aligned'),
				'side' => $this->translate('On side of thumbnails'),
			),
			'value'   => $params['ATitle'],
		);
		$settings[] = array(
			'key'     => 'ADescription',
			'name'    => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show Description (select position)'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'topL' => $this->translate('On top, left aligned'),
				'topR' => $this->translate('On top, right aligned'),
				'side' => $this->translate('On side of thumbnails'),
			),
			'value'   => $params['ADescription'],
		);

		$settings[] = array(
			'key'   => 'showAlbumOwner',
			'name'  => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show Owners'),
			'type'  => 'checkbox',
			'value' => $params['showAlbumOwner'],
		);

		$settings[] = array(
			'key'   => 'ADate',
			'name'  => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show Date'),
			'type'  => 'checkbox',
			'value' => $params['ADate'],
		);
		$settings[] = array(
			'key'   => 'ASize',
			'name'  => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show Size (quantity of items inside)'),
			'type'  => 'checkbox',
			'value' => $params['ASize'],
		);
		$settings[] = array(
			'key'   => 'AViewCount',
			'name'  => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show View Count'),
			'type'  => 'checkbox',
			'value' => $params['AViewCount'],
		);
		$settings[] = array(
			'key'   => 'ARating',
			'name'  => $this->translate('ALBUM')
				. ' :: '
				. $this->translate('Show Rating'),
			'type'  => 'checkbox',
			'value' => $params['ARating'],
		);
		$settings[] = array(
			'key'     => 'AInfo',
			'name'    => $this->translate('ALBUM')
				. ' :: '
				. $this->translate(
					'Show Information (select position to display Date, Size, View Count and Rating)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'top'  => $this->translate('On Top'),
				'side' => $this->translate('On side of thumbnails'),
			),
			'value'   => $params['AInfo'],
		);
		$settings[] = array(
			'key'   => 'AAddCart',
			'name'  => $help1
				. $this->translate('Grant permissions in "Checkout" module if active')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('Display an "Add Album to Cart" button on top navigation'),
			'type'  => 'checkbox',
			'value' => $params['AAddCart'],
		);
		$settings[] = array(
			'key'   => 'AViewCart',
			'name'  => $help1
				. $this->translate('Grant permissions in "Checkout" module if active')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('Display a "View Cart" button when cart is not empty'),
			'type'  => 'checkbox',
			'value' => $params['AViewCart'],
		);
		$settings[] = array(
			'key'     => 'AAddComment',
			'name'    => $help1
				. $this->translate('must set permissions')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('Display an "Add a Comment" button on top navigation'),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate('Do not show'),
				'floating' => $this->translate('Clicking display a floating box to add comments'),
				'static'   => $this->translate('Clicking redirect to Add Comments page'),
			),
			'value'   => $params['AAddComment'],
		);
		$settings[] = array(
			'key'   => 'AComments',
			'name'  => $help1
				. $this->translate('must set permissions')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate('Display a "View Comments" button on top navigation')
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['AComments'],
		);
		$settings[] = array(
			'key'   => 'AStaticComments',
			'name'  => $help1
				. $this->translate(
					'if there are comments View and Add Comments Buttons will not be shown'
				)
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. ' :: '
				. $this->translate(
					'Display a Static block with Comments below thumbnails (must set permissions)'
				)
				. $att1
				. $this->translate('with many comments loading speed will decrease!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['AStaticComments'],
		);
		$settings[] = array(
			'key'   => 'ABlocksBtn',
			'name'  => $this->translate('ALBUM')
				. ' :: '
				. $this->translate(
					'Display a "Blocks" button on top navigation '
					. '(when clicked Blocks selected to show: '
					. 'containing EXIF, Comments,etc, will be displayed on a floating box)'
				)
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['ABlocksBtn'],
		);



		/**
		 ***************** ALBUM ITEMS settings ****************
		 */
		$settings[] = array(
			'key'   => 'AlbumItems',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: album.tpl')
				. $help2
				. $this->translate('ALBUM')
				. ' :: '
				. $help3
				. $this->translate('Items')
				. $titlediv
				. $this->translate('Settings applied to Items at Album view')
				. $titlespeed
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);


		// ImageFrame settings, if available
		list($ret, $imageframe) = GalleryCoreApi::newFactoryInstance('ImageFrameInterface_1_1');

		if ($ret) {
			return array($ret, null, null);
		}

		if (isset($imageframe)) {
			list($ret, $list) = $imageframe->getImageFrameList();

			if ($ret) {
				return array($ret, null, null);
			}
			list($ret, $sampleUrl) = $imageframe->getSampleUrl($itemId);

			if ($ret) {
				return array($ret, null, null);
			}
			$sample = ' (<a href="' . $sampleUrl . '">'
			. $this->translate('View Samples') . '</a>)';

			$settings[] = array(
				'key'     => 'albumFrame',
				'name'    => $this->translate('ALBUM')
					. $this->translate(' - ')
					. $this->translate('Items')
					. ' :: '
					. $this->translate('Album Frame')
					. $sample,
				'type'    => 'single-select',
				'choices' => $list,
				'value'   => $params['albumFrame'],
			);

			$settings[] = array(
				'key'     => 'itemFrame',
				'name'    => $this->translate('ALBUM')
					. $this->translate(' - ')
					. $this->translate('Items')
					. ' :: '
					. $this->translate('Item Frame')
					. $sample,
				'type'    => 'single-select',
				'choices' => $list,
				'value'   => $params['itemFrame'],
			);
		}

		$settings[] = array(
			'key'     => 'opacityT',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Set Opacity for Thumbnails'),
			'type'    => 'single-select',
			'choices' => array(
				'0.1' => $this->translate('10%'),
				'0.2' => $this->translate('20%'),
				'0.3' => $this->translate('30%'),
				'0.4' => $this->translate('40%'),
				'0.5' => $this->translate('50%'),
				'0.6' => $this->translate('60%'),
				'0.7' => $this->translate('70%'),
				'0.8' => $this->translate('80%'),
				'0.9' => $this->translate('90%'),
				'1'   => $this->translate('100%'),
			),
			'value'   => $params['opacityT'],
		);
		$settings[] = array(
			'key'     => 'opacityTover',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Set hover Opacity for Thumbnails'),
			'type'    => 'single-select',
			'choices' => array(
				'0.1' => $this->translate('10%'),
				'0.2' => $this->translate('20%'),
				'0.3' => $this->translate('30%'),
				'0.4' => $this->translate('40%'),
				'0.5' => $this->translate('50%'),
				'0.6' => $this->translate('60%'),
				'0.7' => $this->translate('70%'),
				'0.8' => $this->translate('80%'),
				'0.9' => $this->translate('90%'),
				'1'   => $this->translate('100%'),
			),
			'value'   => $params['opacityTover'],
		);


		$settings[] = array(
			'key'         => 'Tborder',
			'name'        => $help1
				. $this->translate('(e.g.: 1)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Thumbnail border width (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['Tborder'],
		);
		$settings[] = array(
			'key'         => 'TborderColor',
			'name'        => $help1
				. $this->translate('(e.g.: #000 or black)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Thumbnail border color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['TborderColor'],
		);
		$settings[] = array(
			'key'         => 'TspaceH',
			'name'        => $help1
				. $this->translate('Horizontal separation between thumbs (e.g.: 20)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Horizontal Padding for thumbs (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['TspaceH'],
		);
		$settings[] = array(
			'key'         => 'TspaceV',
			'name'        => $help1
				. $this->translate('Vertical separation between thumbs (e.g.: 10)')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Vertical Padding for thumbs (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['TspaceV'],
		);
		$settings[] = array(
			'key'   => 'Iinfo',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show info selected below floating'),
			'type'  => 'checkbox',
			'value' => $params['Iinfo'],
		);
		$settings[] = array(
			'key'   => 'IinfoLink',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show button to display floating Info'),
			'type'  => 'checkbox',
			'value' => $params['IinfoLink'],
		);

		$settings[] = array(
			'key'     => 'ITitle',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show Title'),
			'type'    => 'single-select',
			'choices' => array(
				'none'    => $this->translate('No'),
				'both'    => $this->translate('For Albums and Photos'),
				'albums'  => $this->translate('Only for Albums'),
				'photos'  => $this->translate('Only for Photos'),
				'bothF'   => $this->translate('Only at floating box for Albums and Photos'),
				'albumsF' => $this->translate('Only at floating box for Albums'),
				'photosF' => $this->translate('Only at floating box for Photos'),
			),
			'value'   => $params['ITitle'],
		);
		$settings[] = array(
			'key'     => 'IDesc',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show Description'),
			'type'    => 'single-select',
			'choices' => array(
				'none'    => $this->translate('No'),
				'both'    => $this->translate('For Albums and Photos'),
				'albums'  => $this->translate('Only for Albums'),
				'photos'  => $this->translate('Only for Photos'),
				'bothF'   => $this->translate('Only at floating box for Albums and Photos'),
				'albumsF' => $this->translate('Only at floating box for Albums'),
				'photosF' => $this->translate('Only at floating box for Photos'),
			),
			'value'   => $params['IDesc'],
		);
		$settings[] = array(
			'key'     => 'ISum',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show Summary'),
			'type'    => 'single-select',
			'choices' => array(
				'none'    => $this->translate('No'),
				'both'    => $this->translate('For Albums and Photos'),
				'albums'  => $this->translate('Only for Albums'),
				'photos'  => $this->translate('Only for Photos'),
				'bothF'   => $this->translate('Only at floating box for Albums and Photos'),
				'albumsF' => $this->translate('Only at floating box for Albums'),
				'photosF' => $this->translate('Only at floating box for Photos'),
			),
			'value'   => $params['ISum'],
		);
		$settings[] = array(
			'key'     => 'IDate',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show Date'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('No'),
				'both'   => $this->translate('For Albums and Photos'),
				'albums' => $this->translate('Only for Albums'),
				'photos' => $this->translate('Only for Photos'),
			),
			'value'   => $params['IDate'],
		);
		$settings[] = array(
			'key'     => 'showItemsOwner',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate(
					'Show Owner (if "Show image owners" and/or "Show album owners" selected on top)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('No'),
				'both'   => $this->translate('For Albums and Photos'),
				'albums' => $this->translate('Only for Albums'),
				'photos' => $this->translate('Only for Photos'),
			),
			'value'   => $params['showItemsOwner'],
		);
		$settings[] = array(
			'key'   => 'ISize',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show Size (only if item is an Album)'),
			'type'  => 'checkbox',
			'value' => $params['ISize'],
		);
		$settings[] = array(
			'key'     => 'IViewCount',
			'name'    => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show View Count'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('No'),
				'both'   => $this->translate('For Albums and Photos'),
				'albums' => $this->translate('Only for Albums'),
				'photos' => $this->translate('Only for Photos'),
			),
			'value'   => $params['IViewCount'],
		);

		$settings[] = array(
			'key'     => 'ISummaries',
			'name'    => $help1
				. $this->translate('overlaps to Show Rating option')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Show Summaries (number of comments, rating, etc)'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('No'),
				'both'   => $this->translate('For Albums and Photos'),
				'albums' => $this->translate('Only for Albums'),
				'photos' => $this->translate('Only for Photos'),
			),
			'value'   => $params['ISummaries'],
		);

		$settings[] = array(
			'key'     => 'IRating',
			'name'    => $help1
				. $this->translate(
					'if Show Summaries is selected Ratings will be shown with Summaries'
				)
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate(
					'Show Rating (to use this option "Show summaries" must be set to "No")'
				)
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('No'),
				'both'   => $this->translate('For Albums and Photos'),
				'albums' => $this->translate('Only for Albums'),
				'photos' => $this->translate('Only for Photos'),
			),
			'value'   => $params['IRating'],
		);

		$settings[] = array(
			'key'   => 'IViewCart',
			'name'  => $help1
				. $this->translate('Grant permissions in "Checkout" module if active')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Display an "Add to Cart" button to items without children'),
			'type'  => 'checkbox',
			'value' => $params['IViewCart'],
		);
		$settings[] = array(
			'key'     => 'IAddComment',
			'name'    => $help1
				. $this->translate(
					'must set permissions and not add comments blocks to album pages'
				)
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Display an "Add a Comment" button'),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate('Do not show'),
				'floating' => $this->translate('Clicking display a floating box to add comments'),
				'static'   => $this->translate('Clicking redirect to Add Comments page'),
			),
			'value'   => $params['IAddComment'],
		);
		$settings[] = array(
			'key'   => 'IComments',
			'name'  => $help1 . $this->translate('must set permissions')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Display a "View Comments" button ')
				. $att1
				. $this->translate('with many comments loading speed will decrease!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['IComments'],
		);
		$settings[] = array(
			'key'   => 'IExif',
			'name'  => $this->translate('ALBUM')
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Display a "Show EXIF" button')
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['IExif'],
		);
		$settings[] = array(
			'key'   => 'IeCard',
			'name'  => $help1
				. $this->translate('must set permissions')
				. $help2
				. $this->translate('ALBUM')
				. $help3
				. $this->translate(' - ')
				. $this->translate('Items')
				. ' :: '
				. $this->translate('Display a "Send eCard" button'),
			'type'  => 'checkbox',
			'value' => $params['IeCard'],
		);
		/**
		 ***************** PHOTO settings ****************
		 */
		$settings[] = array(
			'key'   => 'photo',
			'name'  => $titledivstart
				. $help1
				. $this->translate(
					'Implemented at: navigatorPhoto; navigatorThumbs; navigatorTop; ' .
					'photo; photoNavOver; photoSizes'
				)
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. $titlediv
				. $this->translate('Settings applied to Photo view')
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		// ImageFrame settings, if available
		list($ret, $imageframe) = GalleryCoreApi::newFactoryInstance('ImageFrameInterface_1_1');

		if ($ret) {
			return array($ret, null, null);
		}

		if (isset($imageframe)) {
			list($ret, $list) = $imageframe->getImageFrameList();

			if ($ret) {
				return array($ret, null, null);
			}
			list($ret, $sampleUrl) = $imageframe->getSampleUrl($itemId);

			if ($ret) {
				return array($ret, null, null);
			}
			$sample = ' (<a href="' . $sampleUrl . '">'
				. $this->translate('View Samples') . '</a>)';

			$settings[] = array(
				'key'     => 'photoFrame',
				'name'    => $this->translate('PHOTO')
					. ' :: '
					. $this->translate('Photo Frame')
					. $sample,
				'type'    => 'single-select',
				'choices' => $list,
				'value'   => $params['photoFrame'],
			);
		}

		$settings[] = array(
			'key'         => 'SIborder',
			'name'        => $help1
				. $this->translate('(e.g.: 1)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Image border width (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['SIborder'],
		);
		$settings[] = array(
			'key'         => 'SIborderColor',
			'name'        => $help1
				. $this->translate('(e.g.: #000 or black)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Image border color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['SIborderColor'],
		);
		$settings[] = array(
			'key'     => 'NavPhoto',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show photo navigation icons (select position)'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'top'    => $this->translate('"Photo Navigation bar" ABOVE the image'),
				'bottom' => $this->translate('"Photo Navigation bar" BELOW the image'),
				'both'   => $this->translate('"Photo Navigation bar" ABOVE and BELOW the image'),
			),
			'value'   => $params['NavPhoto'],
		);
		$settings[] = array(
			'key'     => 'NavPop',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show full size photo POPUP navigation icon'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'show' => $this->translate('Show POPUP navigation icon'),
				'even' => $this->translate('Show even if the current view is the full size image'),
			),
			'value'   => $params['NavPop'],
		);
		$settings[] = array(
			'key'     => 'NavOver',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('select position'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'top'    => $this->translate('On Top'),
				'bottom' => $this->translate('On Bottom'),
				'both'   => $this->translate('Top and Bottom'),
			),
			'value'   => $params['NavOver'],
		);
		$settings[] = array(
			'key'     => 'NavOverLink',
			'name'    => $help1
				. $this->translate('show micro thumbnails must be selected also')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('select appearence'),
			'type'    => 'single-select',
			'choices' => array(
				'thumb' => $this->translate('Only Thumbnails (incompatible with image "fading in" for I.E.)'),
				'both'  => $this->translate('Thumbnails and text (incompatible with image "fading in" for I.E.)'),
				'text'  => $this->translate('Only Text'),
				'icons' => $this->translate('Only Icons'),
				'links' => $this->translate('Only Links - no thumbnails, text or icons'),
			),
			'value'   => $params['NavOverLink'],
		);
		$settings[] = array(
			'key'     => 'NavOverPop',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('show full size photo POPUP navigation icon'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'show' => $this->translate('Show POPUP navigation icon'),
				'even' => $this->translate('Show even if the current view is the full size image'),
			),
			'value'   => $params['NavOverPop'],
		);
		$settings[] = array(
			'key'         => 'NavPicWidth',
			'name'        => $help1 . $this->translate('(e.g.: 80)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('Prev and Next Thumbnails width'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['NavPicWidth'],
		);
		$settings[] = array(
			'key'         => 'NavLinkMargin',
			'name'        => $help1 . $this->translate('(e.g.: 6)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('Margin around Thumbnails'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['NavLinkMargin'],
		);
		$settings[] = array(
			'key'         => 'NavLinkBackground',
			'name'        => $help1
				. $this->translate('(e.g.: #ffffff)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('Background color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['NavLinkBackground'],
		);
		$settings[] = array(
			'key'         => 'NavLinkBorder',
			'name'        => $help1
				. $this->translate('(e.g.: 1)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('Border width (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['NavLinkBorder'],
		);
		$settings[] = array(
			'key'         => 'NavLinkBorderColor',
			'name'        => $help1
				. $this->translate('(e.g.: #000000)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('Border color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['NavLinkBorderColor'],
		);
		$settings[] = array(
			'key'         => 'NavLinkBorderColorHover',
			'name'        => $help1
				. $this->translate('(e.g.: #000000)')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Hover Navigation')
				. $this->translate(' - ')
				. $this->translate('hover Border color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['NavLinkBorderColorHover'],
		);
		$settings[] = array(
			'key'     => 'PTitle',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show Title (select position)'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'topL'   => $this->translate('On top, left aligned'),
				'topR'   => $this->translate('On top, right aligned'),
				'leftT'  => $this->translate('On the LEFT, ABOVE microthumbs if same side'),
				'leftB'  => $this->translate('On the LEFT, BELOW microthumbs if same side'),
				'rightT' => $this->translate('On the RIGHT, ABOVE microthumbs if same side'),
				'rightB' => $this->translate('On the RIGHT, BELOW microthumbs if same side'),
			),
			'value'   => $params['PTitle'],
		);
		$settings[] = array(
			'key'     => 'PDescription',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show Description (select position)'),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'topL'   => $this->translate('On top, left aligned'),
				'topR'   => $this->translate('On top, right aligned'),
				'leftT'  => $this->translate('On the LEFT, ABOVE microthumbs if same side'),
				'leftB'  => $this->translate('On the LEFT, BELOW microthumbs if same side'),
				'rightT' => $this->translate('On the RIGHT, ABOVE microthumbs if same side'),
				'rightB' => $this->translate('On the RIGHT, BELOW microthumbs if same side'),
			),
			'value'   => $params['PDescription'],
		);
		$settings[] = array(
			'key'   => 'showImageOwner',
			'name'  => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show Owner'),
			'type'  => 'checkbox',
			'value' => $params['showImageOwner'],
		);
		$settings[] = array(
			'key'   => 'PDate',
			'name'  => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show Date'),
			'type'  => 'checkbox',
			'value' => $params['PDate'],
		);
		$settings[] = array(
			'key'   => 'PViewCount',
			'name'  => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show View Count'),
			'type'  => 'checkbox',
			'value' => $params['PViewCount'],
		);
		$settings[] = array(
			'key'     => 'InfoSize',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Show Size'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Do not show'),
				'show' => $this->translate(
					'Show Size only if not the only view size for the image'
				),
				'even' => $this->translate('Show Size for all images'),
			),
			'value'   => $params['InfoSize'],
		);
		$settings[] = array(
			'key'     => 'PopSize',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Full size Link'),
			'type'    => 'single-select',
			'choices' => array(
				'none' => $this->translate('Show traditional full size link'),
				'show' => $this->translate('Show link to POPUP full size image'),
				'even' => $this->translate(
					'Show link even if the current view is the full size image'
				),
			),
			'value'   => $params['PopSize'],
		);
		$settings[] = array(
			'key'        => 'photoSideBlocks',
			'name'       => $this->translate('PHOTO')
				. ' :: '
				. $this->translate('Blocks to show on photo pages below information'),
			'type'       => 'block-list',
			'typeParams' => array(
				'packType' => 'block-list',
			),
			'value'      => $params['photoSideBlocks'],
		);
		$settings[] = array(
			'key'     => 'PInfo',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate(
					'Show Information (select position to display options selected above)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'top'    => $this->translate('On TOP'),
				'leftT'  => $this->translate('On the LEFT, ABOVE microthumbs if same side'),
				'leftB'  => $this->translate('On the LEFT, BELOW microthumbs if same side'),
				'rightT' => $this->translate('On the RIGHT, ABOVE microthumbs if same side'),
				'rightB' => $this->translate('On the RIGHT, BELOW microthumbs if same side'),
			),
			'value'   => $params['PInfo'],
		);
		$settings[] = array(
			'key'     => 'PRating',
			'name'    => $help1
				. $this->translate(
					'must add Rating interface on Blocks to show at photo pages'
				)
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate(
					'Show Ratings (add Rating interface block to show on photo pages)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none'   => $this->translate('Do not show'),
				'top'    => $this->translate('On TOP'),
				'leftT'  => $this->translate('On the LEFT, ABOVE microthumbs if same side'),
				'leftB'  => $this->translate('On the LEFT, BELOW microthumbs if same side'),
				'rightT' => $this->translate('On the RIGHT, ABOVE microthumbs if same side'),
				'rightB' => $this->translate('On the RIGHT, BELOW microthumbs if same side'),
			),
			'value'   => $params['PRating'],
		);

		$settings[] = array(
			'key'     => 'PAddCart',
			'name'    => $help1
				. $this->translate('override Photo Actions Buttons position')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate(
					'Display an "Add Item to Cart" button on Photo pages '
					. '(Grant permissions in "Checkout" module if active)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate('Do not show'),
				'topNav'   => $this->translate('at Top Navigation bar'),
				'photoNav' => $this->translate('at Photo Navigation bar'),
			),
			'value'   => $params['PAddCart'],
		);
		$settings[] = array(
			'key'     => 'PViewCart',
			'name'    => $help1
				. $this->translate('override Photo Actions Buttons position')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Display a "View Cart" button on Photo pages'),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate('Do not show'),
				'topNav'   => $this->translate('at Top Navigation bar'),
				'photoNav' => $this->translate('at Photo Navigation bar'),
			),
			'value'   => $params['PViewCart'],
		);

		$settings[] = array(
			'key'     => 'PActionsPos',
			'name'    => $this->translate('PHOTO')
				. ' :: '
				. $this->translate(
					'Select position to display Buttons with options selected below'
				),
			'type'    => 'single-select',
			'choices' => array(
				'topNav'   => $this->translate('at Top Navigation bar'),
				'photoNav' => $this->translate('at Photo Navigation bar'),
			),
			'value'   => $params['PActionsPos'],
		);

		$settings[] = array(
			'key'     => 'PAddComment',
			'name'    => $help1
				. $this->translate(
					'Not shown if Static Comments is selected and there are comments'
				)
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate(
					'Display an "Add a Comment" button (must set permissions)'
				),
			'type'    => 'single-select',
			'choices' => array(
				'none'     => $this->translate(
					'Do not show'
				),
				'floating' => $this->translate(
					'Display a floating box to add coments'
				),
				'static'   => $this->translate(
					'Redirect to "Add Comments" page'
				),
			),
			'value'   => $params['PAddComment'],
		);

		$settings[] = array(
			'key'   => 'PComments',
			'name'  => $help1
				. $this->translate(
					'if Static Comments selected this button will not be shown'
				)
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate(
					'Display a "View Comments" button (must set permissions)'
				)
				. $att1
				. $this-> translate(
					'with many comments loading speed will decrease!'
				)
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['PComments'],
		);
		$settings[] = array(
			'key'   => 'PStaticComments',
			'name'  => $help1
				. $this->translate(
					'if there are comments View and Add Comments Buttons will not be shown'
				)
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate(
					'Display a Static block with Comments just below "Actions Buttons"'
					. ' (must set permissions)'
				)
				. $att1
				. $this->translate('with many comments loading speed will decrease!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['PStaticComments'],
		);
		$settings[] = array(
			'key'   => 'PExif',
			'name'  => $this->translate('PHOTO') . ' :: '
				. $this->translate('Display a "Show EXIF" button')
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['PExif'],
		);
		$settings[] = array(
			'key'   => 'PeCard',
			'name'  => $help1
				. $this->translate('must set permissions')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Display a "Send eCard" button'),
			'type'  => 'checkbox',
			'value' => $params['PeCard'],
		);

		$settings[] = array(
			'key'   => 'PBlocksBtn',
			'name'  => $help1
				. $this->translate(
					'Blocks selected on top to show on photo page'
					. ' will be displayed on a floating box'
				)
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Display a "Blocks" button')
				. $att1
				. $this->translate('could decrease loading speed!')
				. $att2,
			'type'  => 'checkbox',
			'value' => $params['PBlocksBtn'],
		);
		$settings[] = array(
			'key'   => 'imageFadin',
			'name'  => $help1
				. $this->translate('incompatible with Hover photo Navigation work for I.E.')
				. $help2
				. $this->translate('PHOTO')
				. $help3
				. ' :: '
				. $this->translate('Show Photos fading in'),
			'type'  => 'checkbox',
			'value' => $params['imageFadin'],
		);

		/**
		 ***************** MICROTHUMBS settings ****************
		 */
		$settings[] = array(
			'key'   => 'microthumbs',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: navigatorThumbs.tpl')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. $titlediv
				. $this->translate('Settings applied to microthumbs at Photo view')
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);

		$settings[] = array(
			'key'     => 'MTposition',
			'name'    => 'MICROTHUMBS'
				. ' :: '
				. $this->translate('select position and appearance'),
			'type'    => 'single-select',
			'choices' => array(
				'left'      => $this->translate(
					'On LEFT side of the image'
				),
				'right'     => $this->translate(
					'On RIGHT side of the image'
				),
				'bottom'    => $this->translate(
					'On BOTTOM of the image'
				),
				'bottomF'   => $this->translate(
					'On BOTTOM of the page '
					. '(Full width page, below static comments if selected)'
				),
				'bottom1R'  => $this->translate(
					'Just 1 row on BOTTOM of the image'
				),
				'bottomF1R' => $this->translate(
					'Just 1 row on BOTTOM of the page '
					. '(Full width page, below static comments if selected)'
				),
				'none'      => $this->translate(
					'none'
				),
			),
			'none'    => $this->translate('Do not show'),
			'value'   => $params['MTposition'],
		);
		$settings[] = array(
			'key'         => 'columnsMT',
			'name'        => $help1
				. $this->translate('(e.g.: 4)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('Set number of columns per MicroThumbs'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['columnsMT'],
		);
		$settings[] = array(
			'key'         => 'peerWindowSize',
			'name'        => $help1
				. $this->translate('(e.g.: 20)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('Set number of MicroThumbs diplayed (if option below is selected will be added 1 or 2 more MicroThumbnails to show first and last ) <a title="" class="icon tLink-help_admin">'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['peerWindowSize'],
		);
		$settings[] = array(
			'key'   => 'MTends',
			'name'  => $help1
				. $this->translate('will be shown 1 or 2 more MicroThumbs')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('Show always first and last MicroThumbs (if selected the value entered above will not be consistent)'),
			'type'  => 'checkbox',
			'value' => $params['MTends'],
		);
		$settings[] = array(
			'key'         => 'sizeMT',
			'name'        => $help1
				. $this->translate('(e.g.: 40)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('Set width for MicroThumbs (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['sizeMT'],
		);
		$settings[] = array(
			'key'     => 'opacityMT',
			'name'    => 'MICROTHUMBS'
				. ' :: '
				. $this->translate('Set opacity for MicroThumbs'),
			'type'    => 'single-select',
			'choices' => array(

				'0.1' => $this->translate('10%'),
				'0.2' => $this->translate('20%'),
				'0.3' => $this->translate('30%'),
				'0.4' => $this->translate('40%'),
				'0.5' => $this->translate('50%'),
				'0.6' => $this->translate('60%'),
				'0.7' => $this->translate('70%'),
				'0.8' => $this->translate('80%'),
				'0.9' => $this->translate('90%'),
				'1'   => $this->translate('100%'),
			),
			'value'   => $params['opacityMT'],
		);
		$settings[] = array(
			'key'     => 'opacityMTover',
			'name'    => 'MICROTHUMBS'
				. ' :: '
				. $this->translate('Set opacity for MicroThumbs hover'),
			'type'    => 'single-select',
			'choices' => array(
				'0.1' => $this->translate('10%'),
				'0.2' => $this->translate('20%'),
				'0.3' => $this->translate('30%'),
				'0.4' => $this->translate('40%'),
				'0.5' => $this->translate('50%'),
				'0.6' => $this->translate('60%'),
				'0.7' => $this->translate('70%'),
				'0.8' => $this->translate('80%'),
				'0.9' => $this->translate('90%'),
				'1'   => $this->translate('100%'),
			),
			'value'   => $params['opacityMTover'],
		);

		$settings[] = array(
			'key'         => 'MTborder',
			'name'        => $help1
				. $this->translate('(e.g.: 1)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('MicroThumbs border width (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['MTborder'],
		);
		$settings[] = array(
			'key'         => 'MTborderColor',
			'name'        => $help1
				. $this->translate('(e.g.: #000 or black)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('MicroThumbs border color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['MTborderColor'],
		);

		$settings[] = array(
			'key'         => 'MTpadding',
			'name'        => $help1
				. $this->translate('(e.g.: 4)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('Set padding for MicroThumbs (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['MTpadding'],
		);

		$settings[] = array(
			'key'         => 'MTmargin',
			'name'        => $help1
				. $this->translate('(e.g.: 4)')
				. $help2
				. 'MICROTHUMBS'
				. $help3
				. ' :: '
				. $this->translate('Set margin for MicroThumbs table (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['MTmargin'],
		);



		$settings[] = array(
			'key'     => 'MTnavigator',
			'name'    => 'MICROTHUMBS'
				. ' :: '
				. $this->translate('Set MicroThumbs navigator behavior'),
			'type'    => 'single-select',
			'choices' => array(
				'FPpPL' => $this->translate(
					'First and Last Image, Prev. and Next Page, Linked Pages Index'
				),
				'FIpIL' => $this->translate(
					'First and Last Image, Prev. and Next Image, Linked Pages Index'
				),
				'FpL'   => $this->translate(
					'First and Last Image, Linked Pages Index'
				),
				'PpP'   => $this->translate(
					'Prev. and Next Page, Linked Pages Index'
				),
				'IpI'   => $this->translate(
					'Prev. and Next Image, Linked Pages Index'
				),
				'FPPL'  => $this->translate(
					'First and Last Image, Prev. and Next Page'
				),
				'FIIL'  => $this->translate(
					'First and Last Image, Prev. and Next Image'
				),
				'PP'    => $this->translate(
					'Prev. and Next Page'
				),
				'II'    => $this->translate(
					'Prev. and Next Image'
				),
				'p'     => $this->translate(
					'Only Linked Pages Index'
				),
			),
			'value'   => $params['MTnavigator'],
		);
		$settings[] = array(
			'key'   => 'MTpageinfo',
			'name'  => 'MICROTHUMBS'
				. ' :: '
				. $this->translate(
					'Show page info instead of Linked Pages Iindex'
				),
			'type'  => 'checkbox',
			'value' => $params['MTpageinfo'],
		);
		$settings[] = array(
			'key'   => 'MTinfo',
			'name'  => 'MICROTHUMBS'
				. ' :: '
				. $this->translate(
					'Show info about number of visible thumbnails below navigator'
				),
			'type'  => 'checkbox',
			'value' => $params['MTinfo'],
		);


		/**
		 ***************** SLIDESHOW settings ****************
		 */
		$settings[] = array(
			'key'   => 'slideshow',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: navigatorTop.tpl')
				. $help2
				. 'SLIDESHOW'
				. $help3
				. $titlediv
				. $this->translate('Settings applied to Album, Photo and Slideshow views')
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		$settings[] = array(
			'key'   => 'Showslideshow',
			'name'  => 'SLIDESHOW'
				. ' :: '
				. $this->translate('If module is active display a SlideShow navigation icon'),
			'type'  => 'checkbox',
			'value' => $params['Showslideshow'],
		);
		$settings[] = array(
			'key'         => 'ss',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Use x_treme on SlideShow if is the selected theme'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ss'],
		);
		$settings[] = array(
			'key'         => 'ssTitle',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Show Title of the photo'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssTitle'],
		);
		$settings[] = array(
			'key'         => 'ssSummary',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Show Summary of the photo'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssSummary'],
		);
		$settings[] = array(
			'key'         => 'ssDescription',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Show Description of the photo'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssDescription'],
		);
		$settings[] = array(
			'key'         => 'ssDate',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Show Date of the photo'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssDate'],
		);
		$settings[] = array(
			'key'     => 'ssMoreInfo',
			'name'    => 'SLIDESHOW'
				. ' :: '
				. $this->translate(
					'Display a "Show/Hide More Info" button for options selected above'
				),
			'type'    => 'single-select',
			'choices' => array(
				'0'    => $this->translate('Do not show'),
				'show' => $this->translate('Show by default'),
				'hide' => $this->translate('Hide by default'),
			),
			'value'   => $params['ssMoreInfo'],
		);
		$settings[] = array(
			'key'         => 'ssBack',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Show "Back One Image" button'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssBack'],
		);
		$settings[] = array(
			'key'         => 'ssNext',
			'name'        => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Show "Next Image" button'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssNext'],
		);
		$settings[] = array(
			'key'         => 'ssMoreOptions',
			'name'        => $help1
				. $this->translate('default: hidden')
				. $help2
				. 'SLIDESHOW'
				. $help3
				. ' :: '
				. $this->translate('Show "More Options"'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['ssMoreOptions'],
		);
		$settings[] = array(
			'key'     => 'ssDelay',
			'name'    => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Select delay'),
			'type'    => 'single-select',
			'choices' => array(
				'1'  => $this->translate('1 second'),
				'3'  => $this->translate('3 seconds'),
				'5'  => $this->translate('5 seconds'),
				'10' => $this->translate('10 seconds'),
				'15' => $this->translate('15 seconds'),
				'20' => $this->translate('20 seconds'),
			),
			'value'   => $params['ssDelay'],
		);
		$settings[] = array(
			'key'     => 'ssDirection',
			'name'    => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Select direction'),
			'type'    => 'single-select',
			'choices' => array(
				'1'  => $this->translate('forword'),
				'-1' => $this->translate('reverse'),
				'0'  => $this->translate('random'),
			),
			'value'   => $params['ssDirection'],
		);
		$settings[] = array(
			'key'     => 'ssSize',
			'name'    => 'SLIDESHOW'
				. ' :: '
				. $this->translate('Select Maximum size'),
			'type'    => 'single-select',
			'choices' => array(
				'0' => $this->translate('320x320'),
				'1' => $this->translate('640x640'),
				'2' => $this->translate('800x800'),
				'3' => $this->translate('1024x1024'),
				'4' => $this->translate('1280x1280'),
				'5' => $this->translate('no limit'),
			),
			'value'   => $params['ssSize'],
		);
		/**
		 ***************** FOOTER settings ****************
		 */
		$settings[] = array(
			'key'   => 'footer',
			'name'  => $titledivstart
				. $help1
				. $this->translate('Implemented at: footer.tpl')
				. $help2
				. $this->translate('FOOTER')
				. $help3
				. $titlediv
				. $this->translate('Settings applied to footer all over Gallery')
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		$settings[] = array(
			'key'         => 'g2btn',
			'name'        => $this->translate('FOOTER')
				. ' :: '
				. $this->translate('Show "GALLERY 2" button'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['g2btn'],
		);
		$settings[] = array(
			'key'         => 'x_btn',
			'name'        => $this->translate('FOOTER')
				. ' :: '
				. $this->translate('Show "X_treme version" button'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['x_btn'],
		);
		$settings[] = array(
			'key'         => 'x_cpbtn',
			'name'        => $this->translate('FOOTER')
				. ' :: '
				. $this->translate('Show "X_ColorPacks" button'),
			'type'        => 'checkbox',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['x_cpbtn'],
		);
		$settings[] = array(
			'key'   => 'copyright',
			'name'  => $this->translate('FOOTER')
				. ' :: '
				. $this->translate('Display a Copyright Message on footer'),
			'type'  => 'checkbox',
			'value' => $params['copyright'],
		);
		$settings[] = array(
			'key'         => 'copyrightName',
			'name'        => $help1
				. $this->translate('(e.g.: www.mysite.com)')
				. $help2
				. $this->translate('FOOTER')
				. $help3
				. ' :: '
				. $this->translate(
					'ID. to display on footer Copyright Message '
					. '(default: Gallery administrator Full Name)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['copyrightName'],
		);
		$settings[] = array(
			'key'   => 'copyrightDate',
			'name'  => $this->translate('FOOTER')
				. ' :: '
				. $this->translate('Show a date on footer Copyright Message'),
			'type'  => 'checkbox',
			'value' => $params['copyrightDate'],
		);
		$settings[] = array(
			'key'         => 'copyrightDateText',
			'name'        => $help1
				. $this->translate('(e.g.: 2005 - 2006)')
				. $help2
				. $this-> translate('FOOTER')
				. $help3
				. ' :: '
				. $this->translate(
					'Date to display on footer Copyright Message '
					. '(if blank shows gallery creation date)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['copyrightDateText'],
		);
		$settings[] = array(
			'key'   => 'showCopyrightEmail',
			'name'  => $help1
				. $this->translate(
					'display an email onmouseover copyright message clicking and a mailto link'
				)
				. $help2
				. $this->translate('FOOTER')
				. $help3
				. ' :: '
				. $this->translate(
					'Display an EMAIL on footer Copyright Message (enter EMAIL below)'
				),
			'type'  => 'checkbox',
			'value' => $params['showCopyrightEmail'],
		);
		$settings[] = array(
			'key'         => 'copyrightEmail',
			'name'        => $help1
				. $this->translate('(e.g.: mail@mysite.com or mail_AT_mysite_DOT_com)')
				. $help2
				. $this->translate('FOOTER')
				. $help3
				. ' :: '
				. $this->translate(
					'Your EMAIL to display a link on footer Copyright Message '
					. '(default: Gallery administrator Email)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['copyrightEmail'],
		);
		/**
		 ***************** CSS adjustments ****************
		 */
		$settings[] = array(
			'key'   => 'css',
			'name'  => $stitledivstart
				. $help1
				. $this->translate('Implemented at: css.tpl')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. $titlediv
				. $this->translate(
					'Settings applied all over Gallery (overlaps CSS and colorpacks)'
				)
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		$settings[] = array(
			'key'         => 'bg',
			'name'        => $help1
				. $this->translate(
					'upload files under x_treme/templates/extra/backgrounds'
				)
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate(
					'Enter file name and extension for image to use as Gallery Background'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bg'],
		);
		$settings[] = array(
			'key'         => 'bgcolor',
			'name'        => $help1
				. $this->translate('(e.g.: #888888)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery Background color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bgcolor'],
		);
		$settings[] = array(
			'key'         => 'bg1',
			'name'        => $help1
				. $this->translate(
					'upload files under x_treme/templates/extra/backgrounds'
				)
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate(
					'Enter file name and extension for image to use as Gallery Background 1'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bg1'],
		);
		$settings[] = array(
			'key'         => 'bg1color',
			'name'        => $help1
				. $this->translate(
					'(e.g.: #888888)'
				)
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate(
					'Gallery Background 1 color (Used as album and Photo table Background)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bg1color'],
		);
		$settings[] = array(
			'key'         => 'bg2',
			'name'        => $help1
				. $this->translate(
					'upload files under x_treme/templates/extra/backgrounds'
				)
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate(
					'Enter file name and extension for image to use as Gallery Background 2'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bg2'],
		);
		$settings[] = array(
			'key'         => 'bg2color',
			'name'        => $help1
				. $this->translate('(e.g.: #888888)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate(
					'Gallery Background 2 color (Used as Popups and MicroThumbs Background)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bg2color'],
		);
		$settings[] = array(
			'key'         => 'border1color',
			'name'        => $help1
				. $this->translate('(e.g.: #888888)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Border 1 color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['border1color'],
		);
		$settings[] = array(
			'key'         => 'border1size',
			'name'        => $help1
				. $this->translate('(e.g.: 1px)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Border 1 size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['border1size'],
		);
		$settings[] = array(
			'key'         => 'border2color',
			'name'        => $help1
				. $this->translate('(e.g.: #888888)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Border 2 color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['border2color'],
		);
		$settings[] = array(
			'key'         => 'border2size',
			'name'        => $help1
				. $this->translate('(e.g.: 1px)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Border 2 size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['border2size'],
		);
		$settings[] = array(
			'key'         => 'Gfontfamily',
			'name'        => $help1
				. $this->translate('(e.g.: "Times New Roman")')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery font family'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['Gfontfamily'],
		);
		$settings[] = array(
			'key'         => 'Gfontsize',
			'name'        => $help1
				. $this->translate('(default: 62.5%)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery font size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['Gfontsize'],
		);
		$settings[] = array(
			'key'         => 'Gfontcolor',
			'name'        => $help1
				. $this->translate('(e.g.: #666666)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery font color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['Gfontcolor'],
		);
		$settings[] = array(
			'key'         => 'linkcolor',
			'name'        => $help1
				. $this->translate('(e.g.: #ffffff)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Link font color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['linkcolor'],
		);
		$settings[] = array(
			'key'         => 'linkhovercolor',
			'name'        => $help1
				. $this->translate('(e.g.: #ff0000)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Link hover color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['linkhovercolor'],
		);
		$settings[] = array(
			'key'         => 'linkactivecolor',
			'name'        => $help1
				. $this->translate('(e.g.: #cccccc)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Link active color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['linkactivecolor'],
		);
		$settings[] = array(
			'key'         => 'BreadCrumbfontsize',
			'name'        => $help1
				. $this->translate('(e.g.: 1.0em)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Top Navigation BreadCrumb font size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['BreadCrumbfontsize'],
		);
		$settings[] = array(
			'key'         => 'SystemLinksfontsize',
			'name'        => $help1
				. $this->translate('(e.g.: 1.0em)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Top Navigation SystemLinks font size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['SystemLinksfontsize'],
		);
		$settings[] = array(
			'key'         => 'GTfontfamily',
			'name'        => $help1
				. $this->translate('(e.g.: Arial)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery Titles font family'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['GTfontfamily'],
		);
		$settings[] = array(
			'key'         => 'GTfontsize',
			'name'        => $help1
				. $this->translate('(e.g.: 1.3em)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery Titles font size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['GTfontsize'],
		);
		$settings[] = array(
			'key'         => 'GTfontcolor',
			'name'        => $help1
				. $this->translate('(e.g.: #666666)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery Titles font color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['GTfontcolor'],
		);
		$settings[] = array(
			'key'         => 'GIfontsize',
			'name'        => $help1
				. $this->translate('(e.g.: 8px)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery Info font size'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['GIfontsize'],
		);
		$settings[] = array(
			'key'         => 'GIfontcolor',
			'name'        => $help1
				. $this->translate('(e.g.: #aaa)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('Gallery Info font color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['GIfontcolor'],
		);
		$settings[] = array(
			'key'         => 'GNcolor',
			'name'        => $help1
				. $this->translate('(e.g.: red)')
				. $help2
				. $this->translate('STYLES')
				. $help3
				. ' :: '
				. $this->translate('New, Updated info color'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['GNcolor'],
		);
		/**
		 ***************** XTREME FRAME settings ****************
		 */
		$settings[] = array(
			'key'   => 'iframe',
			'name'  => $ititledivstart
				. $help1
				. $this->translate('Implemented at: photo.tpl; interactiveFrame.tpl')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. $titlediv
				. $this->translate(
					'Settings applied to Photo views.'
					. ' Add a frame and/or a passpartout that interact with other frames'
				)
				. $titledivend,
			'value' => '',
			'type'  => 'pseudo-title',
		);
		$settings[] = array(
			'key'   => 'interactiveframe',
			'name'  => $help1
				. $this->translate('Display a interactive Frame, costumize settings below')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Display a frame '
					. '(<a href="http://codex.gallery2.org/Gallery2:Themes:x_treme:Xtreme_Frame" '
					. 'Title="How to configure" target="new">Description</a>)'
				),
			'type'  => 'checkbox',
			'value' => $params['interactiveframe'],
		);
		$settings[] = array(
			'key'     => 'setiframe',
			'name'    => $help1
				. $this->translate('Select a SET')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Frame PRESETS (settings below will overide this sets)'),
			'type'    => 'single-select',
			'choices' => array(
				'0' => $this->translate('none'),
				'1' => $this->translate('set 1'),
				'2' => $this->translate('set 2'),
				'3' => $this->translate('set 3'),
			),
			'value'   => $params['setiframe'],
		);
		$settings[] = array(
			'key'         => 'frameColor',
			'name'        => $help1
				. $this->translate('(e.g.: #cccccc)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter frame COLOR'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameColor'],
		);
		$settings[] = array(
			'key'         => 'frameTheight',
			'name'        => $help1
				. $this->translate('(e.g.: 50)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter frame TOP height (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameTheight'],
		);
		$settings[] = array(
			'key'         => 'frameLwidth',
			'name'        => $help1
				. $this->translate('(e.g.: 50)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter frame LEFT width, if not set use frame TOP height value (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameLwidth'],
		);
		$settings[] = array(
			'key'         => 'frameRwidth',
			'name'        => $help1
				. $this->translate('(e.g.: 50)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter frame RIGHT width, if not set use frame TOP height value (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameRwidth'],
		);
		$settings[] = array(
			'key'         => 'frameBheight',
			'name'        => $help1
				. $this->translate('(e.g.: 50)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Enter frame BOTTOM height, if not set use frame TOP height value (px)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameBheight'],
		);
		$settings[] = array(
			'key'         => 'bgIframe',
			'name'        => $help1
				. $this->translate(
					'upload files under x_treme/templates/extra/backgrounds'
				)
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Enter file name and extension for image to use as Frame Background'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bgIframe'],
		);
		$settings[] = array(
			'key'         => 'frameFont',
			'name'        => $help1
				. $this->translate('(e.g.: Verdana, Arial, Helvetica)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter default FONT family'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFont'],
		);
		$settings[] = array(
			'key'         => 'frameFontColor',
			'name'        => $help1
				. $this->translate('(e.g.: #6f6f6f)')
				. $help2
				. 'XTREME FRAME' . $help3 . ' :: '
				. $this->translate('Enter default FONT COLOR'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontColor'],
		);
		$settings[] = array(
			'key'         => 'frameFontSize',
			'name'        => $help1
				. $this->translate('(e.g.: 12px or 1.3em)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter default FONT SIZE (px or em)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontSize'],
		);

		/**
		 ***************** PASSEPARTOUT settings ****************
		 */
		$settings[] = array(
			'key'   => 'framePP',
			'name'  => $help1
				. $this->translate('Show a PassePartout, costumize settings below')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Display a PASSEPARTOUT'),
			'type'  => 'checkbox',
			'value' => $params['framePP'],
		);
		$settings[] = array(
			'key'         => 'framePPColor',
			'name'        => $help1
				. $this->translate('(e.g.: #6f6f6f)')
				. $help2
				. 'XTREME FRAME' . $help3 . ' :: '
				. $this->translate('PassePartout COLOR'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPColor'],
		);
		$settings[] = array(
			'key'         => 'framePPTheight',
			'name'        => $help1
				. $this->translate('(e.g.: 20)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('PassePartout TOP height (px)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPTheight'],
		);
		$settings[] = array(
			'key'         => 'framePPLwidth',
			'name'        => $help1
				. $this->translate('(e.g.: 20)')
				. $help2
				. 'XTREME FRAME' . $help3 . ' :: '
				. $this->translate(
					'PassePartout LEFT width, if not set use PassePartout TOP height value (px)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPLwidth'],
		);
		$settings[] = array(
			'key'         => 'framePPRwidth',
			'name'        => $help1
				. $this->translate('(e.g.: 20)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'PassePartout RIGHT width, if not set use PassePartout TOP height value (px)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPRwidth'],
		);
		$settings[] = array(
			'key'         => 'framePPBheight',
			'name'        => $help1
				. $this->translate('(e.g.: 20)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'PassePartout BOTTOM height, '
					. 'if not set, use PassePartout TOP height value (px)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPBheight'],
		);
		$settings[] = array(
			'key'         => 'bgPP',
			'name'        => $help1
				. $this->translate('upload files under x_treme/templates/extra/backgrounds')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Enter file name and extension for image to use as PassePartout Background'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['bgPP'],
		);
		$settings[] = array(
			'key'         => 'framePPFont',
			'name'        => $help1
				. $this->translate('(e.g.: Verdana, Arial, Helvetica)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('PassePartout default FONT family'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPFont'],
		);
		$settings[] = array(
			'key'         => 'framePPFontColor',
			'name'        => $help1
				. $this->translate('(e.g.: #ffffff)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('PassePartout default FONT COLOR'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPFontColor'],
		);
		$settings[] = array(
			'key'         => 'framePPFontSize',
			'name'        => $help1
				. $this->translate('(e.g.: 10px or 1.1em)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('PassePartout default FONT SIZE (px or em)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['framePPFontSize'],
		);
		$settings[] = array(
			'key'     => 'frameParentTitle',
			'name'    => $help1
				. $this->translate('Select position to show Title at Frame or PassePartout')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Display Album TITLE'),
			'type'    => 'single-select',
			'choices' => array(
				'0'        => $this->translate('No'),
				'top'      => $this->translate('At the top of the Frame'),
				'bottom'   => $this->translate('At the bottom of the Frame'),
				'PPtop'    => $this->translate('At the top of the Passepartout'),
				'PPbottom' => $this->translate('At the bottom of the Passepartout'),
			),
			'value'   => $params['frameParentTitle'],
		);
		$settings[] = array(
			'key'         => 'frameParentPS',
			'name'        => $help1
				. $this->translate('Character(s) to display before and after title (e.g.: *)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Enter a PREFIX/SUFIX to display at "Album title"'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameParentPS'],
		);
		$settings[] = array(
			'key'         => 'frameFontParent',
			'name'        => $help1
				. $this->translate('(e.g.: Verdana, Arial, sans-serif)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Album title" FONT family'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontParent'],
		);
		$settings[] = array(
			'key'         => 'frameFontColorParent',
			'name'        => $help1
				. $this->translate('(e.g.: #6f6f6f)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Album title" FONT COLOR'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontColorParent'],
		);
		$settings[] = array(
			'key'         => 'frameFontSizeParent',
			'name'        => $help1
				. $this->translate('(e.g.: 12px or 1.2em)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Album title" FONT SIZE (px or em)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontSizeParent'],
		);
		$settings[] = array(
			'key'         => 'frameFontSpacingParent',
			'name'        => $help1
				. $this->translate('Space between characters (e.g.: 0.5em or 8px)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Album title" FONT SPACING (px or em)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontSpacingParent'],
		);
		$settings[] = array(
			'key'     => 'frameParentAlign',
			'name'    => $help1
				. $this->translate('Select how to align Title')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Select "Album title" ALIGNMENT'),
			'type'    => 'single-select',
			'choices' => array(
				'0'      => ' ',
				'left'   => $this->translate('Left'),
				'center' => $this->translate('Center'),
				'right'  => $this->translate('Right'),
			),
			'value'   => $params['frameParentAlign'],
		);
		$settings[] = array(
			'key'         => 'frameStyleParent',
			'name'        => $help1
				. $this->translate(
					'(e.g.: text-decoration:overline; font-style:italic; '
					. 'font-variant:small-caps; font-weight:900)'
				)
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Enter "Album title" STYLE (override all font settings)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameStyleParent'],
		);
		$settings[] = array(
			'key'     => 'frameItemTitle',
			'name'    => $help1
				. $this->translate('Select where to show Title at the Frame or PassePartout')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Display Item TITLE'),
			'type'    => 'single-select',
			'choices' => array(
				'0'        => $this->translate('No'),
				'top'      => $this->translate('At the top of the Frame'),
				'bottom'   => $this->translate('At the bottom of the Frame'),
				'PPtop'    => $this->translate('At the top of the Passepartout'),
				'PPbottom' => $this->translate('At the bottom of the Passepartout'),
			),
			'value'   => $params['frameItemTitle'],
		);
		$settings[] = array(
			'key'         => 'frameTitlePS',
			'name'        => $help1
				. $this->translate(
					'Character(s) to display before and after Title (e.g.: *)'
				)
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter a PREFIX/SUFIX to display at "Item title"'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameTitlePS'],
		);
		$settings[] = array(
			'key'         => 'frameFontTitle',
			'name'        => $help1
				. $this->translate('(e.g.: Verdana, Arial, sans-serif)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Item title" FONT family'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontTitle'],
		);
		$settings[] = array(
			'key'         => 'frameFontColorTitle',
			'name'        => $help1
				. $this->translate('(e.g.: #666666)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Item title" FONT COLOR'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontColorTitle'],
		);
		$settings[] = array(
			'key'         => 'frameFontSizeTitle',
			'name'        => $help1
				. $this->translate('(e.g.: 11px or 1.0em)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Item title" FONT SIZE (px or em)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontSizeTitle'],
		);
		$settings[] = array(
			'key'         => 'frameFontSpacingTitle',
			'name'        => $help1
				. $this->translate('Space between characters (e.g.: 0.5em or 6px)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Item title" FONT SPACING (px or em)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFontSpacingTitle'],
		);
		$settings[] = array(
			'key'     => 'frameTitleAlign',
			'name'    => $help1
				. $this->translate('Select Title alignment')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Select "Item title" ALIGNMENT at frame'),
			'type'    => 'single-select',
			'choices' => array(
				'0'      => ' ',
				'left'   => $this->translate('Left'),
				'center' => $this->translate('Center'),
				'right'  => $this->translate('Right'),
			),
			'value'   => $params['frameTitleAlign'],
		);
		$settings[] = array(
			'key'         => 'frameStyleTitle',
			'name'        => $help1
				. $this->translate('(e.g.: text-decoration:overline; font-style:italic)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Item title" STYLE (override all font settings)'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameStyleTitle'],
		);
		$settings[] = array(
			'key'     => 'frameItemDescription',
			'name'    => $help1
				. $this->translate(
					'Select where to show description at the Frame or PassePartout'
				)
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'Display Item DESCRIPTION'
				),
			'type'    => 'single-select',
			'choices' => array(
				'0'        => $this->translate('No'),
				'top'      => $this->translate('At the top of the Frame'),
				'bottom'   => $this->translate('At the bottom of the Frame'),
				'PPtop'    => $this->translate('At the top of the Passepartout'),
				'PPbottom' => $this->translate('At the bottom of the Passepartout'),
			),
			'value'   => $params['frameItemDescription'],
		);
		$settings[] = array(
			'key'     => 'frameDescriptionAlign',
			'name'    => $help1
				. $this->translate('Select description alignment')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Select "Item description" ALIGNMENT'),
			'type'    => 'single-select',
			'choices' => array(
				'0'      => ' ',
				'left'   => $this->translate('Left'),
				'center' => $this->translate('Center'),
				'right'  => $this->translate('Right'),
			),
			'value'   => $params['frameDescriptionAlign'],
		);
		$settings[] = array(
			'key'         => 'frameDescriptionStyle',
			'name'        => $help1
				. $this->translate('(e.g.: font-variant:small-caps; font-weight:900)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "Item description" STYLE'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameDescriptionStyle'],
		);
		$settings[] = array(
			'key'     => 'frameCopyright',
			'name'    => $help1
				. $this->translate('Select where to show copyright message')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Display COPYRIGHT'),
			'type'    => 'single-select',
			'choices' => array(
				'0'     => $this->translate('No'),
				'frame' => $this->translate('At the bottom of the Frame'),
				'PP'    => $this->translate('At the bottom of the Passepartout'),
			),
			'value'   => $params['frameCopyright'],
		);
		$settings[] = array(
			'key'         => 'frameCopyrightStyle',
			'name'        => $help1
				. $this->translate('(e.g.: text-decoration:overline; font-weight:bold)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "copyright" STYLE'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameCopyrightStyle'],
		);
		$settings[] = array(
			'key'         => 'frameFreeText1',
			'name'        => $help1
				. $this->translate('Enter any extra message')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Add any TEXT'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFreeText1'],
		);
		$settings[] = array(
			'key'         => 'frameFreeText1Style',
			'name'        => $help1
				. $this->translate('(e.g.: font-family:Arial; font-size:9px)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter "free text" STYLE'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFreeText1Style'],
		);
		$settings[] = array(
			'key'     => 'frameFreeText1pos',
			'name'    => $help1
				. $this-> translate('Select where to display the above entered text')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Select "free text" position'),
			'type'    => 'single-select',
			'choices' => array(
				'0'         => ' ',
				'topT'      => $this->translate(
					'On TOP of Frame before Title and Description'
				),
				'topB'      => $this->translate(
					'On TOP of Frame after Title" and "Description"'
				),
				'bottomT'   => $this->translate(
					'On BOTTOM of Frame before Title and Description'
				),
				'bottomB'   => $this->translate(
					'On BOTTOM of Frame after Title and Description'
				),
				'PPtopT'    => $this->translate(
					'On TOP of Passepartout before Title and Description'
				),
				'PPtopB'    => $this->translate(
					'On TOP of Passepartout after Title and Description'
				),
				'PPbottomT' => $this->translate(
					'On BOTTOM of Passepartout before Title and Description'
				),
				'PPbottomB' => $this->translate(
					'On BOTTOM of Passepartout after Title and Description'
				),
			),
			'value'   => $params['frameFreeText1pos'],
		);
		$settings[] = array(
			'key'         => 'frameFreeText2',
			'name'        => $help1
				. $this->translate(
					'Add Links using CustomFields module'
				)
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate(
					'More TEXT and/or external Links (add Link_URL and Link_Name fields ' .
					'to Photo Fields - CustomFields module required)'
				),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFreeText2'],
		);
		$settings[] = array(
			'key'         => 'frameFreeText2Style',
			'name'        => $help1
				. $this->translate('(e.g.: text-decoration:overline; font-weight:bold)')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Enter 2nd "free text" STYLE'),
			'type'        => 'text-field',
			'type-params' => array(
				'size' => 2,
			),
			'value'       => $params['frameFreeText2Style'],
		);
		$settings[] = array(
			'key'     => 'frameFreeText2pos',
			'name'    => $help1
				. $this-> translate('Select where to display the text entered above')
				. $help2
				. 'XTREME FRAME'
				. $help3
				. ' :: '
				. $this->translate('Select 2nd "free text" position'),
			'type'    => 'single-select',
			'choices' => array(
				'0'         => ' ',
				'topT'      => $this->translate(
					'On TOP of Frame before Title and Description'
				),
				'topB'      => $this->translate(
					'On TOP of Frame after Title" and "Description"'
				),
				'bottomT'   => $this->translate(
					'On BOTTOM of Frame before Title and Description'
				),
				'bottomB'   => $this->translate(
					'On BOTTOM of Frame after Title and Description'
				),
				'PPtopT'    => $this->translate(
					'On TOP of Passepartout before Title and Description'
				),
				'PPtopB'    => $this->translate(
					'On TOP of Passepartout after Title and Description'
				),
				'PPbottomT' => $this->translate(
					'On BOTTOM of Passepartout before Title and Description'
				),
				'PPbottomB' => $this->translate(
					'On BOTTOM of Passepartout after Title and Description'
				),
			),

			'value'   => $params['frameFreeText2pos'],
		);

		return array(null, $settings, $params);
	}

	/**
	 * @see GalleryTheme::validateSettings
	 */
	public function validateSettings($settings) {
		$error = parent::validateSettings($settings);

		if (empty($settings['columnsMT']) || !is_numeric($settings['columnsMT'])) {
			$error['columnsMT'] = $this->translate(
				'You must enter a number greater than 0'
			);
		}

		if (empty($settings['peerWindowSize']) || !is_numeric($settings['peerWindowSize'])) {
			$error['peerWindowSize'] = $this->translate(
				'You must enter a number greater than 0'
			);
		}

		foreach (array('albumSideBlocks', 'photoSideBlocks') as $blockKey) {
			if (isset($standard[$blockKey])) {
				if (!empty($settings[$blockKey])) {
					list($success, $newValue) = $this->packSetting(
						'block-list',
						$settings[$blockKey]
					);

					if (!$success) {
						$error[$blockKey] = $this->translate(
							'Format: [module.BlockName param=value] ...'
						);
					}
				}
			}
		}

		return $error;
	}

	/**
	 * @see GalleryTheme::showAlbumPage
	 */
	public function showAlbumPage(&$template, $item, $params, $childIds) {

		// NGD addition to redirect to photo page when album only contains photos.
		if (!empty($childIds) && ($params['enterAlbumDirect'] != 'none')) {
			$enterAlbum = 0;

			list($ret, $childEntities) = GalleryCoreApi::loadEntitiesById($childIds);

			if (!$ret) {
				foreach ($childEntities as $child) {
					if ($child->getCanContainChildren()) {
						if ($params['enterAlbumDirect'] == 'thumbs') {
							$enterAlbum = GalleryUtilities::getRequestVariables('enterAlbum');
						} elseif ($params['enterAlbumDirect'] == 'all') {
							$enterAlbum = 1;
						} else {
							$enterAlbum = 0;
						}
					} elseif ($params['enterAlbumDirect'] == 'thumbsNoAlbum'
						|| $params['enterAlbumDirect'] == 'thumbs'
					) {
						$enterAlbum = GalleryUtilities::getRequestVariables('enterAlbum');
					} elseif ($params['enterAlbumDirect'] == 'all'
						|| $params['enterAlbumDirect'] == 'allNoAlbum'
					) {
						$enterAlbum = 1;
					} else {
						$enterAlbum = 0;
					}
				}

				if (!empty($enterAlbum)) {
					return array(
						null,
						array(
							'redirect' => array(
								'view'   => 'core.ShowItem',
								'itemId' => $childIds[0],
							),
						),
					);
				}
			}
		}
		// End addition

		$dataTypes = array('imageViews');

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
			),
			$childIds,
			$dataTypes
		);

		if ($ret) {
			return array($ret, null);
		}

		// Add in our extra stuff
		$theme =& $template->getVariableByReference('theme');

		$theme['columnWidthPct'] = floor(100 / $params['columns']);

		list($ret, $pluginStatus) = GalleryCoreApi::fetchPluginStatus('module');

		if ($ret) {
			return array($ret, null);
		}
		$theme =& $template->getVariableByReference('theme');

		if (!empty($pluginStatus['slideshow']['active'])) {
			$theme['slideshow'] = 1;
		} else {
			$theme['slideshow'] = 0;
		}

		if (!empty($pluginStatus['zencart']['active'])) {
			$theme['zencart'] = 1;
		} else {
			$theme['zencart'] = 0;

			if (!empty($pluginStatus['cart']['active'])) {
				if (!empty($pluginStatus['checkout']['active'])) {
					$theme['cart'] = 3;

					if (!empty($pluginStatus['fotokasten']['active'])) {
						$theme['print'] = Fotokasten;
					}

					if (!empty($pluginStatus['shutterfly']['active'])) {
						$theme['print1'] = Shutterfly;
					}

					if (!empty($pluginStatus['photoaccess']['active'])) {
						$theme['print2'] = Photoaccess;
					}

					if (!empty($pluginStatus['photoworks']['active'])) {
						$theme['print3'] = Photoworks;
					}

					if (!empty($pluginStatus['digibug']['active'])) {
						$theme['print4'] = Digibug;
					}

					if (!empty($pluginStatus['snapgalaxy']['active'])) {
						$theme['print5'] = Snapgalaxy;
					}

					if (!empty($pluginStatus['zipcart']['active'])) {
						$theme['zipcart'] = 1;
					}
				} else {
					$theme['cart'] = 1;
				}
			} else {
				if (!empty($pluginStatus['checkout']['active'])) {
					$theme['cart'] = 2;
				} else {
					$theme['cart'] = 0;
				}
			}
		}

		if (!empty($pluginStatus['ecard']['active'])) {
			$theme['ecard'] = 1;
		} else {
			$theme['ecard'] = 0;
		}

		list($ret, $icons) = GalleryCoreApi::getPluginParameter(
			'module',
			'icons',
			'iconpack'
		);

		if ($ret) {
			return $ret;
		}

		if (!empty($icons)) {
			global $gallery;
			$theme['iconpack'] = $icons;
		}

		// Check for JavaScript warning flag
		if (GalleryUtilities::getRequestVariables('jsWarning') != null) {
			$template->setVariable('jsWarning', true);
		}

		// Add our header and styles
		return array(null, 'theme.tpl');
	}

	/**
	 * @see GalleryTheme::showPhotoPage
	 */
	public function showPhotoPage(&$template, $item, $params) {
		$dataTypes = array(
			'owner',
			'viewCount',
			'parents',
			'systemLinks',
			'itemLinks',
			'itemSummaries',
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
		list($ret, $pluginStatus) = GalleryCoreApi::fetchPluginStatus('module');

		if ($ret) {
			return array($ret, null);
		}
		$theme =& $template->getVariableByReference('theme');

		if (!empty($pluginStatus['slideshow']['active'])) {
			$theme['slideshow'] = 1;
		} else {
			$theme['slideshow'] = 0;
		}

		if (!empty($pluginStatus['zencart']['active'])) {
			$theme['zencart'] = 1;
		} else {
			$theme['zencart'] = 0;

			if (!empty($pluginStatus['cart']['active'])) {
				if (!empty($pluginStatus['checkout']['active'])) {
					$theme['cart'] = 3;

					if (!empty($pluginStatus['fotokasten']['active'])) {
						$theme['print'] = Fotokasten;
					}

					if (!empty($pluginStatus['shutterfly']['active'])) {
						$theme['print1'] = Shutterfly;
					}

					if (!empty($pluginStatus['photoaccess']['active'])) {
						$theme['print2'] = Photoaccess;
					}

					if (!empty($pluginStatus['photoworks']['active'])) {
						$theme['print3'] = Photoworks;
					}

					if (!empty($pluginStatus['digibug']['active'])) {
						$theme['print4'] = Digibug;
					}

					if (!empty($pluginStatus['snapgalaxy']['active'])) {
						$theme['print5'] = Snapgalaxy;
					}

					if (!empty($pluginStatus['zipcart']['active'])) {
						$theme['zipcart'] = 1;
					}
				} else {
					$theme['cart'] = 1;
				}
			} else {
				if (!empty($pluginStatus['checkout']['active'])) {
					$theme['cart'] = 2;
				} else {
					$theme['cart'] = 0;
				}
			}
		}

		if (!empty($pluginStatus['ecard']['active'])) {
			$theme['ecard'] = 1;
		} else {
			$theme['ecard'] = 0;
		}

		if (!empty($pluginStatus['panorama']['active'])) {
			if (GalleryUtilities::isA($item, 'GalleryPhotoItem')) {
				$theme['panoramaItem'] = 1;

				list($ret, $viewWidth) = GalleryCoreApi::getPluginParameter(
					'module',
					'panorama',
					'width'
				);

				if ($ret) {
					return array($ret, null);
				}
				$theme['panoramaWidth'] = $viewWidth;
			}
			$theme['panorama'] = 1;
		} else {
			$theme['panorama'] = 0;
		}

		if (!empty($pluginStatus['panoramajs']['active'])) {
			if (GalleryUtilities::isA($item, 'GalleryPhotoItem')) {
				$theme['panoramaItem'] = 1;

				list($ret, $viewWidth) = GalleryCoreApi::getPluginParameter(
					'module',
					'panoramajs',
					'width'
				);

				if ($ret) {
					return array($ret, null);
				}
				$theme['panoramaWidth'] = $viewWidth;
			}
			$theme['panorama'] = 1;
		} else {
			$theme['panorama'] = 0;
		}

		list($ret, $icons) = GalleryCoreApi::getPluginParameter(
			'module',
			'icons',
			'iconpack'
		);

		if ($ret) {
			return $ret;
		}

		if (!empty($icons)) {
			global $gallery;
			$theme['iconpack'] = $icons;
		}
		// Check for JavaScript warning flag
		if (GalleryUtilities::getRequestVariables('jsWarning') != null) {
			$template->setVariable('jsWarning', true);
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
			array('parents', 'systemLinks', 'owner')
		);

		if ($ret) {
			return array($ret, null);
		}

		$theme =& $template->getVariableByReference('theme');

		list($ret, $icons) = GalleryCoreApi::getPluginParameter(
			'module',
			'icons',
			'iconpack'
		);

		if ($ret) {
			return $ret;
		}

		if (!empty($icons)) {
			global $gallery;
			$theme['iconpack'] = $icons;
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
			array('parents', 'systemLinks', 'owner')
		);

		if ($ret) {
			return array($ret, null);
		}

		$theme =& $template->getVariableByReference('theme');

		list($ret, $icons) = GalleryCoreApi::getPluginParameter(
			'module',
			'icons',
			'iconpack'
		);

		if ($ret) {
			return $ret;
		}

		if (!empty($icons)) {
			global $gallery;
			$theme['iconpack'] = $icons;
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
