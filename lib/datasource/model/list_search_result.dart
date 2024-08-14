import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_search_result.freezed.dart';
part 'list_search_result.g.dart';

@freezed
abstract class ListSearchSongResult with _$ListSearchResult {
  const factory ListSearchSongResult({
    ResponseContext? responseContext,
    Contents? contents,
    String? trackingParams,
  }) = _ListSearchResult;

  factory ListSearchSongResult.fromJson(Map<String, dynamic> json) =>
      _$ListSearchResultFromJson(json);
}

@freezed
abstract class Contents with _$Contents {
  const factory Contents({
    TabbedSearchResultsRenderer? tabbedSearchResultsRenderer,
  }) = _Contents;

  factory Contents.fromJson(Map<String, dynamic> json) =>
      _$ContentsFromJson(json);
}

@freezed
abstract class TabbedSearchResultsRenderer with _$TabbedSearchResultsRenderer {
  const factory TabbedSearchResultsRenderer({
    List<Tab>? tabs,
  }) = _TabbedSearchResultsRenderer;

  factory TabbedSearchResultsRenderer.fromJson(Map<String, dynamic> json) =>
      _$TabbedSearchResultsRendererFromJson(json);
}

@freezed
abstract class Tab with _$Tab {
  const factory Tab({
    TabRenderer? tabRenderer,
  }) = _Tab;

  factory Tab.fromJson(Map<String, dynamic> json) => _$TabFromJson(json);
}

@freezed
abstract class TabRenderer with _$TabRenderer {
  const factory TabRenderer({
    String? title,
    bool? selected,
    TabRendererContent? content,
    String? tabIdentifier,
    String? trackingParams,
  }) = _TabRenderer;

  factory TabRenderer.fromJson(Map<String, dynamic> json) =>
      _$TabRendererFromJson(json);
}

@freezed
abstract class TabRendererContent with _$TabRendererContent {
  const factory TabRendererContent({
    SectionListRenderer? sectionListRenderer,
  }) = _TabRendererContent;

  factory TabRendererContent.fromJson(Map<String, dynamic> json) =>
      _$TabRendererContentFromJson(json);
}

@freezed
abstract class SectionListRenderer with _$SectionListRenderer {
  const factory SectionListRenderer({
    List<SectionListRendererContent>? contents,
    String? trackingParams,
    Header? header,
  }) = _SectionListRenderer;

  factory SectionListRenderer.fromJson(Map<String, dynamic> json) =>
      _$SectionListRendererFromJson(json);
}

@freezed
abstract class SectionListRendererContent with _$SectionListRendererContent {
  const factory SectionListRendererContent({
    MusicShelfRenderer? musicShelfRenderer,
  }) = _SectionListRendererContent;

  factory SectionListRendererContent.fromJson(Map<String, dynamic> json) =>
      _$SectionListRendererContentFromJson(json);
}

@freezed
abstract class MusicShelfRenderer with _$MusicShelfRenderer {
  const factory MusicShelfRenderer({
    Title? title,
    List<MusicShelfRendererContent>? contents,
    String? trackingParams,
    List<Continuation>? continuations,
    ShelfDivider? shelfDivider,
  }) = _MusicShelfRenderer;

  factory MusicShelfRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicShelfRendererFromJson(json);
}

class MusicShelfRendererContent {
  MusicResponsiveListItemRenderer? musicResponsiveListItemRenderer;

  MusicShelfRendererContent({
    this.musicResponsiveListItemRenderer,
  });

  factory MusicShelfRendererContent.fromJson(Map<String, dynamic> json) =>
      MusicShelfRendererContent(
        musicResponsiveListItemRenderer:
            json["musicResponsiveListItemRenderer"] == null
                ? null
                : MusicResponsiveListItemRenderer.fromJson(
                    json["musicResponsiveListItemRenderer"]),
      );

  Map<String, dynamic> toJson() => {
        "musicResponsiveListItemRenderer":
            musicResponsiveListItemRenderer?.toJson(),
      };
}

