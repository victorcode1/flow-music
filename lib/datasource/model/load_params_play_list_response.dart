// To parse this JSON data, do
//
//     final loadPayList = loadPayListFromJson(jsonString);

import 'dart:convert';

LoadParamsPayListResult loadPayListFromJson(String str) =>
    LoadParamsPayListResult.fromJson(json.decode(str));

String loadPayListToJson(LoadParamsPayListResult data) =>
    json.encode(data.toJson());

class LoadParamsPayListResult {
  final ResponseContext? responseContext;
  final Contents? contents;
  final CurrentVideoEndpoint? currentVideoEndpoint;
  final String? trackingParams;
  final PlayerOverlays? playerOverlays;
  final VideoReporting? videoReporting;
  final String? queueContextParams;

  LoadParamsPayListResult({
    this.responseContext,
    this.contents,
    this.currentVideoEndpoint,
    this.trackingParams,
    this.playerOverlays,
    this.videoReporting,
    this.queueContextParams,
  });

  factory LoadParamsPayListResult.fromJson(Map<String, dynamic> json) =>
      LoadParamsPayListResult(
        responseContext: json["responseContext"] == null
            ? null
            : ResponseContext.fromJson(json["responseContext"]),
        contents: json["contents"] == null
            ? null
            : Contents.fromJson(json["contents"]),
        currentVideoEndpoint: json["currentVideoEndpoint"] == null
            ? null
            : CurrentVideoEndpoint.fromJson(json["currentVideoEndpoint"]),
        trackingParams: json["trackingParams"],
        playerOverlays: json["playerOverlays"] == null
            ? null
            : PlayerOverlays.fromJson(json["playerOverlays"]),
        videoReporting: json["videoReporting"] == null
            ? null
            : VideoReporting.fromJson(json["videoReporting"]),
        queueContextParams: json["queueContextParams"],
      );

  Map<String, dynamic> toJson() => {
        "responseContext": responseContext?.toJson(),
        "contents": contents?.toJson(),
        "currentVideoEndpoint": currentVideoEndpoint?.toJson(),
        "trackingParams": trackingParams,
        "playerOverlays": playerOverlays?.toJson(),
        "videoReporting": videoReporting?.toJson(),
        "queueContextParams": queueContextParams,
      };
}

class Contents {
  final SingleColumnMusicWatchNextResultsRenderer?
      singleColumnMusicWatchNextResultsRenderer;

  Contents({
    this.singleColumnMusicWatchNextResultsRenderer,
  });

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        singleColumnMusicWatchNextResultsRenderer:
            json["singleColumnMusicWatchNextResultsRenderer"] == null
                ? null
                : SingleColumnMusicWatchNextResultsRenderer.fromJson(
                    json["singleColumnMusicWatchNextResultsRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "singleColumnMusicWatchNextResultsRenderer":
            singleColumnMusicWatchNextResultsRenderer?.toJson(),
      };
}

class SingleColumnMusicWatchNextResultsRenderer {
  final TabbedRenderer? tabbedRenderer;

  SingleColumnMusicWatchNextResultsRenderer({
    this.tabbedRenderer,
  });

