// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListSearchResultImpl _$$ListSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ListSearchResultImpl(
      responseContext: json['responseContext'] == null
          ? null
          : ResponseContext.fromJson(
              json['responseContext'] as Map<String, dynamic>),
      contents: json['contents'] == null
          ? null
          : Contents.fromJson(json['contents'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$$ListSearchResultImplToJson(
        _$ListSearchResultImpl instance) =>
    <String, dynamic>{
      'responseContext': instance.responseContext,
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
    };

_$ContentsImpl _$$ContentsImplFromJson(Map<String, dynamic> json) =>
    _$ContentsImpl(
      tabbedSearchResultsRenderer: json['tabbedSearchResultsRenderer'] == null
          ? null
          : TabbedSearchResultsRenderer.fromJson(
              json['tabbedSearchResultsRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentsImplToJson(_$ContentsImpl instance) =>
    <String, dynamic>{
      'tabbedSearchResultsRenderer': instance.tabbedSearchResultsRenderer,
    };

_$TabbedSearchResultsRendererImpl _$$TabbedSearchResultsRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$TabbedSearchResultsRendererImpl(
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => Tab.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TabbedSearchResultsRendererImplToJson(
        _$TabbedSearchResultsRendererImpl instance) =>
    <String, dynamic>{
      'tabs': instance.tabs,
    };

_$TabImpl _$$TabImplFromJson(Map<String, dynamic> json) => _$TabImpl(
      tabRenderer: json['tabRenderer'] == null
          ? null
          : TabRenderer.fromJson(json['tabRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TabImplToJson(_$TabImpl instance) => <String, dynamic>{
      'tabRenderer': instance.tabRenderer,
    };

_$TabRendererImpl _$$TabRendererImplFromJson(Map<String, dynamic> json) =>
    _$TabRendererImpl(
      title: json['title'] as String?,
      selected: json['selected'] as bool?,
      content: json['content'] == null
          ? null
          : TabRendererContent.fromJson(
              json['content'] as Map<String, dynamic>),
      tabIdentifier: json['tabIdentifier'] as String?,
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$$TabRendererImplToJson(_$TabRendererImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selected': instance.selected,
      'content': instance.content,
      'tabIdentifier': instance.tabIdentifier,
      'trackingParams': instance.trackingParams,
    };

_$TabRendererContentImpl _$$TabRendererContentImplFromJson(
        Map<String, dynamic> json) =>
    _$TabRendererContentImpl(
      sectionListRenderer: json['sectionListRenderer'] == null
          ? null
          : SectionListRenderer.fromJson(
              json['sectionListRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TabRendererContentImplToJson(
        _$TabRendererContentImpl instance) =>
    <String, dynamic>{
      'sectionListRenderer': instance.sectionListRenderer,
    };

_$SectionListRendererImpl _$$SectionListRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$SectionListRendererImpl(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) =>
              SectionListRendererContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SectionListRendererImplToJson(
        _$SectionListRendererImpl instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
      'header': instance.header,
    };

_$SectionListRendererContentImpl _$$SectionListRendererContentImplFromJson(
        Map<String, dynamic> json) =>
    _$SectionListRendererContentImpl(
      musicShelfRenderer: json['musicShelfRenderer'] == null
          ? null
          : MusicShelfRenderer.fromJson(
              json['musicShelfRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SectionListRendererContentImplToJson(
        _$SectionListRendererContentImpl instance) =>
    <String, dynamic>{
      'musicShelfRenderer': instance.musicShelfRenderer,
    };

_$MusicShelfRendererImpl _$$MusicShelfRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicShelfRendererImpl(
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

Map<String, dynamic> _$$MusicShelfRendererImplToJson(
        _$MusicShelfRendererImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contents': instance.contents,
      'trackingParams': instance.trackingParams,
      'continuations': instance.continuations,
      'shelfDivider': instance.shelfDivider,
    };

_$MusicResponsiveListItemRendererImpl
    _$$MusicResponsiveListItemRendererImplFromJson(Map<String, dynamic> json) =>
        _$MusicResponsiveListItemRendererImpl(
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

Map<String, dynamic> _$$MusicResponsiveListItemRendererImplToJson(
        _$MusicResponsiveListItemRendererImpl instance) =>
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

_$BadgeImpl _$$BadgeImplFromJson(Map<String, dynamic> json) => _$BadgeImpl(
      musicInlineBadgeRenderer: json['musicInlineBadgeRenderer'] == null
          ? null
          : MusicInlineBadgeRenderer.fromJson(
              json['musicInlineBadgeRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BadgeImplToJson(_$BadgeImpl instance) =>
    <String, dynamic>{
      'musicInlineBadgeRenderer': instance.musicInlineBadgeRenderer,
    };

_$MusicInlineBadgeRendererImpl _$$MusicInlineBadgeRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicInlineBadgeRendererImpl(
      trackingParams: json['trackingParams'] as String?,
      icon: json['icon'] == null
          ? null
          : Icon.fromJson(json['icon'] as Map<String, dynamic>),
      accessibilityData: json['accessibilityData'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibilityData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MusicInlineBadgeRendererImplToJson(
        _$MusicInlineBadgeRendererImpl instance) =>
    <String, dynamic>{
      'trackingParams': instance.trackingParams,
      'icon': instance.icon,
      'accessibilityData': instance.accessibilityData,
    };

_$AccessibilityImpl _$$AccessibilityImplFromJson(Map<String, dynamic> json) =>
    _$AccessibilityImpl(
      accessibilityData: json['accessibilityData'] == null
          ? null
          : AccessibilityData.fromJson(
              json['accessibilityData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccessibilityImplToJson(_$AccessibilityImpl instance) =>
    <String, dynamic>{
      'accessibilityData': instance.accessibilityData,
    };

_$AccessibilityDataImpl _$$AccessibilityDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AccessibilityDataImpl(
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$AccessibilityDataImplToJson(
        _$AccessibilityDataImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
    };

_$IconImpl _$$IconImplFromJson(Map<String, dynamic> json) => _$IconImpl(
      iconType: json['iconType'] as String?,
    );

Map<String, dynamic> _$$IconImplToJson(_$IconImpl instance) =>
    <String, dynamic>{
      'iconType': instance.iconType,
    };

_$FlexColumnImpl _$$FlexColumnImplFromJson(Map<String, dynamic> json) =>
    _$FlexColumnImpl(
      musicResponsiveListItemFlexColumnRenderer:
          json['musicResponsiveListItemFlexColumnRenderer'] == null
              ? null
              : MusicResponsiveListItemFlexColumnRenderer.fromJson(
                  json['musicResponsiveListItemFlexColumnRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlexColumnImplToJson(_$FlexColumnImpl instance) =>
    <String, dynamic>{
      'musicResponsiveListItemFlexColumnRenderer':
          instance.musicResponsiveListItemFlexColumnRenderer,
    };

_$MusicResponsiveListItemFlexColumnRendererImpl
    _$$MusicResponsiveListItemFlexColumnRendererImplFromJson(
            Map<String, dynamic> json) =>
        _$MusicResponsiveListItemFlexColumnRendererImpl(
          text: json['text'] == null
              ? null
              : Text.fromJson(json['text'] as Map<String, dynamic>),
          displayPriority: json['displayPriority'] as String?,
        );

Map<String, dynamic> _$$MusicResponsiveListItemFlexColumnRendererImplToJson(
        _$MusicResponsiveListItemFlexColumnRendererImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'displayPriority': instance.displayPriority,
    };

_$TextImpl _$$TextImplFromJson(Map<String, dynamic> json) => _$TextImpl(
      runs: (json['runs'] as List<dynamic>?)
          ?.map((e) => PurpleRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TextImplToJson(_$TextImpl instance) =>
    <String, dynamic>{
      'runs': instance.runs,
    };

_$PurpleRunImpl _$$PurpleRunImplFromJson(Map<String, dynamic> json) =>
    _$PurpleRunImpl(
      text: json['text'] as String?,
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : RunNavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurpleRunImplToJson(_$PurpleRunImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'navigationEndpoint': instance.navigationEndpoint,
    };

_$RunNavigationEndpointImpl _$$RunNavigationEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$RunNavigationEndpointImpl(
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

Map<String, dynamic> _$$RunNavigationEndpointImplToJson(
        _$RunNavigationEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
      'browseEndpoint': instance.browseEndpoint,
    };

_$BrowseEndpointImpl _$$BrowseEndpointImplFromJson(Map<String, dynamic> json) =>
    _$BrowseEndpointImpl(
      browseId: json['browseId'] as String?,
      browseEndpointContextSupportedConfigs:
          json['browseEndpointContextSupportedConfigs'] == null
              ? null
              : BrowseEndpointContextSupportedConfigs.fromJson(
                  json['browseEndpointContextSupportedConfigs']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BrowseEndpointImplToJson(
        _$BrowseEndpointImpl instance) =>
    <String, dynamic>{
      'browseId': instance.browseId,
      'browseEndpointContextSupportedConfigs':
          instance.browseEndpointContextSupportedConfigs,
    };

_$BrowseEndpointContextSupportedConfigsImpl
    _$$BrowseEndpointContextSupportedConfigsImplFromJson(
            Map<String, dynamic> json) =>
        _$BrowseEndpointContextSupportedConfigsImpl(
          browseEndpointContextMusicConfig:
              json['browseEndpointContextMusicConfig'] == null
                  ? null
                  : BrowseEndpointContextMusicConfig.fromJson(
                      json['browseEndpointContextMusicConfig']
                          as Map<String, dynamic>),
        );

Map<String, dynamic> _$$BrowseEndpointContextSupportedConfigsImplToJson(
        _$BrowseEndpointContextSupportedConfigsImpl instance) =>
    <String, dynamic>{
      'browseEndpointContextMusicConfig':
          instance.browseEndpointContextMusicConfig,
    };

_$BrowseEndpointContextMusicConfigImpl
    _$$BrowseEndpointContextMusicConfigImplFromJson(
            Map<String, dynamic> json) =>
        _$BrowseEndpointContextMusicConfigImpl(
          pageType: json['pageType'] as String?,
        );

Map<String, dynamic> _$$BrowseEndpointContextMusicConfigImplToJson(
        _$BrowseEndpointContextMusicConfigImpl instance) =>
    <String, dynamic>{
      'pageType': instance.pageType,
    };

_$PlayNavigationEndpointWatchEndpointImpl
    _$$PlayNavigationEndpointWatchEndpointImplFromJson(
            Map<String, dynamic> json) =>
        _$PlayNavigationEndpointWatchEndpointImpl(
          videoId: json['videoId'] as String?,
          watchEndpointMusicSupportedConfigs:
              json['watchEndpointMusicSupportedConfigs'] == null
                  ? null
                  : WatchEndpointMusicSupportedConfigs.fromJson(
                      json['watchEndpointMusicSupportedConfigs']
                          as Map<String, dynamic>),
        );

Map<String, dynamic> _$$PlayNavigationEndpointWatchEndpointImplToJson(
        _$PlayNavigationEndpointWatchEndpointImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'watchEndpointMusicSupportedConfigs':
          instance.watchEndpointMusicSupportedConfigs,
    };

_$WatchEndpointMusicSupportedConfigsImpl
    _$$WatchEndpointMusicSupportedConfigsImplFromJson(
            Map<String, dynamic> json) =>
        _$WatchEndpointMusicSupportedConfigsImpl(
          watchEndpointMusicConfig: json['watchEndpointMusicConfig'] == null
              ? null
              : WatchEndpointMusicConfig.fromJson(
                  json['watchEndpointMusicConfig'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$WatchEndpointMusicSupportedConfigsImplToJson(
        _$WatchEndpointMusicSupportedConfigsImpl instance) =>
    <String, dynamic>{
      'watchEndpointMusicConfig': instance.watchEndpointMusicConfig,
    };

_$WatchEndpointMusicConfigImpl _$$WatchEndpointMusicConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchEndpointMusicConfigImpl(
      musicVideoType: json['musicVideoType'] as String?,
    );

Map<String, dynamic> _$$WatchEndpointMusicConfigImplToJson(
        _$WatchEndpointMusicConfigImpl instance) =>
    <String, dynamic>{
      'musicVideoType': instance.musicVideoType,
    };

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      menuRenderer: json['menuRenderer'] == null
          ? null
          : MenuRenderer.fromJson(json['menuRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'menuRenderer': instance.menuRenderer,
    };

_$MenuRendererImpl _$$MenuRendererImplFromJson(Map<String, dynamic> json) =>
    _$MenuRendererImpl(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingParams: json['trackingParams'] as String?,
      accessibility: json['accessibility'] == null
          ? null
          : Accessibility.fromJson(
              json['accessibility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MenuRendererImplToJson(_$MenuRendererImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'trackingParams': instance.trackingParams,
      'accessibility': instance.accessibility,
    };

_$ItemElementImpl _$$ItemElementImplFromJson(Map<String, dynamic> json) =>
    _$ItemElementImpl(
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

Map<String, dynamic> _$$ItemElementImplToJson(_$ItemElementImpl instance) =>
    <String, dynamic>{
      'menuNavigationItemRenderer': instance.menuNavigationItemRenderer,
      'menuServiceItemRenderer': instance.menuServiceItemRenderer,
      'toggleMenuServiceItemRenderer': instance.toggleMenuServiceItemRenderer,
    };

_$MenuItemRendererImpl _$$MenuItemRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemRendererImpl(
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

Map<String, dynamic> _$$MenuItemRendererImplToJson(
        _$MenuItemRendererImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
      'serviceEndpoint': instance.serviceEndpoint,
    };

_$MenuNavigationItemRendererNavigationEndpointImpl
    _$$MenuNavigationItemRendererNavigationEndpointImplFromJson(
            Map<String, dynamic> json) =>
        _$MenuNavigationItemRendererNavigationEndpointImpl(
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

Map<String, dynamic> _$$MenuNavigationItemRendererNavigationEndpointImplToJson(
        _$MenuNavigationItemRendererNavigationEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
      'modalEndpoint': instance.modalEndpoint,
      'browseEndpoint': instance.browseEndpoint,
      'shareEntityEndpoint': instance.shareEntityEndpoint,
    };

_$TitleImpl _$$TitleImplFromJson(Map<String, dynamic> json) => _$TitleImpl(
      runs: (json['runs'] as List<dynamic>?)
          ?.map((e) => TitleRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TitleImplToJson(_$TitleImpl instance) =>
    <String, dynamic>{
      'runs': instance.runs,
    };

_$TitleRunImpl _$$TitleRunImplFromJson(Map<String, dynamic> json) =>
    _$TitleRunImpl(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$TitleRunImplToJson(_$TitleRunImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

_$ShareEntityEndpointImpl _$$ShareEntityEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$ShareEntityEndpointImpl(
      serializedShareEntity: json['serializedShareEntity'] as String?,
      sharePanelType: json['sharePanelType'] as String?,
    );

Map<String, dynamic> _$$ShareEntityEndpointImplToJson(
        _$ShareEntityEndpointImpl instance) =>
    <String, dynamic>{
      'serializedShareEntity': instance.serializedShareEntity,
      'sharePanelType': instance.sharePanelType,
    };

_$ModalEndpointImpl _$$ModalEndpointImplFromJson(Map<String, dynamic> json) =>
    _$ModalEndpointImpl(
      modal: json['modal'] == null
          ? null
          : Modal.fromJson(json['modal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ModalEndpointImplToJson(_$ModalEndpointImpl instance) =>
    <String, dynamic>{
      'modal': instance.modal,
    };

_$ModalImpl _$$ModalImplFromJson(Map<String, dynamic> json) => _$ModalImpl(
      modalWithTitleAndButtonRenderer:
          json['modalWithTitleAndButtonRenderer'] == null
              ? null
              : ModalWithTitleAndButtonRenderer.fromJson(
                  json['modalWithTitleAndButtonRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ModalImplToJson(_$ModalImpl instance) =>
    <String, dynamic>{
      'modalWithTitleAndButtonRenderer':
          instance.modalWithTitleAndButtonRenderer,
    };

_$ModalWithTitleAndButtonRendererImpl
    _$$ModalWithTitleAndButtonRendererImplFromJson(Map<String, dynamic> json) =>
        _$ModalWithTitleAndButtonRendererImpl(
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

Map<String, dynamic> _$$ModalWithTitleAndButtonRendererImplToJson(
        _$ModalWithTitleAndButtonRendererImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'button': instance.button,
    };

_$ButtonImpl _$$ButtonImplFromJson(Map<String, dynamic> json) => _$ButtonImpl(
      buttonRenderer: json['buttonRenderer'] == null
          ? null
          : ButtonRenderer.fromJson(
              json['buttonRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ButtonImplToJson(_$ButtonImpl instance) =>
    <String, dynamic>{
      'buttonRenderer': instance.buttonRenderer,
    };

_$ButtonRendererImpl _$$ButtonRendererImplFromJson(Map<String, dynamic> json) =>
    _$ButtonRendererImpl(
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

Map<String, dynamic> _$$ButtonRendererImplToJson(
        _$ButtonRendererImpl instance) =>
    <String, dynamic>{
      'style': instance.style,
      'isDisabled': instance.isDisabled,
      'text': instance.text,
      'navigationEndpoint': instance.navigationEndpoint,
      'trackingParams': instance.trackingParams,
    };

_$ButtonRendererNavigationEndpointImpl
    _$$ButtonRendererNavigationEndpointImplFromJson(
            Map<String, dynamic> json) =>
        _$ButtonRendererNavigationEndpointImpl(
          clickTrackingParams: json['clickTrackingParams'] as String?,
          signInEndpoint: json['signInEndpoint'] == null
              ? null
              : SignInEndpoint.fromJson(
                  json['signInEndpoint'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ButtonRendererNavigationEndpointImplToJson(
        _$ButtonRendererNavigationEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'signInEndpoint': instance.signInEndpoint,
    };

_$SignInEndpointImpl _$$SignInEndpointImplFromJson(Map<String, dynamic> json) =>
    _$SignInEndpointImpl(
      hack: json['hack'] as bool?,
    );

Map<String, dynamic> _$$SignInEndpointImplToJson(
        _$SignInEndpointImpl instance) =>
    <String, dynamic>{
      'hack': instance.hack,
    };

_$PurpleWatchEndpointImpl _$$PurpleWatchEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$PurpleWatchEndpointImpl(
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

Map<String, dynamic> _$$PurpleWatchEndpointImplToJson(
        _$PurpleWatchEndpointImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'playlistId': instance.playlistId,
      'params': instance.params,
      'loggingContext': instance.loggingContext,
      'watchEndpointMusicSupportedConfigs':
          instance.watchEndpointMusicSupportedConfigs,
    };

_$LoggingContextImpl _$$LoggingContextImplFromJson(Map<String, dynamic> json) =>
    _$LoggingContextImpl(
      vssLoggingContext: json['vssLoggingContext'] == null
          ? null
          : VssLoggingContext.fromJson(
              json['vssLoggingContext'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoggingContextImplToJson(
        _$LoggingContextImpl instance) =>
    <String, dynamic>{
      'vssLoggingContext': instance.vssLoggingContext,
    };

_$VssLoggingContextImpl _$$VssLoggingContextImplFromJson(
        Map<String, dynamic> json) =>
    _$VssLoggingContextImpl(
      serializedContextData: json['serializedContextData'] as String?,
    );

Map<String, dynamic> _$$VssLoggingContextImplToJson(
        _$VssLoggingContextImpl instance) =>
    <String, dynamic>{
      'serializedContextData': instance.serializedContextData,
    };

_$ServiceEndpointImpl _$$ServiceEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceEndpointImpl(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      queueAddEndpoint: json['queueAddEndpoint'] == null
          ? null
          : QueueAddEndpoint.fromJson(
              json['queueAddEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServiceEndpointImplToJson(
        _$ServiceEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'queueAddEndpoint': instance.queueAddEndpoint,
    };

_$QueueAddEndpointImpl _$$QueueAddEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$QueueAddEndpointImpl(
      queueTarget: json['queueTarget'] == null
          ? null
          : QueueTarget.fromJson(json['queueTarget'] as Map<String, dynamic>),
      queueInsertPosition: json['queueInsertPosition'] as String?,
      commands: (json['commands'] as List<dynamic>?)
          ?.map((e) => Command.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QueueAddEndpointImplToJson(
        _$QueueAddEndpointImpl instance) =>
    <String, dynamic>{
      'queueTarget': instance.queueTarget,
      'queueInsertPosition': instance.queueInsertPosition,
      'commands': instance.commands,
    };

_$CommandImpl _$$CommandImplFromJson(Map<String, dynamic> json) =>
    _$CommandImpl(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      addToToastAction: json['addToToastAction'] == null
          ? null
          : AddToToastAction.fromJson(
              json['addToToastAction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommandImplToJson(_$CommandImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'addToToastAction': instance.addToToastAction,
    };

_$AddToToastActionImpl _$$AddToToastActionImplFromJson(
        Map<String, dynamic> json) =>
    _$AddToToastActionImpl(
      item: json['item'] == null
          ? null
          : AddToToastActionItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddToToastActionImplToJson(
        _$AddToToastActionImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$AddToToastActionItemImpl _$$AddToToastActionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$AddToToastActionItemImpl(
      notificationTextRenderer: json['notificationTextRenderer'] == null
          ? null
          : NotificationTextRenderer.fromJson(
              json['notificationTextRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddToToastActionItemImplToJson(
        _$AddToToastActionItemImpl instance) =>
    <String, dynamic>{
      'notificationTextRenderer': instance.notificationTextRenderer,
    };

_$NotificationTextRendererImpl _$$NotificationTextRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTextRendererImpl(
      successResponseText: json['successResponseText'] == null
          ? null
          : Title.fromJson(json['successResponseText'] as Map<String, dynamic>),
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$$NotificationTextRendererImplToJson(
        _$NotificationTextRendererImpl instance) =>
    <String, dynamic>{
      'successResponseText': instance.successResponseText,
      'trackingParams': instance.trackingParams,
    };

_$QueueTargetImpl _$$QueueTargetImplFromJson(Map<String, dynamic> json) =>
    _$QueueTargetImpl(
      videoId: json['videoId'] as String?,
      onEmptyQueue: json['onEmptyQueue'] == null
          ? null
          : OnEmptyQueue.fromJson(json['onEmptyQueue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QueueTargetImplToJson(_$QueueTargetImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'onEmptyQueue': instance.onEmptyQueue,
    };

_$OnEmptyQueueImpl _$$OnEmptyQueueImplFromJson(Map<String, dynamic> json) =>
    _$OnEmptyQueueImpl(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      watchEndpoint: json['watchEndpoint'] == null
          ? null
          : PlaylistItemData.fromJson(
              json['watchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OnEmptyQueueImplToJson(_$OnEmptyQueueImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
    };

_$PlaylistItemDataImpl _$$PlaylistItemDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaylistItemDataImpl(
      videoId: json['videoId'] as String?,
    );

Map<String, dynamic> _$$PlaylistItemDataImplToJson(
        _$PlaylistItemDataImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
    };

_$ToggleMenuServiceItemRendererImpl
    _$$ToggleMenuServiceItemRendererImplFromJson(Map<String, dynamic> json) =>
        _$ToggleMenuServiceItemRendererImpl(
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

Map<String, dynamic> _$$ToggleMenuServiceItemRendererImplToJson(
        _$ToggleMenuServiceItemRendererImpl instance) =>
    <String, dynamic>{
      'defaultText': instance.defaultText,
      'defaultIcon': instance.defaultIcon,
      'defaultServiceEndpoint': instance.defaultServiceEndpoint,
      'toggledText': instance.toggledText,
      'toggledIcon': instance.toggledIcon,
      'trackingParams': instance.trackingParams,
    };

_$DefaultServiceEndpointImpl _$$DefaultServiceEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$DefaultServiceEndpointImpl(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      modalEndpoint: json['modalEndpoint'] == null
          ? null
          : ModalEndpoint.fromJson(
              json['modalEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DefaultServiceEndpointImplToJson(
        _$DefaultServiceEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'modalEndpoint': instance.modalEndpoint,
    };

_$OverlayImpl _$$OverlayImplFromJson(Map<String, dynamic> json) =>
    _$OverlayImpl(
      musicItemThumbnailOverlayRenderer:
          json['musicItemThumbnailOverlayRenderer'] == null
              ? null
              : MusicItemThumbnailOverlayRenderer.fromJson(
                  json['musicItemThumbnailOverlayRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OverlayImplToJson(_$OverlayImpl instance) =>
    <String, dynamic>{
      'musicItemThumbnailOverlayRenderer':
          instance.musicItemThumbnailOverlayRenderer,
    };

_$MusicItemThumbnailOverlayRendererImpl
    _$$MusicItemThumbnailOverlayRendererImplFromJson(
            Map<String, dynamic> json) =>
        _$MusicItemThumbnailOverlayRendererImpl(
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

Map<String, dynamic> _$$MusicItemThumbnailOverlayRendererImplToJson(
        _$MusicItemThumbnailOverlayRendererImpl instance) =>
    <String, dynamic>{
      'background': instance.background,
      'content': instance.content,
      'contentPosition': instance.contentPosition,
      'displayStyle': instance.displayStyle,
    };

_$BackgroundImpl _$$BackgroundImplFromJson(Map<String, dynamic> json) =>
    _$BackgroundImpl(
      verticalGradient: json['verticalGradient'] == null
          ? null
          : VerticalGradient.fromJson(
              json['verticalGradient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BackgroundImplToJson(_$BackgroundImpl instance) =>
    <String, dynamic>{
      'verticalGradient': instance.verticalGradient,
    };

_$VerticalGradientImpl _$$VerticalGradientImplFromJson(
        Map<String, dynamic> json) =>
    _$VerticalGradientImpl(
      gradientLayerColors: (json['gradientLayerColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$VerticalGradientImplToJson(
        _$VerticalGradientImpl instance) =>
    <String, dynamic>{
      'gradientLayerColors': instance.gradientLayerColors,
    };

_$MusicItemThumbnailOverlayRendererContentImpl
    _$$MusicItemThumbnailOverlayRendererContentImplFromJson(
            Map<String, dynamic> json) =>
        _$MusicItemThumbnailOverlayRendererContentImpl(
          musicPlayButtonRenderer: json['musicPlayButtonRenderer'] == null
              ? null
              : MusicPlayButtonRenderer.fromJson(
                  json['musicPlayButtonRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MusicItemThumbnailOverlayRendererContentImplToJson(
        _$MusicItemThumbnailOverlayRendererContentImpl instance) =>
    <String, dynamic>{
      'musicPlayButtonRenderer': instance.musicPlayButtonRenderer,
    };

_$MusicPlayButtonRendererImpl _$$MusicPlayButtonRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicPlayButtonRendererImpl(
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

Map<String, dynamic> _$$MusicPlayButtonRendererImplToJson(
        _$MusicPlayButtonRendererImpl instance) =>
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

_$PlayNavigationEndpointImpl _$$PlayNavigationEndpointImplFromJson(
        Map<String, dynamic> json) =>
    _$PlayNavigationEndpointImpl(
      clickTrackingParams: json['clickTrackingParams'] as String?,
      watchEndpoint: json['watchEndpoint'] == null
          ? null
          : PlayNavigationEndpointWatchEndpoint.fromJson(
              json['watchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayNavigationEndpointImplToJson(
        _$PlayNavigationEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'watchEndpoint': instance.watchEndpoint,
    };

_$MusicResponsiveListItemRendererThumbnailImpl
    _$$MusicResponsiveListItemRendererThumbnailImplFromJson(
            Map<String, dynamic> json) =>
        _$MusicResponsiveListItemRendererThumbnailImpl(
          musicThumbnailRenderer: json['musicThumbnailRenderer'] == null
              ? null
              : MusicThumbnailRenderer.fromJson(
                  json['musicThumbnailRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MusicResponsiveListItemRendererThumbnailImplToJson(
        _$MusicResponsiveListItemRendererThumbnailImpl instance) =>
    <String, dynamic>{
      'musicThumbnailRenderer': instance.musicThumbnailRenderer,
    };

_$MusicThumbnailRendererImpl _$$MusicThumbnailRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicThumbnailRendererImpl(
      thumbnail: json['thumbnail'] == null
          ? null
          : MusicThumbnailRendererThumbnail.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
      thumbnailCrop: json['thumbnailCrop'] as String?,
      thumbnailScale: json['thumbnailScale'] as String?,
      trackingParams: json['trackingParams'] as String?,
    );

Map<String, dynamic> _$$MusicThumbnailRendererImplToJson(
        _$MusicThumbnailRendererImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'thumbnailCrop': instance.thumbnailCrop,
      'thumbnailScale': instance.thumbnailScale,
      'trackingParams': instance.trackingParams,
    };

_$MusicThumbnailRendererThumbnailImpl
    _$$MusicThumbnailRendererThumbnailImplFromJson(Map<String, dynamic> json) =>
        _$MusicThumbnailRendererThumbnailImpl(
          thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => ThumbnailElement.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$MusicThumbnailRendererThumbnailImplToJson(
        _$MusicThumbnailRendererThumbnailImpl instance) =>
    <String, dynamic>{
      'thumbnails': instance.thumbnails,
    };

_$ThumbnailElementImpl _$$ThumbnailElementImplFromJson(
        Map<String, dynamic> json) =>
    _$ThumbnailElementImpl(
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ThumbnailElementImplToJson(
        _$ThumbnailElementImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$ContinuationImpl _$$ContinuationImplFromJson(Map<String, dynamic> json) =>
    _$ContinuationImpl(
      nextContinuationData: json['nextContinuationData'] == null
          ? null
          : NextContinuationData.fromJson(
              json['nextContinuationData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContinuationImplToJson(_$ContinuationImpl instance) =>
    <String, dynamic>{
      'nextContinuationData': instance.nextContinuationData,
    };

_$NextContinuationDataImpl _$$NextContinuationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NextContinuationDataImpl(
      continuation: json['continuation'] as String?,
      clickTrackingParams: json['clickTrackingParams'] as String?,
    );

Map<String, dynamic> _$$NextContinuationDataImplToJson(
        _$NextContinuationDataImpl instance) =>
    <String, dynamic>{
      'continuation': instance.continuation,
      'clickTrackingParams': instance.clickTrackingParams,
    };

_$ShelfDividerImpl _$$ShelfDividerImplFromJson(Map<String, dynamic> json) =>
    _$ShelfDividerImpl(
      musicShelfDividerRenderer: json['musicShelfDividerRenderer'] == null
          ? null
          : MusicShelfDividerRenderer.fromJson(
              json['musicShelfDividerRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShelfDividerImplToJson(_$ShelfDividerImpl instance) =>
    <String, dynamic>{
      'musicShelfDividerRenderer': instance.musicShelfDividerRenderer,
    };

_$MusicShelfDividerRendererImpl _$$MusicShelfDividerRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$MusicShelfDividerRendererImpl(
      hidden: json['hidden'] as bool?,
    );

Map<String, dynamic> _$$MusicShelfDividerRendererImplToJson(
        _$MusicShelfDividerRendererImpl instance) =>
    <String, dynamic>{
      'hidden': instance.hidden,
    };

_$HeaderImpl _$$HeaderImplFromJson(Map<String, dynamic> json) => _$HeaderImpl(
      chipCloudRenderer: json['chipCloudRenderer'] == null
          ? null
          : ChipCloudRenderer.fromJson(
              json['chipCloudRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HeaderImplToJson(_$HeaderImpl instance) =>
    <String, dynamic>{
      'chipCloudRenderer': instance.chipCloudRenderer,
    };

_$ChipCloudRendererImpl _$$ChipCloudRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$ChipCloudRendererImpl(
      chips: (json['chips'] as List<dynamic>?)
          ?.map((e) => Chip.fromJson(e as Map<String, dynamic>))
          .toList(),
      collapsedRowCount: (json['collapsedRowCount'] as num?)?.toInt(),
      trackingParams: json['trackingParams'] as String?,
      horizontalScrollable: json['horizontalScrollable'] as bool?,
    );

Map<String, dynamic> _$$ChipCloudRendererImplToJson(
        _$ChipCloudRendererImpl instance) =>
    <String, dynamic>{
      'chips': instance.chips,
      'collapsedRowCount': instance.collapsedRowCount,
      'trackingParams': instance.trackingParams,
      'horizontalScrollable': instance.horizontalScrollable,
    };

_$ChipImpl _$$ChipImplFromJson(Map<String, dynamic> json) => _$ChipImpl(
      chipCloudChipRenderer: json['chipCloudChipRenderer'] == null
          ? null
          : ChipCloudChipRenderer.fromJson(
              json['chipCloudChipRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChipImplToJson(_$ChipImpl instance) =>
    <String, dynamic>{
      'chipCloudChipRenderer': instance.chipCloudChipRenderer,
    };

_$ChipCloudChipRendererImpl _$$ChipCloudChipRendererImplFromJson(
        Map<String, dynamic> json) =>
    _$ChipCloudChipRendererImpl(
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

Map<String, dynamic> _$$ChipCloudChipRendererImplToJson(
        _$ChipCloudChipRendererImpl instance) =>
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

_$ChipCloudChipRendererNavigationEndpointImpl
    _$$ChipCloudChipRendererNavigationEndpointImplFromJson(
            Map<String, dynamic> json) =>
        _$ChipCloudChipRendererNavigationEndpointImpl(
          clickTrackingParams: json['clickTrackingParams'] as String?,
          searchEndpoint: json['searchEndpoint'] == null
              ? null
              : SearchEndpoint.fromJson(
                  json['searchEndpoint'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChipCloudChipRendererNavigationEndpointImplToJson(
        _$ChipCloudChipRendererNavigationEndpointImpl instance) =>
    <String, dynamic>{
      'clickTrackingParams': instance.clickTrackingParams,
      'searchEndpoint': instance.searchEndpoint,
    };

_$SearchEndpointImpl _$$SearchEndpointImplFromJson(Map<String, dynamic> json) =>
    _$SearchEndpointImpl(
      query: json['query'] as String?,
      params: json['params'] as String?,
    );

Map<String, dynamic> _$$SearchEndpointImplToJson(
        _$SearchEndpointImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'params': instance.params,
    };

_$StyleClassImpl _$$StyleClassImplFromJson(Map<String, dynamic> json) =>
    _$StyleClassImpl(
      styleType: json['styleType'] as String?,
    );

Map<String, dynamic> _$$StyleClassImplToJson(_$StyleClassImpl instance) =>
    <String, dynamic>{
      'styleType': instance.styleType,
    };

_$ResponseContextImpl _$$ResponseContextImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseContextImpl(
      visitorData: json['visitorData'] as String?,
      serviceTrackingParams: (json['serviceTrackingParams'] as List<dynamic>?)
          ?.map((e) => ServiceTrackingParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAgeSeconds: (json['maxAgeSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResponseContextImplToJson(
        _$ResponseContextImpl instance) =>
    <String, dynamic>{
      'visitorData': instance.visitorData,
      'serviceTrackingParams': instance.serviceTrackingParams,
      'maxAgeSeconds': instance.maxAgeSeconds,
    };

_$ServiceTrackingParamImpl _$$ServiceTrackingParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceTrackingParamImpl(
      service: json['service'] as String?,
      params: (json['params'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceTrackingParamImplToJson(
        _$ServiceTrackingParamImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'params': instance.params,
    };

_$ParamImpl _$$ParamImplFromJson(Map<String, dynamic> json) => _$ParamImpl(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$ParamImplToJson(_$ParamImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