@freezed
abstract class MusicResponsiveListItemRenderer
    with _$MusicResponsiveListItemRenderer {
  const factory MusicResponsiveListItemRenderer({
    String? trackingParams,
    MusicResponsiveListItemRendererThumbnail? thumbnail,
    Overlay? overlay,
    List<FlexColumn>? flexColumns,
    Menu? menu,
    PlaylistItemData? playlistItemData,
    String? flexColumnDisplayStyle,
    String? itemHeight,
    List<Badge>? badges,
  }) = _MusicResponsiveListItemRenderer;

  factory MusicResponsiveListItemRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicResponsiveListItemRendererFromJson(json);
}

@freezed
abstract class Badge with _$Badge {
  const factory Badge({
    MusicInlineBadgeRenderer? musicInlineBadgeRenderer,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}

@freezed
abstract class MusicInlineBadgeRenderer with _$MusicInlineBadgeRenderer {
  const factory MusicInlineBadgeRenderer({
    String? trackingParams,
    Icon? icon,
    Accessibility? accessibilityData,
  }) = _MusicInlineBadgeRenderer;

  factory MusicInlineBadgeRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicInlineBadgeRendererFromJson(json);
}

@freezed
abstract class Accessibility with _$Accessibility {
  const factory Accessibility({
    AccessibilityData? accessibilityData,
  }) = _Accessibility;

  factory Accessibility.fromJson(Map<String, dynamic> json) =>
      _$AccessibilityFromJson(json);
}

@freezed
abstract class AccessibilityData with _$AccessibilityData {
  const factory AccessibilityData({
    String? label,
  }) = _AccessibilityData;

  factory AccessibilityData.fromJson(Map<String, dynamic> json) =>
      _$AccessibilityDataFromJson(json);
}

@freezed
abstract class Icon with _$Icon {
  const factory Icon({
    String? iconType,
  }) = _Icon;

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);
}

@freezed
abstract class FlexColumn with _$FlexColumn {
  const factory FlexColumn({
    MusicResponsiveListItemFlexColumnRenderer?
        musicResponsiveListItemFlexColumnRenderer,
  }) = _FlexColumn;

  factory FlexColumn.fromJson(Map<String, dynamic> json) =>
      _$FlexColumnFromJson(json);
}

@freezed
abstract class MusicResponsiveListItemFlexColumnRenderer
    with _$MusicResponsiveListItemFlexColumnRenderer {
  const factory MusicResponsiveListItemFlexColumnRenderer({
    Text? text,
    String? displayPriority,
  }) = _MusicResponsiveListItemFlexColumnRenderer;

  factory MusicResponsiveListItemFlexColumnRenderer.fromJson(
          Map<String, dynamic> json) =>
      _$MusicResponsiveListItemFlexColumnRendererFromJson(json);
}

@freezed
abstract class Text with _$Text {
  const factory Text({
    List<PurpleRun>? runs,
  }) = _Text;

  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
}

@freezed
abstract class PurpleRun with _$PurpleRun {
  const factory PurpleRun({
    String? text,
    RunNavigationEndpoint? navigationEndpoint,
  }) = _PurpleRun;

  factory PurpleRun.fromJson(Map<String, dynamic> json) =>
      _$PurpleRunFromJson(json);
}

@freezed
abstract class RunNavigationEndpoint with _$RunNavigationEndpoint {
  const factory RunNavigationEndpoint({
    String? clickTrackingParams,
    PlayNavigationEndpointWatchEndpoint? watchEndpoint,
    BrowseEndpoint? browseEndpoint,
  }) = _RunNavigationEndpoint;

  factory RunNavigationEndpoint.fromJson(Map<String, dynamic> json) =>
      _$RunNavigationEndpointFromJson(json);
}

@freezed
abstract class BrowseEndpoint with _$BrowseEndpoint {
  const factory BrowseEndpoint({
    String? browseId,
    BrowseEndpointContextSupportedConfigs?
        browseEndpointContextSupportedConfigs,
  }) = _BrowseEndpoint;

