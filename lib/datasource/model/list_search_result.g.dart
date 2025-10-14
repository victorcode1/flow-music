// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListSearchResult _$ListSearchResultFromJson(Map<String, dynamic> json) =>
    _ListSearchResult(
      responseContext: json['responseContext'] == null
          ? null
          : ResponseContext.fromJson(
              json['responseContext'] as Map<String, dynamic>),
      contents: json['contents'] == null
          ? null
          : Contents.fromJson(json['contents'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$ListSearchResultToJson(_ListSearchResult instance) =>
    <String, dynamic>{
      'responseContext': instance.responseContext,
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
    };

_Contents _$ContentsFromJson(Map<String, dynamic> json) => _Contents(
      tabbedSearchResultsRenderer: json['tabbedSearchResultsRenderer'] == null
          ? null
          : TabbedSearchResultsRenderer.fromJson(
              json['tabbedSearchResultsRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentsToJson(_Contents instance) => <String, dynamic>{
      'tabbedSearchResultsRenderer': instance.tabbedSearchResultsRenderer,
    };

_TabbedSearchResultsRenderer _$TabbedSearchResultsRendererFromJson(
        Map<String, dynamic> json) =>
    _TabbedSearchResultsRenderer(
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => Tab.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabbedSearchResultsRendererToJson(
        _TabbedSearchResultsRenderer instance) =>
    <String, dynamic>{
      'tabs': instance.tabs,
    };

_Tab _$TabFromJson(Map<String, dynamic> json) => _Tab(
      tabRenderer: json['tabRenderer'] == null
          ? null
          : TabRenderer.fromJson(json['tabRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TabToJson(_Tab instance) => <String, dynamic>{
      'tabRenderer': instance.tabRenderer,
    };

_TabRenderer _$TabRendererFromJson(Map<String, dynamic> json) => _TabRenderer(
      title: json['title'] as String?,
      selected: json['selected'] as bool?,
      content: json['content'] == null
          ? null
          : TabRendererContent.fromJson(
              json['content'] as Map<String, dynamic>),
      tabIdentifier: json['tabIdentifier'] as String?,
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$TabRendererToJson(_TabRenderer instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selected': instance.selected,
      'content': instance.content,
      'tabIdentifier': instance.tabIdentifier,
      'trackingParams': instance.trackingParams,
    };

_TabRendererContent _$TabRendererContentFromJson(Map<String, dynamic> json) =>
    _TabRendererContent(
      sectionListRenderer: json['sectionListRenderer'] == null
          ? null
          : SectionListRenderer.fromJson(
              json['sectionListRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TabRendererContentToJson(_TabRendererContent instance) =>
    <String, dynamic>{
      'sectionListRenderer': instance.sectionListRenderer,
    };

_SectionListRenderer _$SectionListRendererFromJson(Map<String, dynamic> json) =>
    _SectionListRenderer(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) =>
              SectionListRendererContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SectionListRendererToJson(
        _SectionListRenderer instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
      'header': instance.header,
    };

_SectionListRendererContent _$SectionListRendererContentFromJson(
        Map<String, dynamic> json) =>
    _SectionListRendererContent(
      musicShelfRenderer: json['musicShelfRenderer'] == null
          ? null
          : MusicShelfRenderer.fromJson(
              json['musicShelfRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SectionListRendererContentToJson(
        _SectionListRendererContent instance) =>
    <String, dynamic>{
      'musicShelfRenderer': instance.musicShelfRenderer,
    };

_MusicShelfRenderer _$MusicShelfRendererFromJson(Map<String, dynamic> json) =>
    _MusicShelfRenderer(
      title: json['title'] == null
          ? null
          : Title.fromJson(json['title'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) =>
              MusicShelfRendererContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
      continuations: (json['continuations'] as List<dynamic>?)
          ?.map((e) => Continuation.fromJson(e as Map<String, dynamic>))
          .toList(),
      shelfDivider: json['shelfDivider'] == null
          ? null
          : ShelfDivider.fromJson(json['shelfDivider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicShelfRendererToJson(_MusicShelfRenderer instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
      'continuations': instance.continuations,
      'shelfDivider': instance.shelfDivider,
    };

_MusicResponsiveListItemRenderer _$MusicResponsiveListItemRendererFromJson(
        Map<String, dynamic> json) =>
    _MusicResponsiveListItemRenderer(
      trackingParams: json['trackingParams'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : MusicResponsiveListItemRendererThumbnail.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
      overlay: json['overlay'] == null
          ? null
          : Overlay.fromJson(json['overlay'] as Map<String, dynamic>),
      flexColumns: (json['flexColumns'] as List<dynamic>?)
          ?.map((e) => FlexColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      menu: json['menu'] == null
          ? null
          : Menu.fromJson(json['menu'] as Map<String, dynamic>),
      playlistItemData: json['playlistItemData'] == null
          ? null
          : PlaylistItemData.fromJson(
              json['playlistItemData'] as Map<String, dynamic>),
      flexColumnDisplayStyle: json['flexColumnDisplayStyle'] as String?,
      itemHeight: json['itemHeight'] as String?,
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusicResponsiveListItemRendererToJson(
        _MusicResponsiveListItemRenderer instance) =>
    <String, dynamic>{
      'trackingParams': instance.trackingParams,
      'thumbnail': instance.thumbnail,
      'overlay': instance.overlay,
      'flexColumns': instance.flexColumns,
      'menu': instance.menu,
      'playlistItemData': instance.playlistItemData,
      'flexColumnDisplayStyle': instance.flexColumnDisplayStyle,
      'itemHeight': instance.itemHeight,
      'badges': instance.badges,
    };

_Badge _$BadgeFromJson(Map<String, dynamic> json) => _Badge(
      musicInlineBadgeRenderer: json['musicInlineBadgeRenderer'] == null
          ? null
          : MusicInlineBadgeRenderer.fromJson(
              json['musicInlineBadgeRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BadgeToJson(_Badge instance) => <String, dynamic>{
      'musicInlineBadgeRenderer': instance.musicInlineBadgeRenderer,
    };

_MusicInlineBadgeRenderer _$MusicInlineBadgeRendererFromJson(
        Map<String, dynamic> json) =>
    _MusicInlineBadgeRenderer(
      trackingParams: json['trackingParams'] as String?,
      icon: json['icon'] == null
          ? null
          : Icon.fromJson(json['icon'] as Map<String, dynamic>),
      accessibilityData: json['accessibilityData'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibilityData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicInlineBadgeRendererToJson(
        _MusicInlineBadgeRenderer instance) =>
    <String, dynamic>{
      'trackingParams': instance.trackingParams,
      'icon': instance.icon,
      'accessibilityData': instance.accessibilityData,
    };

_Accessibility _$AccessibilityFromJson(Map<String, dynamic> json) =>
    _Accessibility(
      accessibilityData: json['accessibilityData'] == null
          ? null
          : AccessibilityData.fromJson(
              json['accessibilityData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessibilityToJson(_Accessibility instance) =>
    <String, dynamic>{
      'accessibilityData': instance.accessibilityData,
    };

_AccessibilityData _$AccessibilityDataFromJson(Map<String, dynamic> json) =>
    _AccessibilityData(
      label: json['label'] as String?,
    );

Map<String, dynamic> _$AccessibilityDataToJson(_AccessibilityData instance) =>
    <String, dynamic>{
      'label': instance.label,
    };

_Icon _$IconFromJson(Map<String, dynamic> json) => _Icon(
      iconType: json['iconType'] as String?,
    );

Map<String, dynamic> _$IconToJson(_Icon instance) => <String, dynamic>{
      'iconType': instance.iconType,
    };

_FlexColumn _$FlexColumnFromJson(Map<String, dynamic> json) => _FlexColumn(
      musicResponsiveListItemFlexColumnRenderer:
          json['musicResponsiveListItemFlexColumnRenderer'] == null
              ? null
              : MusicResponsiveListItemFlexColumnRenderer.fromJson(
                  json['musicResponsiveListItemFlexColumnRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlexColumnToJson(_FlexColumn instance) =>
    <String, dynamic>{
      'musicResponsiveListItemFlexColumnRenderer':
          instance.musicResponsiveListItemFlexColumnRenderer,
    };

_MusicResponsiveListItemFlexColumnRenderer
    _$MusicResponsiveListItemFlexColumnRendererFromJson(
            Map<String, dynamic> json) =>
        _MusicResponsiveListItemFlexColumnRenderer(
          text: json['text'] == null
              ? null
              : Text.fromJson(json['text'] as Map<String, dynamic>),
          displayPriority: json['displayPriority'] as String?,
        );

Map<String, dynamic> _$MusicResponsiveListItemFlexColumnRendererToJson(
        _MusicResponsiveListItemFlexColumnRenderer instance) =>
    <String, dynamic>{
      'text': instance.text,
      'displayPriority': instance.displayPriority,
    };

_Text _$TextFromJson(Map<String, dynamic> json) => _Text(
      runs: (json['runs'] as List<dynamic>?)
          ?.map((e) => PurpleRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TextToJson(_Text instance) => <String, dynamic>{
      'runs': instance.runs,
    };

_PurpleRun _$PurpleRunFromJson(Map<String, dynamic> json) => _PurpleRun(
      text: json['text'] as String?,
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : RunNavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurpleRunToJson(_PurpleRun instance) =>
    <String, dynamic>{
      'text': instance.text,
      'navigationEndpoint': instance.navigationEndpoint,
    };

_RunNavigationEndpoint _$RunNavigationEndpointFromJson(
        Map<String, dynamic> json) =>
    _RunNavigationEndpoint(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      watchEndpoint: json['watchEndpoint'] == null
          ? null
          : PlayNavigationEndpointWatchEndpoint.fromJson(
              json['watchEndpoint'] as Map<String, dynamic>),
      browseEndpoint: json['browseEndpoint'] == null
          ? null
          : BrowseEndpoint.fromJson(
              json['browseEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunNavigationEndpointToJson(
        _RunNavigationEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
      'browseEndpoint': instance.browseEndpoint,
    };

_BrowseEndpoint _$BrowseEndpointFromJson(Map<String, dynamic> json) =>
    _BrowseEndpoint(
      browseId: json['browseId'] as String?,
      browseEndpointContextSupportedConfigs:
          json['browseEndpointContextSupportedConfigs'] == null
              ? null
              : BrowseEndpointContextSupportedConfigs.fromJson(
                  json['browseEndpointContextSupportedConfigs']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseEndpointToJson(_BrowseEndpoint instance) =>
    <String, dynamic>{
      'browseId': instance.browseId,
      'browseEndpointContextSupportedConfigs':
          instance.browseEndpointContextSupportedConfigs,
    };

_BrowseEndpointContextSupportedConfigs
    _$BrowseEndpointContextSupportedConfigsFromJson(
            Map<String, dynamic> json) =>
        _BrowseEndpointContextSupportedConfigs(
          browseEndpointContextMusicConfig:
              json['browseEndpointContextMusicConfig'] == null
                  ? null
                  : BrowseEndpointContextMusicConfig.fromJson(
                      json['browseEndpointContextMusicConfig']
                          as Map<String, dynamic>),
        );

Map<String, dynamic> _$BrowseEndpointContextSupportedConfigsToJson(
        _BrowseEndpointContextSupportedConfigs instance) =>
    <String, dynamic>{
      'browseEndpointContextMusicConfig':
          instance.browseEndpointContextMusicConfig,
    };

_BrowseEndpointContextMusicConfig _$BrowseEndpointContextMusicConfigFromJson(
        Map<String, dynamic> json) =>
    _BrowseEndpointContextMusicConfig(
      pageType: json['pageType'] as String?,
    );

Map<String, dynamic> _$BrowseEndpointContextMusicConfigToJson(
        _BrowseEndpointContextMusicConfig instance) =>
    <String, dynamic>{
      'pageType': instance.pageType,
    };

_PlayNavigationEndpointWatchEndpoint
    _$PlayNavigationEndpointWatchEndpointFromJson(Map<String, dynamic> json) =>
        _PlayNavigationEndpointWatchEndpoint(
          videoId: json['videoId'] as String?,
          watchEndpointMusicSupportedConfigs:
              json['watchEndpointMusicSupportedConfigs'] == null
                  ? null
                  : WatchEndpointMusicSupportedConfigs.fromJson(
                      json['watchEndpointMusicSupportedConfigs']
                          as Map<String, dynamic>),
        );

Map<String, dynamic> _$PlayNavigationEndpointWatchEndpointToJson(
        _PlayNavigationEndpointWatchEndpoint instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'watchEndpointMusicSupportedConfigs':
          instance.watchEndpointMusicSupportedConfigs,
    };

_WatchEndpointMusicSupportedConfigs
    _$WatchEndpointMusicSupportedConfigsFromJson(Map<String, dynamic> json) =>
        _WatchEndpointMusicSupportedConfigs(
          watchEndpointMusicConfig: json['watchEndpointMusicConfig'] == null
              ? null
              : WatchEndpointMusicConfig.fromJson(
                  json['watchEndpointMusicConfig'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$WatchEndpointMusicSupportedConfigsToJson(
        _WatchEndpointMusicSupportedConfigs instance) =>
    <String, dynamic>{
      'watchEndpointMusicConfig': instance.watchEndpointMusicConfig,
    };

_WatchEndpointMusicConfig _$WatchEndpointMusicConfigFromJson(
        Map<String, dynamic> json) =>
    _WatchEndpointMusicConfig(
      musicVideoType: json['musicVideoType'] as String?,
    );

Map<String, dynamic> _$WatchEndpointMusicConfigToJson(
        _WatchEndpointMusicConfig instance) =>
    <String, dynamic>{
      'musicVideoType': instance.musicVideoType,
    };

_Menu _$MenuFromJson(Map<String, dynamic> json) => _Menu(
      menuRenderer: json['menuRenderer'] == null
          ? null
          : MenuRenderer.fromJson(json['menuRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuToJson(_Menu instance) => <String, dynamic>{
      'menuRenderer': instance.menuRenderer,
    };

_MenuRenderer _$MenuRendererFromJson(Map<String, dynamic> json) =>
    _MenuRenderer(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
      accessibility: json['accessibility'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuRendererToJson(_MenuRenderer instance) =>
    <String, dynamic>{
      'items': instance.items,
      'trackingParams': instance.trackingParams,
      'accessibility': instance.accessibility,
    };

_ItemElement _$ItemElementFromJson(Map<String, dynamic> json) => _ItemElement(
      menuNavigationItemRenderer: json['menuNavigationItemRenderer'] == null
          ? null
          : MenuItemRenderer.fromJson(
              json['menuNavigationItemRenderer'] as Map<String, dynamic>),
      menuServiceItemRenderer: json['menuServiceItemRenderer'] == null
          ? null
          : MenuItemRenderer.fromJson(
              json['menuServiceItemRenderer'] as Map<String, dynamic>),
      toggleMenuServiceItemRenderer: json['toggleMenuServiceItemRenderer'] ==
              null
          ? null
          : ToggleMenuServiceItemRenderer.fromJson(
              json['toggleMenuServiceItemRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemElementToJson(_ItemElement instance) =>
    <String, dynamic>{
      'menuNavigationItemRenderer': instance.menuNavigationItemRenderer,
      'menuServiceItemRenderer': instance.menuServiceItemRenderer,
      'toggleMenuServiceItemRenderer': instance.toggleMenuServiceItemRenderer,
    };

_MenuItemRenderer _$MenuItemRendererFromJson(Map<String, dynamic> json) =>
    _MenuItemRenderer(
      text: json['text'] == null
          ? null
          : Title.fromJson(json['text'] as Map<String, dynamic>),
      icon: json['icon'] == null
          ? null
          : Icon.fromJson(json['icon'] as Map<String, dynamic>),
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : MenuNavigationItemRendererNavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
      serviceEndpoint: json['serviceEndpoint'] == null
          ? null
          : ServiceEndpoint.fromJson(
              json['serviceEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuItemRendererToJson(_MenuItemRenderer instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
      'serviceEndpoint': instance.serviceEndpoint,
    };

_MenuNavigationItemRendererNavigationEndpoint
    _$MenuNavigationItemRendererNavigationEndpointFromJson(
            Map<String, dynamic> json) =>
        _MenuNavigationItemRendererNavigationEndpoint(
          clickTrackingParams: json['clickTrackingParams'] as String?,
          watchEndpoint: json['watchEndpoint'] == null
              ? null
              : PurpleWatchEndpoint.fromJson(
                  json['watchEndpoint'] as Map<String, dynamic>),
          modalEndpoint: json['modalEndpoint'] == null
              ? null
              : ModalEndpoint.fromJson(
                  json['modalEndpoint'] as Map<String, dynamic>),
          browseEndpoint: json['browseEndpoint'] == null
              ? null
              : BrowseEndpoint.fromJson(
                  json['browseEndpoint'] as Map<String, dynamic>),
          shareEntityEndpoint: json['shareEntityEndpoint'] == null
              ? null
              : ShareEntityEndpoint.fromJson(
                  json['shareEntityEndpoint'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MenuNavigationItemRendererNavigationEndpointToJson(
        _MenuNavigationItemRendererNavigationEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
      'modalEndpoint': instance.modalEndpoint,
      'browseEndpoint': instance.browseEndpoint,
      'shareEntityEndpoint': instance.shareEntityEndpoint,
    };

_Title _$TitleFromJson(Map<String, dynamic> json) => _Title(
      runs: (json['runs'] as List<dynamic>?)
          ?.map((e) => TitleRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TitleToJson(_Title instance) => <String, dynamic>{
      'runs': instance.runs,
    };

_TitleRun _$TitleRunFromJson(Map<String, dynamic> json) => _TitleRun(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TitleRunToJson(_TitleRun instance) => <String, dynamic>{
      'text': instance.text,
    };

_ShareEntityEndpoint _$ShareEntityEndpointFromJson(Map<String, dynamic> json) =>
    _ShareEntityEndpoint(
      serializedShareEntity: json['serializedShareEntity'] as String?,
      sharePanelType: json['sharePanelType'] as String?,
    );

Map<String, dynamic> _$ShareEntityEndpointToJson(
        _ShareEntityEndpoint instance) =>
    <String, dynamic>{
      'serializedShareEntity': instance.serializedShareEntity,
      'sharePanelType': instance.sharePanelType,
    };

_ModalEndpoint _$ModalEndpointFromJson(Map<String, dynamic> json) =>
    _ModalEndpoint(
      modal: json['modal'] == null
          ? null
          : Modal.fromJson(json['modal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModalEndpointToJson(_ModalEndpoint instance) =>
    <String, dynamic>{
      'modal': instance.modal,
    };

_Modal _$ModalFromJson(Map<String, dynamic> json) => _Modal(
      modalWithTitleAndButtonRenderer:
          json['modalWithTitleAndButtonRenderer'] == null
              ? null
              : ModalWithTitleAndButtonRenderer.fromJson(
                  json['modalWithTitleAndButtonRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModalToJson(_Modal instance) => <String, dynamic>{
      'modalWithTitleAndButtonRenderer':
          instance.modalWithTitleAndButtonRenderer,
    };

_ModalWithTitleAndButtonRenderer _$ModalWithTitleAndButtonRendererFromJson(
        Map<String, dynamic> json) =>
    _ModalWithTitleAndButtonRenderer(
      title: json['title'] == null
          ? null
          : Title.fromJson(json['title'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : Title.fromJson(json['content'] as Map<String, dynamic>),
      button: json['button'] == null
          ? null
          : Button.fromJson(json['button'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModalWithTitleAndButtonRendererToJson(
        _ModalWithTitleAndButtonRenderer instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'button': instance.button,
    };

_Button _$ButtonFromJson(Map<String, dynamic> json) => _Button(
      buttonRenderer: json['buttonRenderer'] == null
          ? null
          : ButtonRenderer.fromJson(
              json['buttonRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ButtonToJson(_Button instance) => <String, dynamic>{
      'buttonRenderer': instance.buttonRenderer,
    };

_ButtonRenderer _$ButtonRendererFromJson(Map<String, dynamic> json) =>
    _ButtonRenderer(
      style: json['style'] as String?,
      isDisabled: json['isDisabled'] as bool?,
      text: json['text'] == null
          ? null
          : Title.fromJson(json['text'] as Map<String, dynamic>),
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : ButtonRendererNavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$ButtonRendererToJson(_ButtonRenderer instance) =>
    <String, dynamic>{
      'style': instance.style,
      'isDisabled': instance.isDisabled,
      'text': instance.text,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
    };

_ButtonRendererNavigationEndpoint _$ButtonRendererNavigationEndpointFromJson(
        Map<String, dynamic> json) =>
    _ButtonRendererNavigationEndpoint(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      signInEndpoint: json['signInEndpoint'] == null
          ? null
          : SignInEndpoint.fromJson(
              json['signInEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ButtonRendererNavigationEndpointToJson(
        _ButtonRendererNavigationEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'signInEndpoint': instance.signInEndpoint,
    };

_SignInEndpoint _$SignInEndpointFromJson(Map<String, dynamic> json) =>
    _SignInEndpoint(
      hack: json['hack'] as bool?,
    );

Map<String, dynamic> _$SignInEndpointToJson(_SignInEndpoint instance) =>
    <String, dynamic>{
      'hack': instance.hack,
    };

_PurpleWatchEndpoint _$PurpleWatchEndpointFromJson(Map<String, dynamic> json) =>
    _PurpleWatchEndpoint(
      videoId: json['videoId'] as String?,
      playlistId: json['playlistId'] as String?,
      params: json['params'] as String?,
      loggingContext: json['loggingContext'] == null
          ? null
          : LoggingContext.fromJson(
              json['loggingContext'] as Map<String, dynamic>),
      watchEndpointMusicSupportedConfigs:
          json['watchEndpointMusicSupportedConfigs'] == null
              ? null
              : WatchEndpointMusicSupportedConfigs.fromJson(
                  json['watchEndpointMusicSupportedConfigs']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurpleWatchEndpointToJson(
        _PurpleWatchEndpoint instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'playlistId': instance.playlistId,
      'params': instance.params,
      'loggingContext': instance.loggingContext,
      'watchEndpointMusicSupportedConfigs':
          instance.watchEndpointMusicSupportedConfigs,
    };

_LoggingContext _$LoggingContextFromJson(Map<String, dynamic> json) =>
    _LoggingContext(
      vssLoggingContext: json['vssLoggingContext'] == null
          ? null
          : VssLoggingContext.fromJson(
              json['vssLoggingContext'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoggingContextToJson(_LoggingContext instance) =>
    <String, dynamic>{
      'vssLoggingContext': instance.vssLoggingContext,
    };

_VssLoggingContext _$VssLoggingContextFromJson(Map<String, dynamic> json) =>
    _VssLoggingContext(
      serializedContextData: json['serializedContextData'] as String?,
    );

Map<String, dynamic> _$VssLoggingContextToJson(_VssLoggingContext instance) =>
    <String, dynamic>{
      'serializedContextData': instance.serializedContextData,
    };

_ServiceEndpoint _$ServiceEndpointFromJson(Map<String, dynamic> json) =>
    _ServiceEndpoint(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      queueAddEndpoint: json['queueAddEndpoint'] == null
          ? null
          : QueueAddEndpoint.fromJson(
              json['queueAddEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceEndpointToJson(_ServiceEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'queueAddEndpoint': instance.queueAddEndpoint,
    };

_QueueAddEndpoint _$QueueAddEndpointFromJson(Map<String, dynamic> json) =>
    _QueueAddEndpoint(
      queueTarget: json['queueTarget'] == null
          ? null
          : QueueTarget.fromJson(json['queueTarget'] as Map<String, dynamic>),
      queueInsertPosition: json['queueInsertPosition'] as String?,
      commands: (json['commands'] as List<dynamic>?)
          ?.map((e) => Command.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QueueAddEndpointToJson(_QueueAddEndpoint instance) =>
    <String, dynamic>{
      'queueTarget': instance.queueTarget,
      'queueInsertPosition': instance.queueInsertPosition,
      'commands': instance.commands,
    };

_Command _$CommandFromJson(Map<String, dynamic> json) => _Command(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      addToToastAction: json['addToToastAction'] == null
          ? null
          : AddToToastAction.fromJson(
              json['addToToastAction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommandToJson(_Command instance) => <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'addToToastAction': instance.addToToastAction,
    };

_AddToToastAction _$AddToToastActionFromJson(Map<String, dynamic> json) =>
    _AddToToastAction(
      item: json['item'] == null
          ? null
          : AddToToastActionItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToToastActionToJson(_AddToToastAction instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_AddToToastActionItem _$AddToToastActionItemFromJson(
        Map<String, dynamic> json) =>
    _AddToToastActionItem(
      notificationTextRenderer: json['notificationTextRenderer'] == null
          ? null
          : NotificationTextRenderer.fromJson(
              json['notificationTextRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToToastActionItemToJson(
        _AddToToastActionItem instance) =>
    <String, dynamic>{
      'notificationTextRenderer': instance.notificationTextRenderer,
    };

_NotificationTextRenderer _$NotificationTextRendererFromJson(
        Map<String, dynamic> json) =>
    _NotificationTextRenderer(
      successResponseText: json['successResponseText'] == null
          ? null
          : Title.fromJson(json['successResponseText'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$NotificationTextRendererToJson(
        _NotificationTextRenderer instance) =>
    <String, dynamic>{
      'successResponseText': instance.successResponseText,
      'trackingParams': instance.trackingParams,
    };

_QueueTarget _$QueueTargetFromJson(Map<String, dynamic> json) => _QueueTarget(
      videoId: json['videoId'] as String?,
      onEmptyQueue: json['onEmptyQueue'] == null
          ? null
          : OnEmptyQueue.fromJson(json['onEmptyQueue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueueTargetToJson(_QueueTarget instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'onEmptyQueue': instance.onEmptyQueue,
    };

_OnEmptyQueue _$OnEmptyQueueFromJson(Map<String, dynamic> json) =>
    _OnEmptyQueue(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      watchEndpoint: json['watchEndpoint'] == null
          ? null
          : PlaylistItemData.fromJson(
              json['watchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnEmptyQueueToJson(_OnEmptyQueue instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
    };

_PlaylistItemData _$PlaylistItemDataFromJson(Map<String, dynamic> json) =>
    _PlaylistItemData(
      videoId: json['videoId'] as String?,
    );

Map<String, dynamic> _$PlaylistItemDataToJson(_PlaylistItemData instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
    };

_ToggleMenuServiceItemRenderer _$ToggleMenuServiceItemRendererFromJson(
        Map<String, dynamic> json) =>
    _ToggleMenuServiceItemRenderer(
      defaultText: json['defaultText'] == null
          ? null
          : Title.fromJson(json['defaultText'] as Map<String, dynamic>),
      defaultIcon: json['defaultIcon'] == null
          ? null
          : Icon.fromJson(json['defaultIcon'] as Map<String, dynamic>),
      defaultServiceEndpoint: json['defaultServiceEndpoint'] == null
          ? null
          : DefaultServiceEndpoint.fromJson(
              json['defaultServiceEndpoint'] as Map<String, dynamic>),
      toggledText: json['toggledText'] == null
          ? null
          : Title.fromJson(json['toggledText'] as Map<String, dynamic>),
      toggledIcon: json['toggledIcon'] == null
          ? null
          : Icon.fromJson(json['toggledIcon'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$ToggleMenuServiceItemRendererToJson(
        _ToggleMenuServiceItemRenderer instance) =>
    <String, dynamic>{
      'defaultText': instance.defaultText,
      'defaultIcon': instance.defaultIcon,
      'defaultServiceEndpoint': instance.defaultServiceEndpoint,
      'toggledText': instance.toggledText,
      'toggledIcon': instance.toggledIcon,
      'trackingParams': instance.trackingParams,
    };

_DefaultServiceEndpoint _$DefaultServiceEndpointFromJson(
        Map<String, dynamic> json) =>
    _DefaultServiceEndpoint(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      modalEndpoint: json['modalEndpoint'] == null
          ? null
          : ModalEndpoint.fromJson(
              json['modalEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DefaultServiceEndpointToJson(
        _DefaultServiceEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'modalEndpoint': instance.modalEndpoint,
    };

_Overlay _$OverlayFromJson(Map<String, dynamic> json) => _Overlay(
      musicItemThumbnailOverlayRenderer:
          json['musicItemThumbnailOverlayRenderer'] == null
              ? null
              : MusicItemThumbnailOverlayRenderer.fromJson(
                  json['musicItemThumbnailOverlayRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$OverlayToJson(_Overlay instance) => <String, dynamic>{
      'musicItemThumbnailOverlayRenderer':
          instance.musicItemThumbnailOverlayRenderer,
    };

_MusicItemThumbnailOverlayRenderer _$MusicItemThumbnailOverlayRendererFromJson(
        Map<String, dynamic> json) =>
    _MusicItemThumbnailOverlayRenderer(
      background: json['background'] == null
          ? null
          : Background.fromJson(json['background'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : MusicItemThumbnailOverlayRendererContent.fromJson(
              json['content'] as Map<String, dynamic>),
      contentPosition: json['contentPosition'] as String?,
      displayStyle: json['displayStyle'] as String?,
    );

Map<String, dynamic> _$MusicItemThumbnailOverlayRendererToJson(
        _MusicItemThumbnailOverlayRenderer instance) =>
    <String, dynamic>{
      'background': instance.background,
      'content': instance.content,
      'contentPosition': instance.contentPosition,
      'displayStyle': instance.displayStyle,
    };

_Background _$BackgroundFromJson(Map<String, dynamic> json) => _Background(
      verticalGradient: json['verticalGradient'] == null
          ? null
          : VerticalGradient.fromJson(
              json['verticalGradient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackgroundToJson(_Background instance) =>
    <String, dynamic>{
      'verticalGradient': instance.verticalGradient,
    };

_VerticalGradient _$VerticalGradientFromJson(Map<String, dynamic> json) =>
    _VerticalGradient(
      gradientLayerColors: (json['gradientLayerColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VerticalGradientToJson(_VerticalGradient instance) =>
    <String, dynamic>{
      'gradientLayerColors': instance.gradientLayerColors,
    };

_MusicItemThumbnailOverlayRendererContent
    _$MusicItemThumbnailOverlayRendererContentFromJson(
            Map<String, dynamic> json) =>
        _MusicItemThumbnailOverlayRendererContent(
          musicPlayButtonRenderer: json['musicPlayButtonRenderer'] == null
              ? null
              : MusicPlayButtonRenderer.fromJson(
                  json['musicPlayButtonRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MusicItemThumbnailOverlayRendererContentToJson(
        _MusicItemThumbnailOverlayRendererContent instance) =>
    <String, dynamic>{
      'musicPlayButtonRenderer': instance.musicPlayButtonRenderer,
    };

_MusicPlayButtonRenderer _$MusicPlayButtonRendererFromJson(
        Map<String, dynamic> json) =>
    _MusicPlayButtonRenderer(
      playNavigationEndpoint: json['playNavigationEndpoint'] == null
          ? null
          : PlayNavigationEndpoint.fromJson(
              json['playNavigationEndpoint'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
      playIcon: json['playIcon'] == null
          ? null
          : Icon.fromJson(json['playIcon'] as Map<String, dynamic>),
      pauseIcon: json['pauseIcon'] == null
          ? null
          : Icon.fromJson(json['pauseIcon'] as Map<String, dynamic>),
      iconColor: (json['iconColor'] as num?)?.toInt(),
      backgroundColor: (json['backgroundColor'] as num?)?.toInt(),
      activeBackgroundColor: (json['activeBackgroundColor'] as num?)?.toInt(),
      loadingIndicatorColor: (json['loadingIndicatorColor'] as num?)?.toInt(),
      playingIcon: json['playingIcon'] == null
          ? null
          : Icon.fromJson(json['playingIcon'] as Map<String, dynamic>),
      iconLoadingColor: (json['iconLoadingColor'] as num?)?.toInt(),
      activeScaleFactor: (json['activeScaleFactor'] as num?)?.toInt(),
      buttonSize: json['buttonSize'] as String?,
      rippleTarget: json['rippleTarget'] as String?,
      accessibilityPlayData: json['accessibilityPlayData'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibilityPlayData'] as Map<String, dynamic>),
      accessibilityPauseData: json['accessibilityPauseData'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibilityPauseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicPlayButtonRendererToJson(
        _MusicPlayButtonRenderer instance) =>
    <String, dynamic>{
      'playNavigationEndpoint': instance.playNavigationEndpoint,
      'trackingParams': instance.trackingParams,
      'playIcon': instance.playIcon,
      'pauseIcon': instance.pauseIcon,
      'iconColor': instance.iconColor,
      'backgroundColor': instance.backgroundColor,
      'activeBackgroundColor': instance.activeBackgroundColor,
      'loadingIndicatorColor': instance.loadingIndicatorColor,
      'playingIcon': instance.playingIcon,
      'iconLoadingColor': instance.iconLoadingColor,
      'activeScaleFactor': instance.activeScaleFactor,
      'buttonSize': instance.buttonSize,
      'rippleTarget': instance.rippleTarget,
      'accessibilityPlayData': instance.accessibilityPlayData,
      'accessibilityPauseData': instance.accessibilityPauseData,
    };

_PlayNavigationEndpoint _$PlayNavigationEndpointFromJson(
        Map<String, dynamic> json) =>
    _PlayNavigationEndpoint(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      watchEndpoint: json['watchEndpoint'] == null
          ? null
          : PlayNavigationEndpointWatchEndpoint.fromJson(
              json['watchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayNavigationEndpointToJson(
        _PlayNavigationEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
    };

_MusicResponsiveListItemRendererThumbnail
    _$MusicResponsiveListItemRendererThumbnailFromJson(
            Map<String, dynamic> json) =>
        _MusicResponsiveListItemRendererThumbnail(
          musicThumbnailRenderer: json['musicThumbnailRenderer'] == null
              ? null
              : MusicThumbnailRenderer.fromJson(
                  json['musicThumbnailRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MusicResponsiveListItemRendererThumbnailToJson(
        _MusicResponsiveListItemRendererThumbnail instance) =>
    <String, dynamic>{
      'musicThumbnailRenderer': instance.musicThumbnailRenderer,
    };

_MusicThumbnailRenderer _$MusicThumbnailRendererFromJson(
        Map<String, dynamic> json) =>
    _MusicThumbnailRenderer(
      thumbnail: json['thumbnail'] == null
          ? null
          : MusicThumbnailRendererThumbnail.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
      thumbnailCrop: json['thumbnailCrop'] as String?,
      thumbnailScale: json['thumbnailScale'] as String?,
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$MusicThumbnailRendererToJson(
        _MusicThumbnailRenderer instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'thumbnailCrop': instance.thumbnailCrop,
      'thumbnailScale': instance.thumbnailScale,
      'trackingParams': instance.trackingParams,
    };

_MusicThumbnailRendererThumbnail _$MusicThumbnailRendererThumbnailFromJson(
        Map<String, dynamic> json) =>
    _MusicThumbnailRendererThumbnail(
      thumbnails: (json['thumbnails'] as List<dynamic>?)
          ?.map((e) => ThumbnailElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusicThumbnailRendererThumbnailToJson(
        _MusicThumbnailRendererThumbnail instance) =>
    <String, dynamic>{
      'thumbnails': instance.thumbnails,
    };

_ThumbnailElement _$ThumbnailElementFromJson(Map<String, dynamic> json) =>
    _ThumbnailElement(
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ThumbnailElementToJson(_ThumbnailElement instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_Continuation _$ContinuationFromJson(Map<String, dynamic> json) =>
    _Continuation(
      nextContinuationData: json['nextContinuationData'] == null
          ? null
          : NextContinuationData.fromJson(
              json['nextContinuationData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContinuationToJson(_Continuation instance) =>
    <String, dynamic>{
      'nextContinuationData': instance.nextContinuationData,
    };

_NextContinuationData _$NextContinuationDataFromJson(
        Map<String, dynamic> json) =>
    _NextContinuationData(
      continuation: json['continuation'] as String?,
      clickTrackingParams: json['clickTrackingParams'] as String?,
    );

Map<String, dynamic> _$NextContinuationDataToJson(
        _NextContinuationData instance) =>
    <String, dynamic>{
      'continuation': instance.continuation,
      'clickTrackingParams': instance.clickTrackingParams,
    };

_ShelfDivider _$ShelfDividerFromJson(Map<String, dynamic> json) =>
    _ShelfDivider(
      musicShelfDividerRenderer: json['musicShelfDividerRenderer'] == null
          ? null
          : MusicShelfDividerRenderer.fromJson(
              json['musicShelfDividerRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShelfDividerToJson(_ShelfDivider instance) =>
    <String, dynamic>{
      'musicShelfDividerRenderer': instance.musicShelfDividerRenderer,
    };

_MusicShelfDividerRenderer _$MusicShelfDividerRendererFromJson(
        Map<String, dynamic> json) =>
    _MusicShelfDividerRenderer(
      hidden: json['hidden'] as bool?,
    );

Map<String, dynamic> _$MusicShelfDividerRendererToJson(
        _MusicShelfDividerRenderer instance) =>
    <String, dynamic>{
      'hidden': instance.hidden,
    };

_Header _$HeaderFromJson(Map<String, dynamic> json) => _Header(
      chipCloudRenderer: json['chipCloudRenderer'] == null
          ? null
          : ChipCloudRenderer.fromJson(
              json['chipCloudRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HeaderToJson(_Header instance) => <String, dynamic>{
      'chipCloudRenderer': instance.chipCloudRenderer,
    };

_ChipCloudRenderer _$ChipCloudRendererFromJson(Map<String, dynamic> json) =>
    _ChipCloudRenderer(
      chips: (json['chips'] as List<dynamic>?)
          ?.map((e) => Chip.fromJson(e as Map<String, dynamic>))
          .toList(),
      collapsedRowCount: (json['collapsedRowCount'] as num?)?.toInt(),
      trackingParams: json['trackingParams'] as String?,
      horizontalScrollable: json['horizontalScrollable'] as bool?,
    );

Map<String, dynamic> _$ChipCloudRendererToJson(_ChipCloudRenderer instance) =>
    <String, dynamic>{
      'chips': instance.chips,
      'collapsedRowCount': instance.collapsedRowCount,
      'trackingParams': instance.trackingParams,
      'horizontalScrollable': instance.horizontalScrollable,
    };

_Chip _$ChipFromJson(Map<String, dynamic> json) => _Chip(
      chipCloudChipRenderer: json['chipCloudChipRenderer'] == null
          ? null
          : ChipCloudChipRenderer.fromJson(
              json['chipCloudChipRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChipToJson(_Chip instance) => <String, dynamic>{
      'chipCloudChipRenderer': instance.chipCloudChipRenderer,
    };

_ChipCloudChipRenderer _$ChipCloudChipRendererFromJson(
        Map<String, dynamic> json) =>
    _ChipCloudChipRenderer(
      style: json['style'] == null
          ? null
          : StyleClass.fromJson(json['style'] as Map<String, dynamic>),
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : ChipCloudChipRendererNavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
      icon: json['icon'] == null
          ? null
          : Icon.fromJson(json['icon'] as Map<String, dynamic>),
      accessibilityData: json['accessibilityData'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibilityData'] as Map<String, dynamic>),
      isSelected: json['isSelected'] as bool?,
      text: json['text'] == null
          ? null
          : Title.fromJson(json['text'] as Map<String, dynamic>),
      uniqueId: json['uniqueId'] as String?,
    );

Map<String, dynamic> _$ChipCloudChipRendererToJson(
        _ChipCloudChipRenderer instance) =>
    <String, dynamic>{
      'style': instance.style,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
      'icon': instance.icon,
      'accessibilityData': instance.accessibilityData,
      'isSelected': instance.isSelected,
      'text': instance.text,
      'uniqueId': instance.uniqueId,
    };

_ChipCloudChipRendererNavigationEndpoint
    _$ChipCloudChipRendererNavigationEndpointFromJson(
            Map<String, dynamic> json) =>
        _ChipCloudChipRendererNavigationEndpoint(
          clickTrackingParams: json['clickTrackingParams'] as String?,
          searchEndpoint: json['searchEndpoint'] == null
              ? null
              : SearchEndpoint.fromJson(
                  json['searchEndpoint'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ChipCloudChipRendererNavigationEndpointToJson(
        _ChipCloudChipRendererNavigationEndpoint instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'searchEndpoint': instance.searchEndpoint,
    };

_SearchEndpoint _$SearchEndpointFromJson(Map<String, dynamic> json) =>
    _SearchEndpoint(
      query: json['query'] as String?,
      params: json['params'] as String?,
    );

Map<String, dynamic> _$SearchEndpointToJson(_SearchEndpoint instance) =>
    <String, dynamic>{
      'query': instance.query,
      'params': instance.params,
    };

_StyleClass _$StyleClassFromJson(Map<String, dynamic> json) => _StyleClass(
      styleType: json['styleType'] as String?,
    );

Map<String, dynamic> _$StyleClassToJson(_StyleClass instance) =>
    <String, dynamic>{
      'styleType': instance.styleType,
    };

_ResponseContext _$ResponseContextFromJson(Map<String, dynamic> json) =>
    _ResponseContext(
      visitorData: json['visitorData'] as String?,
      serviceTrackingParams: (json['serviceTrackingParams'] as List<dynamic>?)
          ?.map((e) => ServiceTrackingParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAgeSeconds: (json['maxAgeSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResponseContextToJson(_ResponseContext instance) =>
    <String, dynamic>{
      'visitorData': instance.visitorData,
      'serviceTrackingParams': instance.serviceTrackingParams,
      'maxAgeSeconds': instance.maxAgeSeconds,
    };

_ServiceTrackingParam _$ServiceTrackingParamFromJson(
        Map<String, dynamic> json) =>
    _ServiceTrackingParam(
      service: json['service'] as String?,
      params: (json['params'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceTrackingParamToJson(
        _ServiceTrackingParam instance) =>
    <String, dynamic>{
      'service': instance.service,
      'params': instance.params,
    };

_Param _$ParamFromJson(Map<String, dynamic> json) => _Param(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ParamToJson(_Param instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