  factory SingleColumnMusicWatchNextResultsRenderer.fromJson(
          Map<String, dynamic> json) =>
      SingleColumnMusicWatchNextResultsRenderer(
        tabbedRenderer: json["tabbedRenderer"] == null
            ? null
            : TabbedRenderer.fromJson(json["tabbedRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "tabbedRenderer": tabbedRenderer?.toJson(),
      };
}

class TabbedRenderer {
  final WatchNextTabbedResultsRenderer? watchNextTabbedResultsRenderer;

  TabbedRenderer({
    this.watchNextTabbedResultsRenderer,
  });

  factory TabbedRenderer.fromJson(Map<String, dynamic> json) => TabbedRenderer(
        watchNextTabbedResultsRenderer:
            json["watchNextTabbedResultsRenderer"] == null
                ? null
                : WatchNextTabbedResultsRenderer.fromJson(
                    json["watchNextTabbedResultsRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "watchNextTabbedResultsRenderer":
            watchNextTabbedResultsRenderer?.toJson(),
      };
}

class WatchNextTabbedResultsRenderer {
  final List<Tab>? tabs;

  WatchNextTabbedResultsRenderer({
    this.tabs,
  });

  factory WatchNextTabbedResultsRenderer.fromJson(Map<String, dynamic> json) =>
      WatchNextTabbedResultsRenderer(
        tabs: json["tabs"] == null
            ? []
            : List<Tab>.from(json["tabs"]!.map((x) => Tab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tabs": tabs == null
            ? []
            : List<dynamic>.from(tabs!.map((x) => x.toJson())),
      };
}

class Tab {
  final TabRenderer? tabRenderer;

  Tab({
    this.tabRenderer,
  });

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
        tabRenderer: json["tabRenderer"] == null
            ? null
            : TabRenderer.fromJson(json["tabRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "tabRenderer": tabRenderer?.toJson(),
      };
}

class TabRenderer {
  final String? title;
  final TabRendererContent? content;
  final String? trackingParams;
  final Endpoint? endpoint;

  TabRenderer({
    this.title,
    this.content,
    this.trackingParams,
    this.endpoint,
  });

  factory TabRenderer.fromJson(Map<String, dynamic> json) => TabRenderer(
        title: json["title"],
        content: json["content"] == null
            ? null
            : TabRendererContent.fromJson(json["content"]),
        trackingParams: json["trackingParams"],
        endpoint: json["endpoint"] == null
            ? null
            : Endpoint.fromJson(json["endpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content?.toJson(),
        "trackingParams": trackingParams,
        "endpoint": endpoint?.toJson(),
      };
}

class TabRendererContent {
  final MusicQueueRenderer? musicQueueRenderer;

  TabRendererContent({
    this.musicQueueRenderer,
  });

  factory TabRendererContent.fromJson(Map<String, dynamic> json) =>
      TabRendererContent(
        musicQueueRenderer: json["musicQueueRenderer"] == null
            ? null
            : MusicQueueRenderer.fromJson(json["musicQueueRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "musicQueueRenderer": musicQueueRenderer?.toJson(),
      };
}

class MusicQueueRenderer {
  final MusicQueueRendererContent? content;
  final bool? hack;
  final Header? header;

  MusicQueueRenderer({
    this.content,
    this.hack,
    this.header,
  });

  factory MusicQueueRenderer.fromJson(Map<String, dynamic> json) =>
      MusicQueueRenderer(
        content: json["content"] == null
            ? null
            : MusicQueueRendererContent.fromJson(json["content"]),
        hack: json["hack"],
        header: json["header"] == null ? null : Header.fromJson(json["header"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
        "hack": hack,
        "header": header?.toJson(),
      };
}

class MusicQueueRendererContent {
  final PlaylistPanelRenderer? playlistPanelRenderer;

  MusicQueueRendererContent({
    this.playlistPanelRenderer,
  });

  factory MusicQueueRendererContent.fromJson(Map<String, dynamic> json) =>
      MusicQueueRendererContent(
        playlistPanelRenderer: json["playlistPanelRenderer"] == null
            ? null
            : PlaylistPanelRenderer.fromJson(json["playlistPanelRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "playlistPanelRenderer": playlistPanelRenderer?.toJson(),
      };
}

class PlaylistPanelRenderer {
  final List<ContentElement>? contents;
  final bool? isInfinite;
  final String? trackingParams;
  final ShuffleToggleButton? shuffleToggleButton;

  PlaylistPanelRenderer({
    this.contents,
    this.isInfinite,
    this.trackingParams,
    this.shuffleToggleButton,
  });

  factory PlaylistPanelRenderer.fromJson(Map<String, dynamic> json) =>
      PlaylistPanelRenderer(
        contents: json["contents"] == null
            ? []
            : List<ContentElement>.from(
                json["contents"]!.map((x) => ContentElement.fromJson(x))),
        isInfinite: json["isInfinite"],
        trackingParams: json["trackingParams"],
        shuffleToggleButton: json["shuffleToggleButton"] == null
            ? null
            : ShuffleToggleButton.fromJson(json["shuffleToggleButton"]),
      );

  Map<String, dynamic> toJson() => {
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toJson())),
        "isInfinite": isInfinite,
        "trackingParams": trackingParams,
        "shuffleToggleButton": shuffleToggleButton?.toJson(),
      };
}

class ContentElement {
  final PlaylistPanelVideoRenderer? playlistPanelVideoRenderer;
  final AutomixPreviewVideoRenderer? automixPreviewVideoRenderer;

  ContentElement({
    this.playlistPanelVideoRenderer,
    this.automixPreviewVideoRenderer,
  });

  factory ContentElement.fromJson(Map<String, dynamic> json) => ContentElement(
        playlistPanelVideoRenderer: json["playlistPanelVideoRenderer"] == null
            ? null
            : PlaylistPanelVideoRenderer.fromJson(
                json["playlistPanelVideoRenderer"]),
        automixPreviewVideoRenderer: json["automixPreviewVideoRenderer"] == null
            ? null
            : AutomixPreviewVideoRenderer.fromJson(
                json["automixPreviewVideoRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "playlistPanelVideoRenderer": playlistPanelVideoRenderer?.toJson(),
        "automixPreviewVideoRenderer": automixPreviewVideoRenderer?.toJson(),
      };
}

class AutomixPreviewVideoRenderer {
  final AutomixPreviewVideoRendererContent? content;

  AutomixPreviewVideoRenderer({
    this.content,
  });

  factory AutomixPreviewVideoRenderer.fromJson(Map<String, dynamic> json) =>
      AutomixPreviewVideoRenderer(
        content: json["content"] == null
            ? null
            : AutomixPreviewVideoRendererContent.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
      };
}

class AutomixPreviewVideoRendererContent {
  final AutomixPlaylistVideoRenderer? automixPlaylistVideoRenderer;

  AutomixPreviewVideoRendererContent({
    this.automixPlaylistVideoRenderer,
  });

  factory AutomixPreviewVideoRendererContent.fromJson(
          Map<String, dynamic> json) =>
      AutomixPreviewVideoRendererContent(
        automixPlaylistVideoRenderer:
            json["automixPlaylistVideoRenderer"] == null
                ? null
                : AutomixPlaylistVideoRenderer.fromJson(
                    json["automixPlaylistVideoRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "automixPlaylistVideoRenderer": automixPlaylistVideoRenderer?.toJson(),
      };
}

class AutomixPlaylistVideoRenderer {
  final AutomixPlaylistVideoRendererNavigationEndpoint? navigationEndpoint;
  final String? trackingParams;
  final String? automixMode;

  AutomixPlaylistVideoRenderer({
    this.navigationEndpoint,
    this.trackingParams,
    this.automixMode,
  });

  factory AutomixPlaylistVideoRenderer.fromJson(Map<String, dynamic> json) =>
      AutomixPlaylistVideoRenderer(
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : AutomixPlaylistVideoRendererNavigationEndpoint.fromJson(
                json["navigationEndpoint"]),
        trackingParams: json["trackingParams"],
        automixMode: json["automixMode"],
      );

  Map<String, dynamic> toJson() => {
        "navigationEndpoint": navigationEndpoint?.toJson(),
        "trackingParams": trackingParams,
        "automixMode": automixMode,
      };
}

class AutomixPlaylistVideoRendererNavigationEndpoint {
  final String? clickTrackingParams;
  final NavigationEndpointWatchPlaylistEndpoint? watchPlaylistEndpoint;

  AutomixPlaylistVideoRendererNavigationEndpoint({
    this.clickTrackingParams,
    this.watchPlaylistEndpoint,
  });

  factory AutomixPlaylistVideoRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      AutomixPlaylistVideoRendererNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        watchPlaylistEndpoint: json["watchPlaylistEndpoint"] == null
            ? null
            : NavigationEndpointWatchPlaylistEndpoint.fromJson(
                json["watchPlaylistEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "watchPlaylistEndpoint": watchPlaylistEndpoint?.toJson(),
      };
}

class NavigationEndpointWatchPlaylistEndpoint {
  final String? playlistId;
  final String? params;

  NavigationEndpointWatchPlaylistEndpoint({
    this.playlistId,
    this.params,
  });

  factory NavigationEndpointWatchPlaylistEndpoint.fromJson(
          Map<String, dynamic> json) =>
      NavigationEndpointWatchPlaylistEndpoint(
        playlistId: json["playlistId"],
        params: json["params"],
      );

  Map<String, dynamic> toJson() => {
        "playlistId": playlistId,
        "params": params,
      };
}

class PlaylistPanelVideoRenderer {
  final Title? title;
  final LongBylineText? longBylineText;
  final ThumbnailDetailsClass? thumbnail;
  final LengthText? lengthText;
  final bool? selected;
  final PlaylistPanelVideoRendererNavigationEndpoint? navigationEndpoint;
  final String? videoId;
  final Title? shortBylineText;
  final String? trackingParams;
  final Menu? menu;
  final bool? canReorder;
  final QueueNavigationEndpoint? queueNavigationEndpoint;

  PlaylistPanelVideoRenderer({
    this.title,
    this.longBylineText,
    this.thumbnail,
    this.lengthText,
    this.selected,
    this.navigationEndpoint,
    this.videoId,
    this.shortBylineText,
    this.trackingParams,
    this.menu,
    this.canReorder,
    this.queueNavigationEndpoint,
  });

  factory PlaylistPanelVideoRenderer.fromJson(Map<String, dynamic> json) =>
      PlaylistPanelVideoRenderer(
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        longBylineText: json["longBylineText"] == null
            ? null
            : LongBylineText.fromJson(json["longBylineText"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : ThumbnailDetailsClass.fromJson(json["thumbnail"]),
        lengthText: json["lengthText"] == null
            ? null
            : LengthText.fromJson(json["lengthText"]),
        selected: json["selected"],
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : PlaylistPanelVideoRendererNavigationEndpoint.fromJson(
                json["navigationEndpoint"]),
        videoId: json["videoId"],
        shortBylineText: json["shortBylineText"] == null
            ? null
            : Title.fromJson(json["shortBylineText"]),
        trackingParams: json["trackingParams"],
        menu: json["menu"] == null ? null : Menu.fromJson(json["menu"]),
        canReorder: json["canReorder"],
        queueNavigationEndpoint: json["queueNavigationEndpoint"] == null
            ? null
            : QueueNavigationEndpoint.fromJson(json["queueNavigationEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
        "longBylineText": longBylineText?.toJson(),
        "thumbnail": thumbnail?.toJson(),
        "lengthText": lengthText?.toJson(),
        "selected": selected,
        "navigationEndpoint": navigationEndpoint?.toJson(),
        "videoId": videoId,
        "shortBylineText": shortBylineText?.toJson(),
        "trackingParams": trackingParams,
        "menu": menu?.toJson(),
        "canReorder": canReorder,
        "queueNavigationEndpoint": queueNavigationEndpoint?.toJson(),
      };
}

class LengthText {
  final List<LengthTextRun>? runs;
  final Accessibility? accessibility;

  LengthText({
    this.runs,
    this.accessibility,
  });

  factory LengthText.fromJson(Map<String, dynamic> json) => LengthText(
        runs: json["runs"] == null
            ? []
            : List<LengthTextRun>.from(
                json["runs"]!.map((x) => LengthTextRun.fromJson(x))),
        accessibility: json["accessibility"] == null
            ? null
            : Accessibility.fromJson(json["accessibility"]),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null
            ? []
            : List<dynamic>.from(runs!.map((x) => x.toJson())),
        "accessibility": accessibility?.toJson(),
      };
}

class Accessibility {
  final AccessibilityData? accessibilityData;

  Accessibility({
    this.accessibilityData,
  });

  factory Accessibility.fromJson(Map<String, dynamic> json) => Accessibility(
        accessibilityData: json["accessibilityData"] == null
            ? null
            : AccessibilityData.fromJson(json["accessibilityData"]),
      );

  Map<String, dynamic> toJson() => {
        "accessibilityData": accessibilityData?.toJson(),
      };
}

class AccessibilityData {
  final String? label;

  AccessibilityData({
    this.label,
  });

  factory AccessibilityData.fromJson(Map<String, dynamic> json) =>
      AccessibilityData(
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
      };
}

class LengthTextRun {
  final String? text;

  LengthTextRun({
    this.text,
  });

  factory LengthTextRun.fromJson(Map<String, dynamic> json) => LengthTextRun(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class LongBylineText {
  final List<LongBylineTextRun>? runs;

  LongBylineText({
    this.runs,
  });

  factory LongBylineText.fromJson(Map<String, dynamic> json) => LongBylineText(
        runs: json["runs"] == null
            ? []
            : List<LongBylineTextRun>.from(
                json["runs"]!.map((x) => LongBylineTextRun.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null
            ? []
            : List<dynamic>.from(runs!.map((x) => x.toJson())),
      };
}

class LongBylineTextRun {
  final String? text;
  final Endpoint? navigationEndpoint;

  LongBylineTextRun({
    this.text,
    this.navigationEndpoint,
  });

  factory LongBylineTextRun.fromJson(Map<String, dynamic> json) =>
      LongBylineTextRun(
        text: json["text"],
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : Endpoint.fromJson(json["navigationEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "navigationEndpoint": navigationEndpoint?.toJson(),
      };
}

class Endpoint {
  final String? clickTrackingParams;
  final BrowseEndpoint? browseEndpoint;

  Endpoint({
    this.clickTrackingParams,
    this.browseEndpoint,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) => Endpoint(
        clickTrackingParams: json["clickTrackingParams"],
        browseEndpoint: json["browseEndpoint"] == null
            ? null
            : BrowseEndpoint.fromJson(json["browseEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "browseEndpoint": browseEndpoint?.toJson(),
      };
}

class BrowseEndpoint {
  final String? browseId;
  final BrowseEndpointContextSupportedConfigs?
      browseEndpointContextSupportedConfigs;

  BrowseEndpoint({
    this.browseId,
    this.browseEndpointContextSupportedConfigs,
  });

  factory BrowseEndpoint.fromJson(Map<String, dynamic> json) => BrowseEndpoint(
        browseId: json["browseId"],
        browseEndpointContextSupportedConfigs:
            json["browseEndpointContextSupportedConfigs"] == null
                ? null
                : BrowseEndpointContextSupportedConfigs.fromJson(
                    json["browseEndpointContextSupportedConfigs"]),
      );

  Map<String, dynamic> toJson() => {
        "browseId": browseId,
        "browseEndpointContextSupportedConfigs":
            browseEndpointContextSupportedConfigs?.toJson(),
      };
}

class BrowseEndpointContextSupportedConfigs {
  final BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig;

  BrowseEndpointContextSupportedConfigs({
    this.browseEndpointContextMusicConfig,
  });

  factory BrowseEndpointContextSupportedConfigs.fromJson(
          Map<String, dynamic> json) =>
      BrowseEndpointContextSupportedConfigs(
        browseEndpointContextMusicConfig:
            json["browseEndpointContextMusicConfig"] == null
                ? null
                : BrowseEndpointContextMusicConfig.fromJson(
                    json["browseEndpointContextMusicConfig"]),
      );

  Map<String, dynamic> toJson() => {
        "browseEndpointContextMusicConfig":
            browseEndpointContextMusicConfig?.toJson(),
      };
}

class BrowseEndpointContextMusicConfig {
  final String? pageType;

  BrowseEndpointContextMusicConfig({
    this.pageType,
  });

  factory BrowseEndpointContextMusicConfig.fromJson(
          Map<String, dynamic> json) =>
      BrowseEndpointContextMusicConfig(
        pageType: json["pageType"],
      );

  Map<String, dynamic> toJson() => {
        "pageType": pageType,
      };
}

class Menu {
  final MenuRenderer? menuRenderer;

  Menu({
    this.menuRenderer,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuRenderer: json["menuRenderer"] == null
            ? null
            : MenuRenderer.fromJson(json["menuRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "menuRenderer": menuRenderer?.toJson(),
      };
}

class MenuRenderer {
  final List<MenuRendererItem>? items;
  final String? trackingParams;
  final Accessibility? accessibility;

  MenuRenderer({
    this.items,
    this.trackingParams,
    this.accessibility,
  });

  factory MenuRenderer.fromJson(Map<String, dynamic> json) => MenuRenderer(
        items: json["items"] == null
            ? []
            : List<MenuRendererItem>.from(
                json["items"]!.map((x) => MenuRendererItem.fromJson(x))),
        trackingParams: json["trackingParams"],
        accessibility: json["accessibility"] == null
            ? null
            : Accessibility.fromJson(json["accessibility"]),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "trackingParams": trackingParams,
        "accessibility": accessibility?.toJson(),
      };
}

class MenuRendererItem {
  final MenuItemRenderer? menuNavigationItemRenderer;
  final MenuItemRenderer? menuServiceItemRenderer;
  final ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer;

  MenuRendererItem({
    this.menuNavigationItemRenderer,
    this.menuServiceItemRenderer,
    this.toggleMenuServiceItemRenderer,
  });

  factory MenuRendererItem.fromJson(Map<String, dynamic> json) =>
      MenuRendererItem(
        menuNavigationItemRenderer: json["menuNavigationItemRenderer"] == null
            ? null
            : MenuItemRenderer.fromJson(json["menuNavigationItemRenderer"]),
        menuServiceItemRenderer: json["menuServiceItemRenderer"] == null
            ? null
            : MenuItemRenderer.fromJson(json["menuServiceItemRenderer"]),
        toggleMenuServiceItemRenderer:
            json["toggleMenuServiceItemRenderer"] == null
                ? null
                : ToggleMenuServiceItemRenderer.fromJson(
                    json["toggleMenuServiceItemRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "menuNavigationItemRenderer": menuNavigationItemRenderer?.toJson(),
        "menuServiceItemRenderer": menuServiceItemRenderer?.toJson(),
        "toggleMenuServiceItemRenderer":
            toggleMenuServiceItemRenderer?.toJson(),
      };
}

class MenuItemRenderer {
  final Title? text;
  final Icon? icon;
  final MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint;
  final String? trackingParams;
  final ServiceEndpoint? serviceEndpoint;

  MenuItemRenderer({
    this.text,
    this.icon,
    this.navigationEndpoint,
    this.trackingParams,
    this.serviceEndpoint,
  });

  factory MenuItemRenderer.fromJson(Map<String, dynamic> json) =>
      MenuItemRenderer(
        text: json["text"] == null ? null : Title.fromJson(json["text"]),
        icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : MenuNavigationItemRendererNavigationEndpoint.fromJson(
                json["navigationEndpoint"]),
        trackingParams: json["trackingParams"],
        serviceEndpoint: json["serviceEndpoint"] == null
            ? null
            : ServiceEndpoint.fromJson(json["serviceEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text?.toJson(),
        "icon": icon?.toJson(),
        "navigationEndpoint": navigationEndpoint?.toJson(),
        "trackingParams": trackingParams,
        "serviceEndpoint": serviceEndpoint?.toJson(),
      };
}

class Icon {
  final String? iconType;

  Icon({
    this.iconType,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        iconType: json["iconType"],
      );

  Map<String, dynamic> toJson() => {
        "iconType": iconType,
      };
}

class MenuNavigationItemRendererNavigationEndpoint {
  final String? clickTrackingParams;
  final PurpleWatchEndpoint? watchEndpoint;
  final ModalEndpoint? modalEndpoint;
  final BrowseEndpoint? browseEndpoint;
  final ShareEntityEndpoint? shareEntityEndpoint;

  MenuNavigationItemRendererNavigationEndpoint({
    this.clickTrackingParams,
    this.watchEndpoint,
    this.modalEndpoint,
    this.browseEndpoint,
    this.shareEntityEndpoint,
  });

  factory MenuNavigationItemRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      MenuNavigationItemRendererNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        watchEndpoint: json["watchEndpoint"] == null
            ? null
            : PurpleWatchEndpoint.fromJson(json["watchEndpoint"]),
        modalEndpoint: json["modalEndpoint"] == null
            ? null
            : ModalEndpoint.fromJson(json["modalEndpoint"]),
        browseEndpoint: json["browseEndpoint"] == null
            ? null
            : BrowseEndpoint.fromJson(json["browseEndpoint"]),
        shareEntityEndpoint: json["shareEntityEndpoint"] == null
            ? null
            : ShareEntityEndpoint.fromJson(json["shareEntityEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "watchEndpoint": watchEndpoint?.toJson(),
        "modalEndpoint": modalEndpoint?.toJson(),
        "browseEndpoint": browseEndpoint?.toJson(),
        "shareEntityEndpoint": shareEntityEndpoint?.toJson(),
      };
}

class ModalEndpoint {
  final Modal? modal;

  ModalEndpoint({
    this.modal,
  });

  factory ModalEndpoint.fromJson(Map<String, dynamic> json) => ModalEndpoint(
        modal: json["modal"] == null ? null : Modal.fromJson(json["modal"]),
      );

  Map<String, dynamic> toJson() => {
        "modal": modal?.toJson(),
      };
}

class Modal {
  final ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer;

  Modal({
    this.modalWithTitleAndButtonRenderer,
  });

  factory Modal.fromJson(Map<String, dynamic> json) => Modal(
        modalWithTitleAndButtonRenderer:
            json["modalWithTitleAndButtonRenderer"] == null
                ? null
                : ModalWithTitleAndButtonRenderer.fromJson(
                    json["modalWithTitleAndButtonRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "modalWithTitleAndButtonRenderer":
            modalWithTitleAndButtonRenderer?.toJson(),
      };
}

class ModalWithTitleAndButtonRenderer {
  final Title? title;
  final Title? content;
  final CancelButtonClass? button;

  ModalWithTitleAndButtonRenderer({
    this.title,
    this.content,
    this.button,
  });

  factory ModalWithTitleAndButtonRenderer.fromJson(Map<String, dynamic> json) =>
      ModalWithTitleAndButtonRenderer(
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        content:
            json["content"] == null ? null : Title.fromJson(json["content"]),
        button: json["button"] == null
            ? null
            : CancelButtonClass.fromJson(json["button"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
        "content": content?.toJson(),
        "button": button?.toJson(),
      };
}

class CancelButtonClass {
  final ButtonRenderer? buttonRenderer;

  CancelButtonClass({
    this.buttonRenderer,
  });

  factory CancelButtonClass.fromJson(Map<String, dynamic> json) =>
      CancelButtonClass(
        buttonRenderer: json["buttonRenderer"] == null
            ? null
            : ButtonRenderer.fromJson(json["buttonRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "buttonRenderer": buttonRenderer?.toJson(),
      };
}

class ButtonRenderer {
  final String? style;
  final bool? isDisabled;
  final Title? text;
  final ButtonRendererNavigationEndpoint? navigationEndpoint;
  final String? trackingParams;

  ButtonRenderer({
    this.style,
    this.isDisabled,
    this.text,
    this.navigationEndpoint,
    this.trackingParams,
  });

  factory ButtonRenderer.fromJson(Map<String, dynamic> json) => ButtonRenderer(
        style: json["style"],
        isDisabled: json["isDisabled"],
        text: json["text"] == null ? null : Title.fromJson(json["text"]),
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : ButtonRendererNavigationEndpoint.fromJson(
                json["navigationEndpoint"]),
        trackingParams: json["trackingParams"],
      );

  Map<String, dynamic> toJson() => {
        "style": style,
        "isDisabled": isDisabled,
        "text": text?.toJson(),
        "navigationEndpoint": navigationEndpoint?.toJson(),
        "trackingParams": trackingParams,
      };
}

class ButtonRendererNavigationEndpoint {
  final String? clickTrackingParams;
  final SignInEndpoint? signInEndpoint;

  ButtonRendererNavigationEndpoint({
    this.clickTrackingParams,
    this.signInEndpoint,
  });

  factory ButtonRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      ButtonRendererNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        signInEndpoint: json["signInEndpoint"] == null
            ? null
            : SignInEndpoint.fromJson(json["signInEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "signInEndpoint": signInEndpoint?.toJson(),
      };
}

class SignInEndpoint {
  final bool? hack;

  SignInEndpoint({
    this.hack,
  });

  factory SignInEndpoint.fromJson(Map<String, dynamic> json) => SignInEndpoint(
        hack: json["hack"],
      );

  Map<String, dynamic> toJson() => {
        "hack": hack,
      };
}

class Title {
  final List<LengthTextRun>? runs;

  Title({
    this.runs,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        runs: json["runs"] == null
            ? []
            : List<LengthTextRun>.from(
                json["runs"]!.map((x) => LengthTextRun.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null
            ? []
            : List<dynamic>.from(runs!.map((x) => x.toJson())),
      };
}

class ShareEntityEndpoint {
  final String? serializedShareEntity;
  final String? sharePanelType;

  ShareEntityEndpoint({
    this.serializedShareEntity,
    this.sharePanelType,
  });

  factory ShareEntityEndpoint.fromJson(Map<String, dynamic> json) =>
      ShareEntityEndpoint(
        serializedShareEntity: json["serializedShareEntity"],
        sharePanelType: json["sharePanelType"],
      );

  Map<String, dynamic> toJson() => {
        "serializedShareEntity": serializedShareEntity,
        "sharePanelType": sharePanelType,
      };
}

class PurpleWatchEndpoint {
  final String? videoId;
  final String? playlistId;
  final String? params;
  final LoggingContext? loggingContext;
  final PurpleWatchEndpointMusicSupportedConfigs?
      watchEndpointMusicSupportedConfigs;

  PurpleWatchEndpoint({
    this.videoId,
    this.playlistId,
    this.params,
    this.loggingContext,
    this.watchEndpointMusicSupportedConfigs,
  });

  factory PurpleWatchEndpoint.fromJson(Map<String, dynamic> json) =>
      PurpleWatchEndpoint(
        videoId: json["videoId"],
        playlistId: json["playlistId"],
        params: json["params"],
        loggingContext: json["loggingContext"] == null
            ? null
            : LoggingContext.fromJson(json["loggingContext"]),
        watchEndpointMusicSupportedConfigs:
            json["watchEndpointMusicSupportedConfigs"] == null
                ? null
                : PurpleWatchEndpointMusicSupportedConfigs.fromJson(
                    json["watchEndpointMusicSupportedConfigs"]),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "playlistId": playlistId,
        "params": params,
        "loggingContext": loggingContext?.toJson(),
        "watchEndpointMusicSupportedConfigs":
            watchEndpointMusicSupportedConfigs?.toJson(),
      };
}

class LoggingContext {
  final VssLoggingContext? vssLoggingContext;

  LoggingContext({
    this.vssLoggingContext,
  });

  factory LoggingContext.fromJson(Map<String, dynamic> json) => LoggingContext(
        vssLoggingContext: json["vssLoggingContext"] == null
            ? null
            : VssLoggingContext.fromJson(json["vssLoggingContext"]),
      );

  Map<String, dynamic> toJson() => {
        "vssLoggingContext": vssLoggingContext?.toJson(),
      };
}

class VssLoggingContext {
  final String? serializedContextData;

  VssLoggingContext({
    this.serializedContextData,
  });

  factory VssLoggingContext.fromJson(Map<String, dynamic> json) =>
      VssLoggingContext(
        serializedContextData: json["serializedContextData"],
      );

  Map<String, dynamic> toJson() => {
        "serializedContextData": serializedContextData,
      };
}

class PurpleWatchEndpointMusicSupportedConfigs {
  final PurpleWatchEndpointMusicConfig? watchEndpointMusicConfig;

  PurpleWatchEndpointMusicSupportedConfigs({
    this.watchEndpointMusicConfig,
  });

  factory PurpleWatchEndpointMusicSupportedConfigs.fromJson(
          Map<String, dynamic> json) =>
      PurpleWatchEndpointMusicSupportedConfigs(
        watchEndpointMusicConfig: json["watchEndpointMusicConfig"] == null
            ? null
            : PurpleWatchEndpointMusicConfig.fromJson(
                json["watchEndpointMusicConfig"]),
      );

  Map<String, dynamic> toJson() => {
        "watchEndpointMusicConfig": watchEndpointMusicConfig?.toJson(),
      };
}

class PurpleWatchEndpointMusicConfig {
  final String? musicVideoType;

  PurpleWatchEndpointMusicConfig({
    this.musicVideoType,
  });

  factory PurpleWatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) =>
      PurpleWatchEndpointMusicConfig(
        musicVideoType: json["musicVideoType"],
      );

  Map<String, dynamic> toJson() => {
        "musicVideoType": musicVideoType,
      };
}

class ServiceEndpoint {
  final String? clickTrackingParams;
  final ServiceEndpointQueueAddEndpoint? queueAddEndpoint;
  final RemoveFromQueueEndpoint? removeFromQueueEndpoint;
  final ModalEndpoint? modalEndpoint;

  ServiceEndpoint({
    this.clickTrackingParams,
    this.queueAddEndpoint,
    this.removeFromQueueEndpoint,
    this.modalEndpoint,
  });

  factory ServiceEndpoint.fromJson(Map<String, dynamic> json) =>
      ServiceEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        queueAddEndpoint: json["queueAddEndpoint"] == null
            ? null
            : ServiceEndpointQueueAddEndpoint.fromJson(
                json["queueAddEndpoint"]),
        removeFromQueueEndpoint: json["removeFromQueueEndpoint"] == null
            ? null
            : RemoveFromQueueEndpoint.fromJson(json["removeFromQueueEndpoint"]),
        modalEndpoint: json["modalEndpoint"] == null
            ? null
            : ModalEndpoint.fromJson(json["modalEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "queueAddEndpoint": queueAddEndpoint?.toJson(),
        "removeFromQueueEndpoint": removeFromQueueEndpoint?.toJson(),
        "modalEndpoint": modalEndpoint?.toJson(),
      };
}

class ServiceEndpointQueueAddEndpoint {
  final QueueTarget? queueTarget;
  final String? queueInsertPosition;
  final List<Command>? commands;

  ServiceEndpointQueueAddEndpoint({
    this.queueTarget,
    this.queueInsertPosition,
    this.commands,
  });

  factory ServiceEndpointQueueAddEndpoint.fromJson(Map<String, dynamic> json) =>
      ServiceEndpointQueueAddEndpoint(
        queueTarget: json["queueTarget"] == null
            ? null
            : QueueTarget.fromJson(json["queueTarget"]),
        queueInsertPosition: json["queueInsertPosition"],
        commands: json["commands"] == null
            ? []
            : List<Command>.from(
                json["commands"]!.map((x) => Command.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queueTarget": queueTarget?.toJson(),
        "queueInsertPosition": queueInsertPosition,
        "commands": commands == null
            ? []
            : List<dynamic>.from(commands!.map((x) => x.toJson())),
      };
}

class Command {
  final String? clickTrackingParams;
  final AddToToastAction? addToToastAction;

  Command({
    this.clickTrackingParams,
    this.addToToastAction,
  });

  factory Command.fromJson(Map<String, dynamic> json) => Command(
        clickTrackingParams: json["clickTrackingParams"],
        addToToastAction: json["addToToastAction"] == null
            ? null
            : AddToToastAction.fromJson(json["addToToastAction"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "addToToastAction": addToToastAction?.toJson(),
      };
}

class AddToToastAction {
  final AddToToastActionItem? item;

  AddToToastAction({
    this.item,
  });

  factory AddToToastAction.fromJson(Map<String, dynamic> json) =>
      AddToToastAction(
        item: json["item"] == null
            ? null
            : AddToToastActionItem.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
      };
}

class AddToToastActionItem {
  final NotificationTextRenderer? notificationTextRenderer;

  AddToToastActionItem({
    this.notificationTextRenderer,
  });

  factory AddToToastActionItem.fromJson(Map<String, dynamic> json) =>
      AddToToastActionItem(
        notificationTextRenderer: json["notificationTextRenderer"] == null
            ? null
            : NotificationTextRenderer.fromJson(
                json["notificationTextRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "notificationTextRenderer": notificationTextRenderer?.toJson(),
      };
}

class NotificationTextRenderer {
  final Title? successResponseText;
  final String? trackingParams;

  NotificationTextRenderer({
    this.successResponseText,
    this.trackingParams,
  });

  factory NotificationTextRenderer.fromJson(Map<String, dynamic> json) =>
      NotificationTextRenderer(
        successResponseText: json["successResponseText"] == null
            ? null
            : Title.fromJson(json["successResponseText"]),
        trackingParams: json["trackingParams"],
      );

  Map<String, dynamic> toJson() => {
        "successResponseText": successResponseText?.toJson(),
        "trackingParams": trackingParams,
      };
}

class QueueTarget {
  final String? videoId;
  final OnEmptyQueue? onEmptyQueue;

  QueueTarget({
    this.videoId,
    this.onEmptyQueue,
  });

  factory QueueTarget.fromJson(Map<String, dynamic> json) => QueueTarget(
        videoId: json["videoId"],
        onEmptyQueue: json["onEmptyQueue"] == null
            ? null
            : OnEmptyQueue.fromJson(json["onEmptyQueue"]),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "onEmptyQueue": onEmptyQueue?.toJson(),
      };
}

class OnEmptyQueue {
  final String? clickTrackingParams;
  final Target? watchEndpoint;

  OnEmptyQueue({
    this.clickTrackingParams,
    this.watchEndpoint,
  });

  factory OnEmptyQueue.fromJson(Map<String, dynamic> json) => OnEmptyQueue(
        clickTrackingParams: json["clickTrackingParams"],
        watchEndpoint: json["watchEndpoint"] == null
            ? null
            : Target.fromJson(json["watchEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "watchEndpoint": watchEndpoint?.toJson(),
      };
}

class Target {
  final String? videoId;

  Target({
    this.videoId,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
      };
}

class RemoveFromQueueEndpoint {
  final String? videoId;
  final List<Command>? commands;

  RemoveFromQueueEndpoint({
    this.videoId,
    this.commands,
  });

  factory RemoveFromQueueEndpoint.fromJson(Map<String, dynamic> json) =>
      RemoveFromQueueEndpoint(
        videoId: json["videoId"],
        commands: json["commands"] == null
            ? []
            : List<Command>.from(
                json["commands"]!.map((x) => Command.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "commands": commands == null
            ? []
            : List<dynamic>.from(commands!.map((x) => x.toJson())),
      };
}

class ToggleMenuServiceItemRenderer {
  final Title? defaultText;
  final Icon? defaultIcon;
  final DislikeNavigationEndpoint? defaultServiceEndpoint;
  final Title? toggledText;
  final Icon? toggledIcon;
  final String? trackingParams;

  ToggleMenuServiceItemRenderer({
    this.defaultText,
    this.defaultIcon,
    this.defaultServiceEndpoint,
    this.toggledText,
    this.toggledIcon,
    this.trackingParams,
  });

  factory ToggleMenuServiceItemRenderer.fromJson(Map<String, dynamic> json) =>
      ToggleMenuServiceItemRenderer(
        defaultText: json["defaultText"] == null
            ? null
            : Title.fromJson(json["defaultText"]),
        defaultIcon: json["defaultIcon"] == null
            ? null
            : Icon.fromJson(json["defaultIcon"]),
        defaultServiceEndpoint: json["defaultServiceEndpoint"] == null
            ? null
            : DislikeNavigationEndpoint.fromJson(
                json["defaultServiceEndpoint"]),
        toggledText: json["toggledText"] == null
            ? null
            : Title.fromJson(json["toggledText"]),
        toggledIcon: json["toggledIcon"] == null
            ? null
            : Icon.fromJson(json["toggledIcon"]),
        trackingParams: json["trackingParams"],
      );

  Map<String, dynamic> toJson() => {
        "defaultText": defaultText?.toJson(),
        "defaultIcon": defaultIcon?.toJson(),
        "defaultServiceEndpoint": defaultServiceEndpoint?.toJson(),
        "toggledText": toggledText?.toJson(),
        "toggledIcon": toggledIcon?.toJson(),
        "trackingParams": trackingParams,
      };
}

class DislikeNavigationEndpoint {
  final String? clickTrackingParams;
  final ModalEndpoint? modalEndpoint;

  DislikeNavigationEndpoint({
    this.clickTrackingParams,
    this.modalEndpoint,
  });

  factory DislikeNavigationEndpoint.fromJson(Map<String, dynamic> json) =>
      DislikeNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        modalEndpoint: json["modalEndpoint"] == null
            ? null
            : ModalEndpoint.fromJson(json["modalEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "modalEndpoint": modalEndpoint?.toJson(),
      };
}

class PlaylistPanelVideoRendererNavigationEndpoint {
  final String? clickTrackingParams;
  final FluffyWatchEndpoint? watchEndpoint;

  PlaylistPanelVideoRendererNavigationEndpoint({
    this.clickTrackingParams,
    this.watchEndpoint,
  });

  factory PlaylistPanelVideoRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      PlaylistPanelVideoRendererNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        watchEndpoint: json["watchEndpoint"] == null
            ? null
            : FluffyWatchEndpoint.fromJson(json["watchEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "watchEndpoint": watchEndpoint?.toJson(),
      };
}

class FluffyWatchEndpoint {
  final String? videoId;
  final String? params;
  final FluffyWatchEndpointMusicSupportedConfigs?
      watchEndpointMusicSupportedConfigs;

  FluffyWatchEndpoint({
    this.videoId,
    this.params,
    this.watchEndpointMusicSupportedConfigs,
  });

  factory FluffyWatchEndpoint.fromJson(Map<String, dynamic> json) =>
      FluffyWatchEndpoint(
        videoId: json["videoId"],
        params: json["params"],
        watchEndpointMusicSupportedConfigs:
            json["watchEndpointMusicSupportedConfigs"] == null
                ? null
                : FluffyWatchEndpointMusicSupportedConfigs.fromJson(
                    json["watchEndpointMusicSupportedConfigs"]),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "params": params,
        "watchEndpointMusicSupportedConfigs":
            watchEndpointMusicSupportedConfigs?.toJson(),
      };
}

class FluffyWatchEndpointMusicSupportedConfigs {
  final FluffyWatchEndpointMusicConfig? watchEndpointMusicConfig;

  FluffyWatchEndpointMusicSupportedConfigs({
    this.watchEndpointMusicConfig,
  });

  factory FluffyWatchEndpointMusicSupportedConfigs.fromJson(
          Map<String, dynamic> json) =>
      FluffyWatchEndpointMusicSupportedConfigs(
        watchEndpointMusicConfig: json["watchEndpointMusicConfig"] == null
            ? null
            : FluffyWatchEndpointMusicConfig.fromJson(
                json["watchEndpointMusicConfig"]),
      );

  Map<String, dynamic> toJson() => {
        "watchEndpointMusicConfig": watchEndpointMusicConfig?.toJson(),
      };
}

class FluffyWatchEndpointMusicConfig {
  final bool? hasPersistentPlaylistPanel;
  final String? musicVideoType;

  FluffyWatchEndpointMusicConfig({
    this.hasPersistentPlaylistPanel,
    this.musicVideoType,
  });

  factory FluffyWatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) =>
      FluffyWatchEndpointMusicConfig(
        hasPersistentPlaylistPanel: json["hasPersistentPlaylistPanel"],
        musicVideoType: json["musicVideoType"],
      );

  Map<String, dynamic> toJson() => {
        "hasPersistentPlaylistPanel": hasPersistentPlaylistPanel,
        "musicVideoType": musicVideoType,
      };
}

class QueueNavigationEndpoint {
  final String? clickTrackingParams;
  final QueueNavigationEndpointQueueAddEndpoint? queueAddEndpoint;

  QueueNavigationEndpoint({
    this.clickTrackingParams,
    this.queueAddEndpoint,
  });

  factory QueueNavigationEndpoint.fromJson(Map<String, dynamic> json) =>
      QueueNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        queueAddEndpoint: json["queueAddEndpoint"] == null
            ? null
            : QueueNavigationEndpointQueueAddEndpoint.fromJson(
                json["queueAddEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "queueAddEndpoint": queueAddEndpoint?.toJson(),
      };
}

class QueueNavigationEndpointQueueAddEndpoint {
  final Target? queueTarget;
  final String? queueInsertPosition;

  QueueNavigationEndpointQueueAddEndpoint({
    this.queueTarget,
    this.queueInsertPosition,
  });

  factory QueueNavigationEndpointQueueAddEndpoint.fromJson(
          Map<String, dynamic> json) =>
      QueueNavigationEndpointQueueAddEndpoint(
        queueTarget: json["queueTarget"] == null
            ? null
            : Target.fromJson(json["queueTarget"]),
        queueInsertPosition: json["queueInsertPosition"],
      );

  Map<String, dynamic> toJson() => {
        "queueTarget": queueTarget?.toJson(),
        "queueInsertPosition": queueInsertPosition,
      };
}

class ThumbnailDetailsClass {
  final List<ThumbnailElement>? thumbnails;

  ThumbnailDetailsClass({
    this.thumbnails,
  });

  factory ThumbnailDetailsClass.fromJson(Map<String, dynamic> json) =>
      ThumbnailDetailsClass(
        thumbnails: json["thumbnails"] == null
            ? []
            : List<ThumbnailElement>.from(
                json["thumbnails"]!.map((x) => ThumbnailElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "thumbnails": thumbnails == null
            ? []
            : List<dynamic>.from(thumbnails!.map((x) => x.toJson())),
      };
}

class ThumbnailElement {
  final String? url;
  final int? width;
  final int? height;

  ThumbnailElement({
    this.url,
    this.width,
    this.height,
  });

  factory ThumbnailElement.fromJson(Map<String, dynamic> json) =>
      ThumbnailElement(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class ShuffleToggleButton {
  final ToggleButtonRenderer? toggleButtonRenderer;

  ShuffleToggleButton({
    this.toggleButtonRenderer,
  });

  factory ShuffleToggleButton.fromJson(Map<String, dynamic> json) =>
      ShuffleToggleButton(
        toggleButtonRenderer: json["toggleButtonRenderer"] == null
            ? null
            : ToggleButtonRenderer.fromJson(json["toggleButtonRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "toggleButtonRenderer": toggleButtonRenderer?.toJson(),
      };
}

class ToggleButtonRenderer {
  final Icon? defaultIcon;
  final DefaultServiceEndpointClass? defaultServiceEndpoint;
  final Icon? toggledIcon;
  final DefaultServiceEndpointClass? toggledServiceEndpoint;
  final String? trackingParams;

  ToggleButtonRenderer({
    this.defaultIcon,
    this.defaultServiceEndpoint,
    this.toggledIcon,
    this.toggledServiceEndpoint,
    this.trackingParams,
  });

  factory ToggleButtonRenderer.fromJson(Map<String, dynamic> json) =>
      ToggleButtonRenderer(
        defaultIcon: json["defaultIcon"] == null
            ? null
            : Icon.fromJson(json["defaultIcon"]),
        defaultServiceEndpoint: json["defaultServiceEndpoint"] == null
            ? null
            : DefaultServiceEndpointClass.fromJson(
                json["defaultServiceEndpoint"]),
        toggledIcon: json["toggledIcon"] == null
            ? null
            : Icon.fromJson(json["toggledIcon"]),
        toggledServiceEndpoint: json["toggledServiceEndpoint"] == null
            ? null
            : DefaultServiceEndpointClass.fromJson(
                json["toggledServiceEndpoint"]),
        trackingParams: json["trackingParams"],
      );

  Map<String, dynamic> toJson() => {
        "defaultIcon": defaultIcon?.toJson(),
        "defaultServiceEndpoint": defaultServiceEndpoint?.toJson(),
        "toggledIcon": toggledIcon?.toJson(),
        "toggledServiceEndpoint": toggledServiceEndpoint?.toJson(),
        "trackingParams": trackingParams,
      };
}

class DefaultServiceEndpointClass {
  final String? clickTrackingParams;
  final DefaultServiceEndpointWatchPlaylistEndpoint? watchPlaylistEndpoint;

  DefaultServiceEndpointClass({
    this.clickTrackingParams,
    this.watchPlaylistEndpoint,
  });

  factory DefaultServiceEndpointClass.fromJson(Map<String, dynamic> json) =>
      DefaultServiceEndpointClass(
        clickTrackingParams: json["clickTrackingParams"],
        watchPlaylistEndpoint: json["watchPlaylistEndpoint"] == null
            ? null
            : DefaultServiceEndpointWatchPlaylistEndpoint.fromJson(
                json["watchPlaylistEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "watchPlaylistEndpoint": watchPlaylistEndpoint?.toJson(),
      };
}

class DefaultServiceEndpointWatchPlaylistEndpoint {
  final String? params;

  DefaultServiceEndpointWatchPlaylistEndpoint({
    this.params,
  });

  factory DefaultServiceEndpointWatchPlaylistEndpoint.fromJson(
          Map<String, dynamic> json) =>
      DefaultServiceEndpointWatchPlaylistEndpoint(
        params: json["params"],
      );

  Map<String, dynamic> toJson() => {
        "params": params,
      };
}

class Header {
  final MusicQueueHeaderRenderer? musicQueueHeaderRenderer;

  Header({
    this.musicQueueHeaderRenderer,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        musicQueueHeaderRenderer: json["musicQueueHeaderRenderer"] == null
            ? null
            : MusicQueueHeaderRenderer.fromJson(
                json["musicQueueHeaderRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "musicQueueHeaderRenderer": musicQueueHeaderRenderer?.toJson(),
      };
}

class MusicQueueHeaderRenderer {
  final Title? title;
  final Title? subtitle;
  final List<ButtonElement>? buttons;
  final String? trackingParams;

  MusicQueueHeaderRenderer({
    this.title,
    this.subtitle,
    this.buttons,
    this.trackingParams,
  });

  factory MusicQueueHeaderRenderer.fromJson(Map<String, dynamic> json) =>
      MusicQueueHeaderRenderer(
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        subtitle:
            json["subtitle"] == null ? null : Title.fromJson(json["subtitle"]),
        buttons: json["buttons"] == null
            ? []
            : List<ButtonElement>.from(
                json["buttons"]!.map((x) => ButtonElement.fromJson(x))),
        trackingParams: json["trackingParams"],
      );

  Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
        "subtitle": subtitle?.toJson(),
        "buttons": buttons == null
            ? []
            : List<dynamic>.from(buttons!.map((x) => x.toJson())),
        "trackingParams": trackingParams,
      };
}

class ButtonElement {
  final ChipCloudChipRenderer? chipCloudChipRenderer;

  ButtonElement({
    this.chipCloudChipRenderer,
  });

  factory ButtonElement.fromJson(Map<String, dynamic> json) => ButtonElement(
        chipCloudChipRenderer: json["chipCloudChipRenderer"] == null
            ? null
            : ChipCloudChipRenderer.fromJson(json["chipCloudChipRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "chipCloudChipRenderer": chipCloudChipRenderer?.toJson(),
      };
}

class ChipCloudChipRenderer {
  final Style? style;
  final Title? text;
  final ChipCloudChipRendererNavigationEndpoint? navigationEndpoint;
  final String? trackingParams;
  final Icon? icon;
  final Accessibility? accessibilityData;
  final bool? isSelected;
  final String? uniqueId;

  ChipCloudChipRenderer({
    this.style,
    this.text,
    this.navigationEndpoint,
    this.trackingParams,
    this.icon,
    this.accessibilityData,
    this.isSelected,
    this.uniqueId,
  });

  factory ChipCloudChipRenderer.fromJson(Map<String, dynamic> json) =>
      ChipCloudChipRenderer(
        style: json["style"] == null ? null : Style.fromJson(json["style"]),
        text: json["text"] == null ? null : Title.fromJson(json["text"]),
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : ChipCloudChipRendererNavigationEndpoint.fromJson(
                json["navigationEndpoint"]),
        trackingParams: json["trackingParams"],
        icon: json["icon"] == null ? null : Icon.fromJson(json["icon"]),
        accessibilityData: json["accessibilityData"] == null
            ? null
            : Accessibility.fromJson(json["accessibilityData"]),
        isSelected: json["isSelected"],
        uniqueId: json["uniqueId"],
      );

  Map<String, dynamic> toJson() => {
        "style": style?.toJson(),
        "text": text?.toJson(),
        "navigationEndpoint": navigationEndpoint?.toJson(),
        "trackingParams": trackingParams,
        "icon": icon?.toJson(),
        "accessibilityData": accessibilityData?.toJson(),
        "isSelected": isSelected,
        "uniqueId": uniqueId,
      };
}

class ChipCloudChipRendererNavigationEndpoint {
  final String? clickTrackingParams;
  final ModalEndpoint? modalEndpoint;
  final SaveQueueToPlaylistCommand? saveQueueToPlaylistCommand;

  ChipCloudChipRendererNavigationEndpoint({
    this.clickTrackingParams,
    this.modalEndpoint,
    this.saveQueueToPlaylistCommand,
  });

  factory ChipCloudChipRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      ChipCloudChipRendererNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        modalEndpoint: json["modalEndpoint"] == null
            ? null
            : ModalEndpoint.fromJson(json["modalEndpoint"]),
        saveQueueToPlaylistCommand: json["saveQueueToPlaylistCommand"] == null
            ? null
            : SaveQueueToPlaylistCommand.fromJson(
                json["saveQueueToPlaylistCommand"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "modalEndpoint": modalEndpoint?.toJson(),
        "saveQueueToPlaylistCommand": saveQueueToPlaylistCommand?.toJson(),
      };
}

class SaveQueueToPlaylistCommand {
  SaveQueueToPlaylistCommand();

  factory SaveQueueToPlaylistCommand.fromJson(Map<String, dynamic> json) =>
      SaveQueueToPlaylistCommand();

  Map<String, dynamic> toJson() => {};
}

class Style {
  final String? styleType;

  Style({
    this.styleType,
  });

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        styleType: json["styleType"],
      );

  Map<String, dynamic> toJson() => {
        "styleType": styleType,
      };
}

class CurrentVideoEndpoint {
  final String? clickTrackingParams;
  final CurrentVideoEndpointWatchEndpoint? watchEndpoint;

  CurrentVideoEndpoint({
    this.clickTrackingParams,
    this.watchEndpoint,
  });

  factory CurrentVideoEndpoint.fromJson(Map<String, dynamic> json) =>
      CurrentVideoEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        watchEndpoint: json["watchEndpoint"] == null
            ? null
            : CurrentVideoEndpointWatchEndpoint.fromJson(json["watchEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "watchEndpoint": watchEndpoint?.toJson(),
      };
}

class CurrentVideoEndpointWatchEndpoint {
  final String? videoId;
  final String? ustreamerConfig;

  CurrentVideoEndpointWatchEndpoint({
    this.videoId,
    this.ustreamerConfig,
  });

  factory CurrentVideoEndpointWatchEndpoint.fromJson(
          Map<String, dynamic> json) =>
      CurrentVideoEndpointWatchEndpoint(
        videoId: json["videoId"],
        ustreamerConfig: json["ustreamerConfig"],
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "ustreamerConfig": ustreamerConfig,
      };
}

class PlayerOverlays {
  final PlayerOverlayRenderer? playerOverlayRenderer;

  PlayerOverlays({
    this.playerOverlayRenderer,
  });

  factory PlayerOverlays.fromJson(Map<String, dynamic> json) => PlayerOverlays(
        playerOverlayRenderer: json["playerOverlayRenderer"] == null
            ? null
            : PlayerOverlayRenderer.fromJson(json["playerOverlayRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "playerOverlayRenderer": playerOverlayRenderer?.toJson(),
      };
}

class PlayerOverlayRenderer {
  final List<Action>? actions;
  final BrowserMediaSession? browserMediaSession;

  PlayerOverlayRenderer({
    this.actions,
    this.browserMediaSession,
  });

  factory PlayerOverlayRenderer.fromJson(Map<String, dynamic> json) =>
      PlayerOverlayRenderer(
        actions: json["actions"] == null
            ? []
            : List<Action>.from(
                json["actions"]!.map((x) => Action.fromJson(x))),
        browserMediaSession: json["browserMediaSession"] == null
            ? null
            : BrowserMediaSession.fromJson(json["browserMediaSession"]),
      );

  Map<String, dynamic> toJson() => {
        "actions": actions == null
            ? []
            : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "browserMediaSession": browserMediaSession?.toJson(),
      };
}

class Action {
  final LikeButtonRenderer? likeButtonRenderer;

  Action({
    this.likeButtonRenderer,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        likeButtonRenderer: json["likeButtonRenderer"] == null
            ? null
            : LikeButtonRenderer.fromJson(json["likeButtonRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "likeButtonRenderer": likeButtonRenderer?.toJson(),
      };
}

class LikeButtonRenderer {
  final Target? target;
  final String? likeStatus;
  final String? trackingParams;
  final bool? likesAllowed;
  final DislikeNavigationEndpoint? dislikeNavigationEndpoint;
  final DislikeNavigationEndpoint? likeCommand;

  LikeButtonRenderer({
    this.target,
    this.likeStatus,
    this.trackingParams,
    this.likesAllowed,
    this.dislikeNavigationEndpoint,
    this.likeCommand,
  });

  factory LikeButtonRenderer.fromJson(Map<String, dynamic> json) =>
      LikeButtonRenderer(
        target: json["target"] == null ? null : Target.fromJson(json["target"]),
        likeStatus: json["likeStatus"],
        trackingParams: json["trackingParams"],
        likesAllowed: json["likesAllowed"],
        dislikeNavigationEndpoint: json["dislikeNavigationEndpoint"] == null
            ? null
            : DislikeNavigationEndpoint.fromJson(
                json["dislikeNavigationEndpoint"]),
        likeCommand: json["likeCommand"] == null
            ? null
            : DislikeNavigationEndpoint.fromJson(json["likeCommand"]),
      );

  Map<String, dynamic> toJson() => {
        "target": target?.toJson(),
        "likeStatus": likeStatus,
        "trackingParams": trackingParams,
        "likesAllowed": likesAllowed,
        "dislikeNavigationEndpoint": dislikeNavigationEndpoint?.toJson(),
        "likeCommand": likeCommand?.toJson(),
      };
}

class BrowserMediaSession {
  final BrowserMediaSessionRenderer? browserMediaSessionRenderer;

  BrowserMediaSession({
    this.browserMediaSessionRenderer,
  });

  factory BrowserMediaSession.fromJson(Map<String, dynamic> json) =>
      BrowserMediaSession(
        browserMediaSessionRenderer: json["browserMediaSessionRenderer"] == null
            ? null
            : BrowserMediaSessionRenderer.fromJson(
                json["browserMediaSessionRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "browserMediaSessionRenderer": browserMediaSessionRenderer?.toJson(),
      };
}

class BrowserMediaSessionRenderer {
  final Title? album;
  final ThumbnailDetailsClass? thumbnailDetails;

  BrowserMediaSessionRenderer({
    this.album,
    this.thumbnailDetails,
  });

  factory BrowserMediaSessionRenderer.fromJson(Map<String, dynamic> json) =>
      BrowserMediaSessionRenderer(
        album: json["album"] == null ? null : Title.fromJson(json["album"]),
        thumbnailDetails: json["thumbnailDetails"] == null
            ? null
            : ThumbnailDetailsClass.fromJson(json["thumbnailDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
        "thumbnailDetails": thumbnailDetails?.toJson(),
      };
}

class ResponseContext {
  final String? visitorData;
  final List<ServiceTrackingParam>? serviceTrackingParams;

  ResponseContext({
    this.visitorData,
    this.serviceTrackingParams,
  });

  factory ResponseContext.fromJson(Map<String, dynamic> json) =>
      ResponseContext(
        visitorData: json["visitorData"],
        serviceTrackingParams: json["serviceTrackingParams"] == null
            ? []
            : List<ServiceTrackingParam>.from(json["serviceTrackingParams"]!
                .map((x) => ServiceTrackingParam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "visitorData": visitorData,
        "serviceTrackingParams": serviceTrackingParams == null
            ? []
            : List<dynamic>.from(serviceTrackingParams!.map((x) => x.toJson())),
      };
}

class ServiceTrackingParam {
  final String? service;
  final List<Param>? params;

  ServiceTrackingParam({
    this.service,
    this.params,
  });

  factory ServiceTrackingParam.fromJson(Map<String, dynamic> json) =>
      ServiceTrackingParam(
        service: json["service"],
        params: json["params"] == null
            ? []
            : List<Param>.from(json["params"]!.map((x) => Param.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "params": params == null
            ? []
            : List<dynamic>.from(params!.map((x) => x.toJson())),
      };
}

class Param {
  final String? key;
  final String? value;

  Param({
    this.key,
    this.value,
  });

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class VideoReporting {
  final ReportFormModalRenderer? reportFormModalRenderer;

  VideoReporting({
    this.reportFormModalRenderer,
  });

  factory VideoReporting.fromJson(Map<String, dynamic> json) => VideoReporting(
        reportFormModalRenderer: json["reportFormModalRenderer"] == null
            ? null
            : ReportFormModalRenderer.fromJson(json["reportFormModalRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "reportFormModalRenderer": reportFormModalRenderer?.toJson(),
      };
}

class ReportFormModalRenderer {
  final OptionsSupportedRenderers? optionsSupportedRenderers;
  final String? trackingParams;
  final Title? title;
  final CancelButtonClass? submitButton;
  final CancelButtonClass? cancelButton;
  final Footer? footer;

  ReportFormModalRenderer({
    this.optionsSupportedRenderers,
    this.trackingParams,
    this.title,
    this.submitButton,
    this.cancelButton,
    this.footer,
  });

  factory ReportFormModalRenderer.fromJson(Map<String, dynamic> json) =>
      ReportFormModalRenderer(
        optionsSupportedRenderers: json["optionsSupportedRenderers"] == null
            ? null
            : OptionsSupportedRenderers.fromJson(
                json["optionsSupportedRenderers"]),
        trackingParams: json["trackingParams"],
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        submitButton: json["submitButton"] == null
            ? null
            : CancelButtonClass.fromJson(json["submitButton"]),
        cancelButton: json["cancelButton"] == null
            ? null
            : CancelButtonClass.fromJson(json["cancelButton"]),
        footer: json["footer"] == null ? null : Footer.fromJson(json["footer"]),
      );

  Map<String, dynamic> toJson() => {
        "optionsSupportedRenderers": optionsSupportedRenderers?.toJson(),
        "trackingParams": trackingParams,
        "title": title?.toJson(),
        "submitButton": submitButton?.toJson(),
        "cancelButton": cancelButton?.toJson(),
        "footer": footer?.toJson(),
      };
}

class Footer {
  final List<FooterRun>? runs;

  Footer({
    this.runs,
  });

  factory Footer.fromJson(Map<String, dynamic> json) => Footer(
        runs: json["runs"] == null
            ? []
            : List<FooterRun>.from(
                json["runs"]!.map((x) => FooterRun.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null
            ? []
            : List<dynamic>.from(runs!.map((x) => x.toJson())),
      };
}

class FooterRun {
  final String? text;
  final RunNavigationEndpoint? navigationEndpoint;

  FooterRun({
    this.text,
    this.navigationEndpoint,
  });

  factory FooterRun.fromJson(Map<String, dynamic> json) => FooterRun(
        text: json["text"],
        navigationEndpoint: json["navigationEndpoint"] == null
            ? null
            : RunNavigationEndpoint.fromJson(json["navigationEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "navigationEndpoint": navigationEndpoint?.toJson(),
      };
}

class RunNavigationEndpoint {
  final String? clickTrackingParams;
  final UrlEndpoint? urlEndpoint;

  RunNavigationEndpoint({
    this.clickTrackingParams,
    this.urlEndpoint,
  });

  factory RunNavigationEndpoint.fromJson(Map<String, dynamic> json) =>
      RunNavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        urlEndpoint: json["urlEndpoint"] == null
            ? null
            : UrlEndpoint.fromJson(json["urlEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "urlEndpoint": urlEndpoint?.toJson(),
      };
}

class UrlEndpoint {
  final String? url;

  UrlEndpoint({
    this.url,
  });

  factory UrlEndpoint.fromJson(Map<String, dynamic> json) => UrlEndpoint(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class OptionsSupportedRenderers {
  final OptionsRenderer? optionsRenderer;

  OptionsSupportedRenderers({
    this.optionsRenderer,
  });

  factory OptionsSupportedRenderers.fromJson(Map<String, dynamic> json) =>
      OptionsSupportedRenderers(
        optionsRenderer: json["optionsRenderer"] == null
            ? null
            : OptionsRenderer.fromJson(json["optionsRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "optionsRenderer": optionsRenderer?.toJson(),
      };
}

class OptionsRenderer {
  final List<OptionsRendererItem>? items;
  final String? trackingParams;

  OptionsRenderer({
    this.items,
    this.trackingParams,
  });

  factory OptionsRenderer.fromJson(Map<String, dynamic> json) =>
      OptionsRenderer(
        items: json["items"] == null
            ? []
            : List<OptionsRendererItem>.from(
                json["items"]!.map((x) => OptionsRendererItem.fromJson(x))),
        trackingParams: json["trackingParams"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "trackingParams": trackingParams,
      };
}

class OptionsRendererItem {
  final OptionSelectableItemRenderer? optionSelectableItemRenderer;

  OptionsRendererItem({
    this.optionSelectableItemRenderer,
  });

  factory OptionsRendererItem.fromJson(Map<String, dynamic> json) =>
      OptionsRendererItem(
        optionSelectableItemRenderer:
            json["optionSelectableItemRenderer"] == null
                ? null
                : OptionSelectableItemRenderer.fromJson(
                    json["optionSelectableItemRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "optionSelectableItemRenderer": optionSelectableItemRenderer?.toJson(),
      };
}

class OptionSelectableItemRenderer {
  final Title? text;
  final String? trackingParams;
  final SubmitEndpoint? submitEndpoint;

  OptionSelectableItemRenderer({
    this.text,
    this.trackingParams,
    this.submitEndpoint,
  });

  factory OptionSelectableItemRenderer.fromJson(Map<String, dynamic> json) =>
      OptionSelectableItemRenderer(
        text: json["text"] == null ? null : Title.fromJson(json["text"]),
        trackingParams: json["trackingParams"],
        submitEndpoint: json["submitEndpoint"] == null
            ? null
            : SubmitEndpoint.fromJson(json["submitEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text?.toJson(),
        "trackingParams": trackingParams,
        "submitEndpoint": submitEndpoint?.toJson(),
      };
}

class SubmitEndpoint {
  final String? clickTrackingParams;
  final FlagEndpoint? flagEndpoint;

  SubmitEndpoint({
    this.clickTrackingParams,
    this.flagEndpoint,
  });

  factory SubmitEndpoint.fromJson(Map<String, dynamic> json) => SubmitEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        flagEndpoint: json["flagEndpoint"] == null
            ? null
            : FlagEndpoint.fromJson(json["flagEndpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "flagEndpoint": flagEndpoint?.toJson(),
      };
}

class FlagEndpoint {
  final String? flagAction;

  FlagEndpoint({
    this.flagAction,
  });

  factory FlagEndpoint.fromJson(Map<String, dynamic> json) => FlagEndpoint(
        flagAction: json["flagAction"],
      );

  Map<String, dynamic> toJson() => {
        "flagAction": flagAction,
      };
}