  factory BrowseEndpoint.fromJson(Map<String, dynamic> json) =>
      _$BrowseEndpointFromJson(json);
}

@freezed
abstract class BrowseEndpointContextSupportedConfigs
    with _$BrowseEndpointContextSupportedConfigs {
  const factory BrowseEndpointContextSupportedConfigs({
    BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig,
  }) = _BrowseEndpointContextSupportedConfigs;

  factory BrowseEndpointContextSupportedConfigs.fromJson(
          Map<String, dynamic> json) =>
      _$BrowseEndpointContextSupportedConfigsFromJson(json);
}

@freezed
abstract class BrowseEndpointContextMusicConfig
    with _$BrowseEndpointContextMusicConfig {
  const factory BrowseEndpointContextMusicConfig({
    String? pageType,
  }) = _BrowseEndpointContextMusicConfig;

  factory BrowseEndpointContextMusicConfig.fromJson(
          Map<String, dynamic> json) =>
      _$BrowseEndpointContextMusicConfigFromJson(json);
}

@freezed
abstract class PlayNavigationEndpointWatchEndpoint
    with _$PlayNavigationEndpointWatchEndpoint {
  const factory PlayNavigationEndpointWatchEndpoint({
    String? videoId,
    WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs,
  }) = _PlayNavigationEndpointWatchEndpoint;

  factory PlayNavigationEndpointWatchEndpoint.fromJson(
          Map<String, dynamic> json) =>
      _$PlayNavigationEndpointWatchEndpointFromJson(json);
}

@freezed
abstract class WatchEndpointMusicSupportedConfigs
    with _$WatchEndpointMusicSupportedConfigs {
  const factory WatchEndpointMusicSupportedConfigs({
    WatchEndpointMusicConfig? watchEndpointMusicConfig,
  }) = _WatchEndpointMusicSupportedConfigs;

  factory WatchEndpointMusicSupportedConfigs.fromJson(
          Map<String, dynamic> json) =>
      _$WatchEndpointMusicSupportedConfigsFromJson(json);
}

@freezed
abstract class WatchEndpointMusicConfig with _$WatchEndpointMusicConfig {
  const factory WatchEndpointMusicConfig({
    String? musicVideoType,
  }) = _WatchEndpointMusicConfig;

  factory WatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) =>
      _$WatchEndpointMusicConfigFromJson(json);
}

@freezed
abstract class Menu with _$Menu {
  const factory Menu({
    MenuRenderer? menuRenderer,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

@freezed
abstract class MenuRenderer with _$MenuRenderer {
  const factory MenuRenderer({
    List<ItemElement>? items,
    String? trackingParams,
    Accessibility? accessibility,
  }) = _MenuRenderer;

  factory MenuRenderer.fromJson(Map<String, dynamic> json) =>
      _$MenuRendererFromJson(json);
}

@freezed
abstract class ItemElement with _$ItemElement {
  const factory ItemElement({
    MenuItemRenderer? menuNavigationItemRenderer,
    MenuItemRenderer? menuServiceItemRenderer,
    ToggleMenuServiceItemRenderer? toggleMenuServiceItemRenderer,
  }) = _ItemElement;

  factory ItemElement.fromJson(Map<String, dynamic> json) =>
      _$ItemElementFromJson(json);
}

@freezed
abstract class MenuItemRenderer with _$MenuItemRenderer {
  const factory MenuItemRenderer({
    Title? text,
    Icon? icon,
    MenuNavigationItemRendererNavigationEndpoint? navigationEndpoint,
    String? trackingParams,
    ServiceEndpoint? serviceEndpoint,
  }) = _MenuItemRenderer;

  factory MenuItemRenderer.fromJson(Map<String, dynamic> json) =>
      _$MenuItemRendererFromJson(json);
}

@freezed
abstract class MenuNavigationItemRendererNavigationEndpoint
    with _$MenuNavigationItemRendererNavigationEndpoint {
  const factory MenuNavigationItemRendererNavigationEndpoint({
    String? clickTrackingParams,
    PurpleWatchEndpoint? watchEndpoint,
    ModalEndpoint? modalEndpoint,
    BrowseEndpoint? browseEndpoint,
    ShareEntityEndpoint? shareEntityEndpoint,
  }) = _MenuNavigationItemRendererNavigationEndpoint;

  factory MenuNavigationItemRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      _$MenuNavigationItemRendererNavigationEndpointFromJson(json);
}

@freezed
abstract class Title with _$Title {
  const factory Title({
    List<TitleRun>? runs,
  }) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}

@freezed
abstract class TitleRun with _$TitleRun {
  const factory TitleRun({
    String? text,
  }) = _TitleRun;

  factory TitleRun.fromJson(Map<String, dynamic> json) =>
      _$TitleRunFromJson(json);
}

@freezed
abstract class ShareEntityEndpoint with _$ShareEntityEndpoint {
  const factory ShareEntityEndpoint({
    String? serializedShareEntity,
    String? sharePanelType,
  }) = _ShareEntityEndpoint;

  factory ShareEntityEndpoint.fromJson(Map<String, dynamic> json) =>
      _$ShareEntityEndpointFromJson(json);
}

@freezed
abstract class ModalEndpoint with _$ModalEndpoint {
  const factory ModalEndpoint({
    Modal? modal,
  }) = _ModalEndpoint;

  factory ModalEndpoint.fromJson(Map<String, dynamic> json) =>
      _$ModalEndpointFromJson(json);
}

@freezed
abstract class Modal with _$Modal {
  const factory Modal({
    ModalWithTitleAndButtonRenderer? modalWithTitleAndButtonRenderer,
  }) = _Modal;

  factory Modal.fromJson(Map<String, dynamic> json) => _$ModalFromJson(json);
}

@freezed
abstract class ModalWithTitleAndButtonRenderer
    with _$ModalWithTitleAndButtonRenderer {
  const factory ModalWithTitleAndButtonRenderer({
    Title? title,
    Title? content,
    Button? button,
  }) = _ModalWithTitleAndButtonRenderer;

  factory ModalWithTitleAndButtonRenderer.fromJson(Map<String, dynamic> json) =>
      _$ModalWithTitleAndButtonRendererFromJson(json);
}

@freezed
abstract class Button with _$Button {
  const factory Button({
    ButtonRenderer? buttonRenderer,
  }) = _Button;

  factory Button.fromJson(Map<String, dynamic> json) => _$ButtonFromJson(json);
}

@freezed
abstract class ButtonRenderer with _$ButtonRenderer {
  const factory ButtonRenderer({
    String? style,
    bool? isDisabled,
    Title? text,
    ButtonRendererNavigationEndpoint? navigationEndpoint,
    String? trackingParams,
  }) = _ButtonRenderer;

  factory ButtonRenderer.fromJson(Map<String, dynamic> json) =>
      _$ButtonRendererFromJson(json);
}

@freezed
abstract class ButtonRendererNavigationEndpoint
    with _$ButtonRendererNavigationEndpoint {
  const factory ButtonRendererNavigationEndpoint({
    String? clickTrackingParams,
    SignInEndpoint? signInEndpoint,
  }) = _ButtonRendererNavigationEndpoint;

  factory ButtonRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      _$ButtonRendererNavigationEndpointFromJson(json);
}

@freezed
abstract class SignInEndpoint with _$SignInEndpoint {
  const factory SignInEndpoint({
    bool? hack,
  }) = _SignInEndpoint;

  factory SignInEndpoint.fromJson(Map<String, dynamic> json) =>
      _$SignInEndpointFromJson(json);
}

@freezed
abstract class PurpleWatchEndpoint with _$PurpleWatchEndpoint {
  const factory PurpleWatchEndpoint({
    String? videoId,
    String? playlistId,
    String? params,
    LoggingContext? loggingContext,
    WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs,
  }) = _PurpleWatchEndpoint;

  factory PurpleWatchEndpoint.fromJson(Map<String, dynamic> json) =>
      _$PurpleWatchEndpointFromJson(json);
}

@freezed
abstract class LoggingContext with _$LoggingContext {
  const factory LoggingContext({
    VssLoggingContext? vssLoggingContext,
  }) = _LoggingContext;

  factory LoggingContext.fromJson(Map<String, dynamic> json) =>
      _$LoggingContextFromJson(json);
}

@freezed
abstract class VssLoggingContext with _$VssLoggingContext {
  const factory VssLoggingContext({
    String? serializedContextData,
  }) = _VssLoggingContext;

  factory VssLoggingContext.fromJson(Map<String, dynamic> json) =>
      _$VssLoggingContextFromJson(json);
}

@freezed
abstract class ServiceEndpoint with _$ServiceEndpoint {
  const factory ServiceEndpoint({
    String? clickTrackingParams,
    QueueAddEndpoint? queueAddEndpoint,
  }) = _ServiceEndpoint;

  factory ServiceEndpoint.fromJson(Map<String, dynamic> json) =>
      _$ServiceEndpointFromJson(json);
}

@freezed
abstract class QueueAddEndpoint with _$QueueAddEndpoint {
  const factory QueueAddEndpoint({
    QueueTarget? queueTarget,
    String? queueInsertPosition,
    List<Command>? commands,
  }) = _QueueAddEndpoint;

  factory QueueAddEndpoint.fromJson(Map<String, dynamic> json) =>
      _$QueueAddEndpointFromJson(json);
}

@freezed
abstract class Command with _$Command {
  const factory Command({
    String? clickTrackingParams,
    AddToToastAction? addToToastAction,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

@freezed
abstract class AddToToastAction with _$AddToToastAction {
  const factory AddToToastAction({
    AddToToastActionItem? item,
  }) = _AddToToastAction;

  factory AddToToastAction.fromJson(Map<String, dynamic> json) =>
      _$AddToToastActionFromJson(json);
}

@freezed
abstract class AddToToastActionItem with _$AddToToastActionItem {
  const factory AddToToastActionItem({
    NotificationTextRenderer? notificationTextRenderer,
  }) = _AddToToastActionItem;

  factory AddToToastActionItem.fromJson(Map<String, dynamic> json) =>
      _$AddToToastActionItemFromJson(json);
}

@freezed
abstract class NotificationTextRenderer with _$NotificationTextRenderer {
  const factory NotificationTextRenderer({
    Title? successResponseText,
    String? trackingParams,
  }) = _NotificationTextRenderer;

  factory NotificationTextRenderer.fromJson(Map<String, dynamic> json) =>
      _$NotificationTextRendererFromJson(json);
}

@freezed
abstract class QueueTarget with _$QueueTarget {
  const factory QueueTarget({
    String? videoId,
    OnEmptyQueue? onEmptyQueue,
  }) = _QueueTarget;

  factory QueueTarget.fromJson(Map<String, dynamic> json) =>
      _$QueueTargetFromJson(json);
}

@freezed
abstract class OnEmptyQueue with _$OnEmptyQueue {
  const factory OnEmptyQueue({
    String? clickTrackingParams,
    PlaylistItemData? watchEndpoint,
  }) = _OnEmptyQueue;

  factory OnEmptyQueue.fromJson(Map<String, dynamic> json) =>
      _$OnEmptyQueueFromJson(json);
}

@freezed
abstract class PlaylistItemData with _$PlaylistItemData {
  const factory PlaylistItemData({
    String? videoId,
  }) = _PlaylistItemData;

  factory PlaylistItemData.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemDataFromJson(json);
}

@freezed
abstract class ToggleMenuServiceItemRenderer
    with _$ToggleMenuServiceItemRenderer {
  const factory ToggleMenuServiceItemRenderer({
    Title? defaultText,
    Icon? defaultIcon,
    DefaultServiceEndpoint? defaultServiceEndpoint,
    Title? toggledText,
    Icon? toggledIcon,
    String? trackingParams,
  }) = _ToggleMenuServiceItemRenderer;

  factory ToggleMenuServiceItemRenderer.fromJson(Map<String, dynamic> json) =>
      _$ToggleMenuServiceItemRendererFromJson(json);
}

@freezed
abstract class DefaultServiceEndpoint with _$DefaultServiceEndpoint {
  const factory DefaultServiceEndpoint({
    String? clickTrackingParams,
    ModalEndpoint? modalEndpoint,
  }) = _DefaultServiceEndpoint;

  factory DefaultServiceEndpoint.fromJson(Map<String, dynamic> json) =>
      _$DefaultServiceEndpointFromJson(json);
}

@freezed
abstract class Overlay with _$Overlay {
  const factory Overlay({
    MusicItemThumbnailOverlayRenderer? musicItemThumbnailOverlayRenderer,
  }) = _Overlay;

  factory Overlay.fromJson(Map<String, dynamic> json) =>
      _$OverlayFromJson(json);
}

@freezed
abstract class MusicItemThumbnailOverlayRenderer
    with _$MusicItemThumbnailOverlayRenderer {
  const factory MusicItemThumbnailOverlayRenderer({
    Background? background,
    MusicItemThumbnailOverlayRendererContent? content,
    String? contentPosition,
    String? displayStyle,
  }) = _MusicItemThumbnailOverlayRenderer;

  factory MusicItemThumbnailOverlayRenderer.fromJson(
          Map<String, dynamic> json) =>
      _$MusicItemThumbnailOverlayRendererFromJson(json);
}

@freezed
abstract class Background with _$Background {
  const factory Background({
    VerticalGradient? verticalGradient,
  }) = _Background;

  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);
}

@freezed
abstract class VerticalGradient with _$VerticalGradient {
  const factory VerticalGradient({
    List<String>? gradientLayerColors,
  }) = _VerticalGradient;

  factory VerticalGradient.fromJson(Map<String, dynamic> json) =>
      _$VerticalGradientFromJson(json);
}

@freezed
abstract class MusicItemThumbnailOverlayRendererContent
    with _$MusicItemThumbnailOverlayRendererContent {
  const factory MusicItemThumbnailOverlayRendererContent({
    MusicPlayButtonRenderer? musicPlayButtonRenderer,
  }) = _MusicItemThumbnailOverlayRendererContent;

  factory MusicItemThumbnailOverlayRendererContent.fromJson(
          Map<String, dynamic> json) =>
      _$MusicItemThumbnailOverlayRendererContentFromJson(json);
}

@freezed
abstract class MusicPlayButtonRenderer with _$MusicPlayButtonRenderer {
  const factory MusicPlayButtonRenderer({
    PlayNavigationEndpoint? playNavigationEndpoint,
    String? trackingParams,
    Icon? playIcon,
    Icon? pauseIcon,
    int? iconColor,
    int? backgroundColor,
    int? activeBackgroundColor,
    int? loadingIndicatorColor,
    Icon? playingIcon,
    int? iconLoadingColor,
    int? activeScaleFactor,
    String? buttonSize,
    String? rippleTarget,
    Accessibility? accessibilityPlayData,
    Accessibility? accessibilityPauseData,
  }) = _MusicPlayButtonRenderer;

  factory MusicPlayButtonRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicPlayButtonRendererFromJson(json);
}

@freezed
abstract class PlayNavigationEndpoint with _$PlayNavigationEndpoint {
  const factory PlayNavigationEndpoint({
    String? clickTrackingParams,
    PlayNavigationEndpointWatchEndpoint? watchEndpoint,
  }) = _PlayNavigationEndpoint;

  factory PlayNavigationEndpoint.fromJson(Map<String, dynamic> json) =>
      _$PlayNavigationEndpointFromJson(json);
}

@freezed
abstract class MusicResponsiveListItemRendererThumbnail
    with _$MusicResponsiveListItemRendererThumbnail {
  const factory MusicResponsiveListItemRendererThumbnail({
    MusicThumbnailRenderer? musicThumbnailRenderer,
  }) = _MusicResponsiveListItemRendererThumbnail;

  factory MusicResponsiveListItemRendererThumbnail.fromJson(
          Map<String, dynamic> json) =>
      _$MusicResponsiveListItemRendererThumbnailFromJson(json);
}

@freezed
abstract class MusicThumbnailRenderer with _$MusicThumbnailRenderer {
  const factory MusicThumbnailRenderer({
    MusicThumbnailRendererThumbnail? thumbnail,
    String? thumbnailCrop,
    String? thumbnailScale,
    String? trackingParams,
  }) = _MusicThumbnailRenderer;

  factory MusicThumbnailRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicThumbnailRendererFromJson(json);
}

@freezed
abstract class MusicThumbnailRendererThumbnail
    with _$MusicThumbnailRendererThumbnail {
  const factory MusicThumbnailRendererThumbnail({
    List<ThumbnailElement>? thumbnails,
  }) = _MusicThumbnailRendererThumbnail;

  factory MusicThumbnailRendererThumbnail.fromJson(Map<String, dynamic> json) =>
      _$MusicThumbnailRendererThumbnailFromJson(json);
}

@freezed
abstract class ThumbnailElement with _$ThumbnailElement {
  const factory ThumbnailElement({
    String? url,
    int? width,
    int? height,
  }) = _ThumbnailElement;

  factory ThumbnailElement.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailElementFromJson(json);
}

@freezed
abstract class Continuation with _$Continuation {
  const factory Continuation({
    NextContinuationData? nextContinuationData,
  }) = _Continuation;

  factory Continuation.fromJson(Map<String, dynamic> json) =>
      _$ContinuationFromJson(json);
}

@freezed
abstract class NextContinuationData with _$NextContinuationData {
  const factory NextContinuationData({
    String? continuation,
    String? clickTrackingParams,
  }) = _NextContinuationData;

  factory NextContinuationData.fromJson(Map<String, dynamic> json) =>
      _$NextContinuationDataFromJson(json);
}

@freezed
abstract class ShelfDivider with _$ShelfDivider {
  const factory ShelfDivider({
    MusicShelfDividerRenderer? musicShelfDividerRenderer,
  }) = _ShelfDivider;

  factory ShelfDivider.fromJson(Map<String, dynamic> json) =>
      _$ShelfDividerFromJson(json);
}

@freezed
abstract class MusicShelfDividerRenderer with _$MusicShelfDividerRenderer {
  const factory MusicShelfDividerRenderer({
    bool? hidden,
  }) = _MusicShelfDividerRenderer;

  factory MusicShelfDividerRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicShelfDividerRendererFromJson(json);
}

@freezed
abstract class Header with _$Header {
  const factory Header({
    ChipCloudRenderer? chipCloudRenderer,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
abstract class ChipCloudRenderer with _$ChipCloudRenderer {
  const factory ChipCloudRenderer({
    List<Chip>? chips,
    int? collapsedRowCount,
    String? trackingParams,
    bool? horizontalScrollable,
  }) = _ChipCloudRenderer;

  factory ChipCloudRenderer.fromJson(Map<String, dynamic> json) =>
      _$ChipCloudRendererFromJson(json);
}

@freezed
abstract class Chip with _$Chip {
  const factory Chip({
    ChipCloudChipRenderer? chipCloudChipRenderer,
  }) = _Chip;

  factory Chip.fromJson(Map<String, dynamic> json) => _$ChipFromJson(json);
}

@freezed
abstract class ChipCloudChipRenderer with _$ChipCloudChipRenderer {
  const factory ChipCloudChipRenderer({
    StyleClass? style,
    ChipCloudChipRendererNavigationEndpoint? navigationEndpoint,
    String? trackingParams,
    Icon? icon,
    Accessibility? accessibilityData,
    bool? isSelected,
    Title? text,
    String? uniqueId,
  }) = _ChipCloudChipRenderer;

  factory ChipCloudChipRenderer.fromJson(Map<String, dynamic> json) =>
      _$ChipCloudChipRendererFromJson(json);
}

@freezed
abstract class ChipCloudChipRendererNavigationEndpoint
    with _$ChipCloudChipRendererNavigationEndpoint {
  const factory ChipCloudChipRendererNavigationEndpoint({
    String? clickTrackingParams,
    SearchEndpoint? searchEndpoint,
  }) = _ChipCloudChipRendererNavigationEndpoint;

  factory ChipCloudChipRendererNavigationEndpoint.fromJson(
          Map<String, dynamic> json) =>
      _$ChipCloudChipRendererNavigationEndpointFromJson(json);
}

@freezed
abstract class SearchEndpoint with _$SearchEndpoint {
  const factory SearchEndpoint({
    String? query,
    String? params,
  }) = _SearchEndpoint;

  factory SearchEndpoint.fromJson(Map<String, dynamic> json) =>
      _$SearchEndpointFromJson(json);
}

@freezed
abstract class StyleClass with _$StyleClass {
  const factory StyleClass({
    String? styleType,
  }) = _StyleClass;

  factory StyleClass.fromJson(Map<String, dynamic> json) =>
      _$StyleClassFromJson(json);
}

@freezed
abstract class ResponseContext with _$ResponseContext {
  const factory ResponseContext({
    String? visitorData,
    List<ServiceTrackingParam>? serviceTrackingParams,
    int? maxAgeSeconds,
  }) = _ResponseContext;

  factory ResponseContext.fromJson(Map<String, dynamic> json) =>
      _$ResponseContextFromJson(json);
}

@freezed
abstract class ServiceTrackingParam with _$ServiceTrackingParam {
  const factory ServiceTrackingParam({
    String? service,
    List<Param>? params,
  }) = _ServiceTrackingParam;

  factory ServiceTrackingParam.fromJson(Map<String, dynamic> json) =>
      _$ServiceTrackingParamFromJson(json);
}

@freezed
abstract class Param with _$Param {
  const factory Param({
    String? key,
    String? value,
  }) = _Param;

  factory Param.fromJson(Map<String, dynamic> json) => _$ParamFromJson(json);
}
