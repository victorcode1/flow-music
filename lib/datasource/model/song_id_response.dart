// To parse this JSON data, do
//
//     final songIdResponde = songIdRespondeFromJson(jsonString);

import 'dart:convert';

SongIdResponde songIdRespondeFromJson(String str) => SongIdResponde.fromJson(json.decode(str));

String songIdRespondeToJson(SongIdResponde data) => json.encode(data.toJson());

class SongIdResponde {
    ResponseContext? responseContext;
    PlayabilityStatus? playabilityStatus;
    StreamingData? streamingData;
    List<PlayerAd>? playerAds;
    PlaybackTracking? playbackTracking;
    Captions? captions;
    VideoDetails? videoDetails;
    List<Annotation>? annotations;
    PlayerConfig? playerConfig;
    Storyboards? storyboards;
    Microformat? microformat;
    Cards? cards;
    String? trackingParams;
    Attestation? attestation;
    List<Message>? messages;
    List<AdPlacement>? adPlacements;
    String? adBreakHeartbeatParams;
    FrameworkUpdates? frameworkUpdates;

    SongIdResponde({
        this.responseContext,
        this.playabilityStatus,
        this.streamingData,
        this.playerAds,
        this.playbackTracking,
        this.captions,
        this.videoDetails,
        this.annotations,
        this.playerConfig,
        this.storyboards,
        this.microformat,
        this.cards,
        this.trackingParams,
        this.attestation,
        this.messages,
        this.adPlacements,
        this.adBreakHeartbeatParams,
        this.frameworkUpdates,
    });

    factory SongIdResponde.fromJson(Map<String, dynamic> json) => SongIdResponde(
        responseContext: json["responseContext"] == null ? null : ResponseContext.fromJson(json["responseContext"]),
        playabilityStatus: json["playabilityStatus"] == null ? null : PlayabilityStatus.fromJson(json["playabilityStatus"]),
        streamingData: json["streamingData"] == null ? null : StreamingData.fromJson(json["streamingData"]),
        playerAds: json["playerAds"] == null ? [] : List<PlayerAd>.from(json["playerAds"]!.map((x) => PlayerAd.fromJson(x))),
        playbackTracking: json["playbackTracking"] == null ? null : PlaybackTracking.fromJson(json["playbackTracking"]),
        captions: json["captions"] == null ? null : Captions.fromJson(json["captions"]),
        videoDetails: json["videoDetails"] == null ? null : VideoDetails.fromJson(json["videoDetails"]),
        annotations: json["annotations"] == null ? [] : List<Annotation>.from(json["annotations"]!.map((x) => Annotation.fromJson(x))),
        playerConfig: json["playerConfig"] == null ? null : PlayerConfig.fromJson(json["playerConfig"]),
        storyboards: json["storyboards"] == null ? null : Storyboards.fromJson(json["storyboards"]),
        microformat: json["microformat"] == null ? null : Microformat.fromJson(json["microformat"]),
        cards: json["cards"] == null ? null : Cards.fromJson(json["cards"]),
        trackingParams: json["trackingParams"],
        attestation: json["attestation"] == null ? null : Attestation.fromJson(json["attestation"]),
        messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
        adPlacements: json["adPlacements"] == null ? [] : List<AdPlacement>.from(json["adPlacements"]!.map((x) => AdPlacement.fromJson(x))),
        adBreakHeartbeatParams: json["adBreakHeartbeatParams"],
        frameworkUpdates: json["frameworkUpdates"] == null ? null : FrameworkUpdates.fromJson(json["frameworkUpdates"]),
    );

    Map<String, dynamic> toJson() => {
        "responseContext": responseContext?.toJson(),
        "playabilityStatus": playabilityStatus?.toJson(),
        "streamingData": streamingData?.toJson(),
        "playerAds": playerAds == null ? [] : List<dynamic>.from(playerAds!.map((x) => x.toJson())),
        "playbackTracking": playbackTracking?.toJson(),
        "captions": captions?.toJson(),
        "videoDetails": videoDetails?.toJson(),
        "annotations": annotations == null ? [] : List<dynamic>.from(annotations!.map((x) => x.toJson())),
        "playerConfig": playerConfig?.toJson(),
        "storyboards": storyboards?.toJson(),
        "microformat": microformat?.toJson(),
        "cards": cards?.toJson(),
        "trackingParams": trackingParams,
        "attestation": attestation?.toJson(),
        "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
        "adPlacements": adPlacements == null ? [] : List<dynamic>.from(adPlacements!.map((x) => x.toJson())),
        "adBreakHeartbeatParams": adBreakHeartbeatParams,
        "frameworkUpdates": frameworkUpdates?.toJson(),
    };
}

class AdPlacement {
    AdPlacementRenderer? adPlacementRenderer;

    AdPlacement({
        this.adPlacementRenderer,
    });

    factory AdPlacement.fromJson(Map<String, dynamic> json) => AdPlacement(
        adPlacementRenderer: json["adPlacementRenderer"] == null ? null : AdPlacementRenderer.fromJson(json["adPlacementRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "adPlacementRenderer": adPlacementRenderer?.toJson(),
    };
}

class AdPlacementRenderer {
    Config? config;
    Renderer? renderer;
    AdSlotLoggingData? adSlotLoggingData;

    AdPlacementRenderer({
        this.config,
        this.renderer,
        this.adSlotLoggingData,
    });

    factory AdPlacementRenderer.fromJson(Map<String, dynamic> json) => AdPlacementRenderer(
        config: json["config"] == null ? null : Config.fromJson(json["config"]),
        renderer: json["renderer"] == null ? null : Renderer.fromJson(json["renderer"]),
        adSlotLoggingData: json["adSlotLoggingData"] == null ? null : AdSlotLoggingData.fromJson(json["adSlotLoggingData"]),
    );

    Map<String, dynamic> toJson() => {
        "config": config?.toJson(),
        "renderer": renderer?.toJson(),
        "adSlotLoggingData": adSlotLoggingData?.toJson(),
    };
}

class AdSlotLoggingData {
    String? serializedSlotAdServingDataEntry;

    AdSlotLoggingData({
        this.serializedSlotAdServingDataEntry,
    });

    factory AdSlotLoggingData.fromJson(Map<String, dynamic> json) => AdSlotLoggingData(
        serializedSlotAdServingDataEntry: json["serializedSlotAdServingDataEntry"],
    );

    Map<String, dynamic> toJson() => {
        "serializedSlotAdServingDataEntry": serializedSlotAdServingDataEntry,
    };
}

class Config {
    AdPlacementConfig? adPlacementConfig;

    Config({
        this.adPlacementConfig,
    });

    factory Config.fromJson(Map<String, dynamic> json) => Config(
        adPlacementConfig: json["adPlacementConfig"] == null ? null : AdPlacementConfig.fromJson(json["adPlacementConfig"]),
    );

    Map<String, dynamic> toJson() => {
        "adPlacementConfig": adPlacementConfig?.toJson(),
    };
}

class AdPlacementConfig {
    String? kind;
    AdTimeOffset? adTimeOffset;
    bool? hideCueRangeMarker;

    AdPlacementConfig({
        this.kind,
        this.adTimeOffset,
        this.hideCueRangeMarker,
    });

    factory AdPlacementConfig.fromJson(Map<String, dynamic> json) => AdPlacementConfig(
        kind: json["kind"],
        adTimeOffset: json["adTimeOffset"] == null ? null : AdTimeOffset.fromJson(json["adTimeOffset"]),
        hideCueRangeMarker: json["hideCueRangeMarker"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "adTimeOffset": adTimeOffset?.toJson(),
        "hideCueRangeMarker": hideCueRangeMarker,
    };
}

class AdTimeOffset {
    String? offsetStartMilliseconds;
    String? offsetEndMilliseconds;

    AdTimeOffset({
        this.offsetStartMilliseconds,
        this.offsetEndMilliseconds,
    });

    factory AdTimeOffset.fromJson(Map<String, dynamic> json) => AdTimeOffset(
        offsetStartMilliseconds: json["offsetStartMilliseconds"],
        offsetEndMilliseconds: json["offsetEndMilliseconds"],
    );

    Map<String, dynamic> toJson() => {
        "offsetStartMilliseconds": offsetStartMilliseconds,
        "offsetEndMilliseconds": offsetEndMilliseconds,
    };
}

class Renderer {
    ClientForecastingAdRenderer? clientForecastingAdRenderer;
    AdBreakServiceRenderer? adBreakServiceRenderer;

    Renderer({
        this.clientForecastingAdRenderer,
        this.adBreakServiceRenderer,
    });

    factory Renderer.fromJson(Map<String, dynamic> json) => Renderer(
        clientForecastingAdRenderer: json["clientForecastingAdRenderer"] == null ? null : ClientForecastingAdRenderer.fromJson(json["clientForecastingAdRenderer"]),
        adBreakServiceRenderer: json["adBreakServiceRenderer"] == null ? null : AdBreakServiceRenderer.fromJson(json["adBreakServiceRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "clientForecastingAdRenderer": clientForecastingAdRenderer?.toJson(),
        "adBreakServiceRenderer": adBreakServiceRenderer?.toJson(),
    };
}

class AdBreakServiceRenderer {
    String? prefetchMilliseconds;
    String? getAdBreakUrl;

    AdBreakServiceRenderer({
        this.prefetchMilliseconds,
        this.getAdBreakUrl,
    });

    factory AdBreakServiceRenderer.fromJson(Map<String, dynamic> json) => AdBreakServiceRenderer(
        prefetchMilliseconds: json["prefetchMilliseconds"],
        getAdBreakUrl: json["getAdBreakUrl"],
    );

    Map<String, dynamic> toJson() => {
        "prefetchMilliseconds": prefetchMilliseconds,
        "getAdBreakUrl": getAdBreakUrl,
    };
}

class ClientForecastingAdRenderer {
    ClientForecastingAdRenderer();

    factory ClientForecastingAdRenderer.fromJson(Map<String, dynamic> json) => ClientForecastingAdRenderer(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Annotation {
    PlayerAnnotationsExpandedRenderer? playerAnnotationsExpandedRenderer;

    Annotation({
        this.playerAnnotationsExpandedRenderer,
    });

    factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        playerAnnotationsExpandedRenderer: json["playerAnnotationsExpandedRenderer"] == null ? null : PlayerAnnotationsExpandedRenderer.fromJson(json["playerAnnotationsExpandedRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "playerAnnotationsExpandedRenderer": playerAnnotationsExpandedRenderer?.toJson(),
    };
}

class PlayerAnnotationsExpandedRenderer {
    FeaturedChannel? featuredChannel;
    bool? allowSwipeDismiss;
    String? annotationId;

    PlayerAnnotationsExpandedRenderer({
        this.featuredChannel,
        this.allowSwipeDismiss,
        this.annotationId,
    });

    factory PlayerAnnotationsExpandedRenderer.fromJson(Map<String, dynamic> json) => PlayerAnnotationsExpandedRenderer(
        featuredChannel: json["featuredChannel"] == null ? null : FeaturedChannel.fromJson(json["featuredChannel"]),
        allowSwipeDismiss: json["allowSwipeDismiss"],
        annotationId: json["annotationId"],
    );

    Map<String, dynamic> toJson() => {
        "featuredChannel": featuredChannel?.toJson(),
        "allowSwipeDismiss": allowSwipeDismiss,
        "annotationId": annotationId,
    };
}

class FeaturedChannel {
    String? startTimeMs;
    String? endTimeMs;
    IconClass? watermark;
    String? trackingParams;
    NavigationEndpoint? navigationEndpoint;
    String? channelName;
    SubscribeButton? subscribeButton;

    FeaturedChannel({
        this.startTimeMs,
        this.endTimeMs,
        this.watermark,
        this.trackingParams,
        this.navigationEndpoint,
        this.channelName,
        this.subscribeButton,
    });

    factory FeaturedChannel.fromJson(Map<String, dynamic> json) => FeaturedChannel(
        startTimeMs: json["startTimeMs"],
        endTimeMs: json["endTimeMs"],
        watermark: json["watermark"] == null ? null : IconClass.fromJson(json["watermark"]),
        trackingParams: json["trackingParams"],
        navigationEndpoint: json["navigationEndpoint"] == null ? null : NavigationEndpoint.fromJson(json["navigationEndpoint"]),
        channelName: json["channelName"],
        subscribeButton: json["subscribeButton"] == null ? null : SubscribeButton.fromJson(json["subscribeButton"]),
    );

    Map<String, dynamic> toJson() => {
        "startTimeMs": startTimeMs,
        "endTimeMs": endTimeMs,
        "watermark": watermark?.toJson(),
        "trackingParams": trackingParams,
        "navigationEndpoint": navigationEndpoint?.toJson(),
        "channelName": channelName,
        "subscribeButton": subscribeButton?.toJson(),
    };
}

class NavigationEndpoint {
    String? clickTrackingParams;
    NavigationEndpointCommandMetadata? commandMetadata;
    NavigationEndpointBrowseEndpoint? browseEndpoint;

    NavigationEndpoint({
        this.clickTrackingParams,
        this.commandMetadata,
        this.browseEndpoint,
    });

    factory NavigationEndpoint.fromJson(Map<String, dynamic> json) => NavigationEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : NavigationEndpointCommandMetadata.fromJson(json["commandMetadata"]),
        browseEndpoint: json["browseEndpoint"] == null ? null : NavigationEndpointBrowseEndpoint.fromJson(json["browseEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "browseEndpoint": browseEndpoint?.toJson(),
    };
}

class NavigationEndpointBrowseEndpoint {
    String? browseId;

    NavigationEndpointBrowseEndpoint({
        this.browseId,
    });

    factory NavigationEndpointBrowseEndpoint.fromJson(Map<String, dynamic> json) => NavigationEndpointBrowseEndpoint(
        browseId: json["browseId"],
    );

    Map<String, dynamic> toJson() => {
        "browseId": browseId,
    };
}

class NavigationEndpointCommandMetadata {
    PurpleWebCommandMetadata? webCommandMetadata;

    NavigationEndpointCommandMetadata({
        this.webCommandMetadata,
    });

    factory NavigationEndpointCommandMetadata.fromJson(Map<String, dynamic> json) => NavigationEndpointCommandMetadata(
        webCommandMetadata: json["webCommandMetadata"] == null ? null : PurpleWebCommandMetadata.fromJson(json["webCommandMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "webCommandMetadata": webCommandMetadata?.toJson(),
    };
}

class PurpleWebCommandMetadata {
    String? url;
    String? webPageType;
    int? rootVe;
    String? apiUrl;
    bool? sendPost;

    PurpleWebCommandMetadata({
        this.url,
        this.webPageType,
        this.rootVe,
        this.apiUrl,
        this.sendPost,
    });

    factory PurpleWebCommandMetadata.fromJson(Map<String, dynamic> json) => PurpleWebCommandMetadata(
        url: json["url"],
        webPageType: json["webPageType"],
        rootVe: json["rootVe"],
        apiUrl: json["apiUrl"],
        sendPost: json["sendPost"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "webPageType": webPageType,
        "rootVe": rootVe,
        "apiUrl": apiUrl,
        "sendPost": sendPost,
    };
}

class SubscribeButton {
    SubscribeButtonRenderer? subscribeButtonRenderer;

    SubscribeButton({
        this.subscribeButtonRenderer,
    });

    factory SubscribeButton.fromJson(Map<String, dynamic> json) => SubscribeButton(
        subscribeButtonRenderer: json["subscribeButtonRenderer"] == null ? null : SubscribeButtonRenderer.fromJson(json["subscribeButtonRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "subscribeButtonRenderer": subscribeButtonRenderer?.toJson(),
    };
}

class SubscribeButtonRenderer {
    MessageTitle? buttonText;
    bool? subscribed;
    bool? enabled;
    String? type;
    String? channelId;
    bool? showPreferences;
    MessageTitle? subscribedButtonText;
    MessageTitle? unsubscribedButtonText;
    String? trackingParams;
    MessageTitle? unsubscribeButtonText;
    List<SubscribeCommand>? serviceEndpoints;
    SubscribeAccessibility? subscribeAccessibility;
    SubscribeAccessibility? unsubscribeAccessibility;
    SignInEndpoint? signInEndpoint;

    SubscribeButtonRenderer({
        this.buttonText,
        this.subscribed,
        this.enabled,
        this.type,
        this.channelId,
        this.showPreferences,
        this.subscribedButtonText,
        this.unsubscribedButtonText,
        this.trackingParams,
        this.unsubscribeButtonText,
        this.serviceEndpoints,
        this.subscribeAccessibility,
        this.unsubscribeAccessibility,
        this.signInEndpoint,
    });

    factory SubscribeButtonRenderer.fromJson(Map<String, dynamic> json) => SubscribeButtonRenderer(
        buttonText: json["buttonText"] == null ? null : MessageTitle.fromJson(json["buttonText"]),
        subscribed: json["subscribed"],
        enabled: json["enabled"],
        type: json["type"],
        channelId: json["channelId"],
        showPreferences: json["showPreferences"],
        subscribedButtonText: json["subscribedButtonText"] == null ? null : MessageTitle.fromJson(json["subscribedButtonText"]),
        unsubscribedButtonText: json["unsubscribedButtonText"] == null ? null : MessageTitle.fromJson(json["unsubscribedButtonText"]),
        trackingParams: json["trackingParams"],
        unsubscribeButtonText: json["unsubscribeButtonText"] == null ? null : MessageTitle.fromJson(json["unsubscribeButtonText"]),
        serviceEndpoints: json["serviceEndpoints"] == null ? [] : List<SubscribeCommand>.from(json["serviceEndpoints"]!.map((x) => SubscribeCommand.fromJson(x))),
        subscribeAccessibility: json["subscribeAccessibility"] == null ? null : SubscribeAccessibility.fromJson(json["subscribeAccessibility"]),
        unsubscribeAccessibility: json["unsubscribeAccessibility"] == null ? null : SubscribeAccessibility.fromJson(json["unsubscribeAccessibility"]),
        signInEndpoint: json["signInEndpoint"] == null ? null : SignInEndpoint.fromJson(json["signInEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "buttonText": buttonText?.toJson(),
        "subscribed": subscribed,
        "enabled": enabled,
        "type": type,
        "channelId": channelId,
        "showPreferences": showPreferences,
        "subscribedButtonText": subscribedButtonText?.toJson(),
        "unsubscribedButtonText": unsubscribedButtonText?.toJson(),
        "trackingParams": trackingParams,
        "unsubscribeButtonText": unsubscribeButtonText?.toJson(),
        "serviceEndpoints": serviceEndpoints == null ? [] : List<dynamic>.from(serviceEndpoints!.map((x) => x.toJson())),
        "subscribeAccessibility": subscribeAccessibility?.toJson(),
        "unsubscribeAccessibility": unsubscribeAccessibility?.toJson(),
        "signInEndpoint": signInEndpoint?.toJson(),
    };
}

class MessageTitle {
    List<Run>? runs;

    MessageTitle({
        this.runs,
    });

    factory MessageTitle.fromJson(Map<String, dynamic> json) => MessageTitle(
        runs: json["runs"] == null ? [] : List<Run>.from(json["runs"]!.map((x) => Run.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "runs": runs == null ? [] : List<dynamic>.from(runs!.map((x) => x.toJson())),
    };
}

class Run {
    String? text;

    Run({
        this.text,
    });

    factory Run.fromJson(Map<String, dynamic> json) => Run(
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
    };
}

class SubscribeCommand {
    String? clickTrackingParams;
    SubscribeCommandCommandMetadata? commandMetadata;
    SubscribeEndpoint? subscribeEndpoint;
    SignalServiceEndpoint? signalServiceEndpoint;

    SubscribeCommand({
        this.clickTrackingParams,
        this.commandMetadata,
        this.subscribeEndpoint,
        this.signalServiceEndpoint,
    });

    factory SubscribeCommand.fromJson(Map<String, dynamic> json) => SubscribeCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SubscribeCommandCommandMetadata.fromJson(json["commandMetadata"]),
        subscribeEndpoint: json["subscribeEndpoint"] == null ? null : SubscribeEndpoint.fromJson(json["subscribeEndpoint"]),
        signalServiceEndpoint: json["signalServiceEndpoint"] == null ? null : SignalServiceEndpoint.fromJson(json["signalServiceEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "subscribeEndpoint": subscribeEndpoint?.toJson(),
        "signalServiceEndpoint": signalServiceEndpoint?.toJson(),
    };
}

class SubscribeCommandCommandMetadata {
    FluffyWebCommandMetadata? webCommandMetadata;

    SubscribeCommandCommandMetadata({
        this.webCommandMetadata,
    });

    factory SubscribeCommandCommandMetadata.fromJson(Map<String, dynamic> json) => SubscribeCommandCommandMetadata(
        webCommandMetadata: json["webCommandMetadata"] == null ? null : FluffyWebCommandMetadata.fromJson(json["webCommandMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "webCommandMetadata": webCommandMetadata?.toJson(),
    };
}

class FluffyWebCommandMetadata {
    bool? sendPost;
    String? apiUrl;

    FluffyWebCommandMetadata({
        this.sendPost,
        this.apiUrl,
    });

    factory FluffyWebCommandMetadata.fromJson(Map<String, dynamic> json) => FluffyWebCommandMetadata(
        sendPost: json["sendPost"],
        apiUrl: json["apiUrl"],
    );

    Map<String, dynamic> toJson() => {
        "sendPost": sendPost,
        "apiUrl": apiUrl,
    };
}

class SignalServiceEndpoint {
    String? signal;
    List<SignalServiceEndpointAction>? actions;

    SignalServiceEndpoint({
        this.signal,
        this.actions,
    });

    factory SignalServiceEndpoint.fromJson(Map<String, dynamic> json) => SignalServiceEndpoint(
        signal: json["signal"],
        actions: json["actions"] == null ? [] : List<SignalServiceEndpointAction>.from(json["actions"]!.map((x) => SignalServiceEndpointAction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "signal": signal,
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
    };
}

class SignalServiceEndpointAction {
    String? clickTrackingParams;
    OpenPopupAction? openPopupAction;

    SignalServiceEndpointAction({
        this.clickTrackingParams,
        this.openPopupAction,
    });

    factory SignalServiceEndpointAction.fromJson(Map<String, dynamic> json) => SignalServiceEndpointAction(
        clickTrackingParams: json["clickTrackingParams"],
        openPopupAction: json["openPopupAction"] == null ? null : OpenPopupAction.fromJson(json["openPopupAction"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "openPopupAction": openPopupAction?.toJson(),
    };
}

class OpenPopupAction {
    Popup? popup;
    String? popupType;

    OpenPopupAction({
        this.popup,
        this.popupType,
    });

    factory OpenPopupAction.fromJson(Map<String, dynamic> json) => OpenPopupAction(
        popup: json["popup"] == null ? null : Popup.fromJson(json["popup"]),
        popupType: json["popupType"],
    );

    Map<String, dynamic> toJson() => {
        "popup": popup?.toJson(),
        "popupType": popupType,
    };
}

class Popup {
    ConfirmDialogRenderer? confirmDialogRenderer;

    Popup({
        this.confirmDialogRenderer,
    });

    factory Popup.fromJson(Map<String, dynamic> json) => Popup(
        confirmDialogRenderer: json["confirmDialogRenderer"] == null ? null : ConfirmDialogRenderer.fromJson(json["confirmDialogRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "confirmDialogRenderer": confirmDialogRenderer?.toJson(),
    };
}

class ConfirmDialogRenderer {
    String? trackingParams;
    List<MessageTitle>? dialogMessages;
    Button? confirmButton;
    Button? cancelButton;
    bool? primaryIsCancel;

    ConfirmDialogRenderer({
        this.trackingParams,
        this.dialogMessages,
        this.confirmButton,
        this.cancelButton,
        this.primaryIsCancel,
    });

    factory ConfirmDialogRenderer.fromJson(Map<String, dynamic> json) => ConfirmDialogRenderer(
        trackingParams: json["trackingParams"],
        dialogMessages: json["dialogMessages"] == null ? [] : List<MessageTitle>.from(json["dialogMessages"]!.map((x) => MessageTitle.fromJson(x))),
        confirmButton: json["confirmButton"] == null ? null : Button.fromJson(json["confirmButton"]),
        cancelButton: json["cancelButton"] == null ? null : Button.fromJson(json["cancelButton"]),
        primaryIsCancel: json["primaryIsCancel"],
    );

    Map<String, dynamic> toJson() => {
        "trackingParams": trackingParams,
        "dialogMessages": dialogMessages == null ? [] : List<dynamic>.from(dialogMessages!.map((x) => x.toJson())),
        "confirmButton": confirmButton?.toJson(),
        "cancelButton": cancelButton?.toJson(),
        "primaryIsCancel": primaryIsCancel,
    };
}

class Button {
    CancelButtonButtonRenderer? buttonRenderer;

    Button({
        this.buttonRenderer,
    });

    factory Button.fromJson(Map<String, dynamic> json) => Button(
        buttonRenderer: json["buttonRenderer"] == null ? null : CancelButtonButtonRenderer.fromJson(json["buttonRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "buttonRenderer": buttonRenderer?.toJson(),
    };
}

class CancelButtonButtonRenderer {
    String? style;
    String? size;
    bool? isDisabled;
    MessageTitle? text;
    Accessibility? accessibility;
    String? trackingParams;
    UnsubscribeCommand? serviceEndpoint;

    CancelButtonButtonRenderer({
        this.style,
        this.size,
        this.isDisabled,
        this.text,
        this.accessibility,
        this.trackingParams,
        this.serviceEndpoint,
    });

    factory CancelButtonButtonRenderer.fromJson(Map<String, dynamic> json) => CancelButtonButtonRenderer(
        style: json["style"],
        size: json["size"],
        isDisabled: json["isDisabled"],
        text: json["text"] == null ? null : MessageTitle.fromJson(json["text"]),
        accessibility: json["accessibility"] == null ? null : Accessibility.fromJson(json["accessibility"]),
        trackingParams: json["trackingParams"],
        serviceEndpoint: json["serviceEndpoint"] == null ? null : UnsubscribeCommand.fromJson(json["serviceEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "style": style,
        "size": size,
        "isDisabled": isDisabled,
        "text": text?.toJson(),
        "accessibility": accessibility?.toJson(),
        "trackingParams": trackingParams,
        "serviceEndpoint": serviceEndpoint?.toJson(),
    };
}

class Accessibility {
    String? label;

    Accessibility({
        this.label,
    });

    factory Accessibility.fromJson(Map<String, dynamic> json) => Accessibility(
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
    };
}

class UnsubscribeCommand {
    String? clickTrackingParams;
    SubscribeCommandCommandMetadata? commandMetadata;
    SubscribeEndpoint? unsubscribeEndpoint;

    UnsubscribeCommand({
        this.clickTrackingParams,
        this.commandMetadata,
        this.unsubscribeEndpoint,
    });

    factory UnsubscribeCommand.fromJson(Map<String, dynamic> json) => UnsubscribeCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SubscribeCommandCommandMetadata.fromJson(json["commandMetadata"]),
        unsubscribeEndpoint: json["unsubscribeEndpoint"] == null ? null : SubscribeEndpoint.fromJson(json["unsubscribeEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "unsubscribeEndpoint": unsubscribeEndpoint?.toJson(),
    };
}

class SubscribeEndpoint {
    List<String>? channelIds;
    String? params;

    SubscribeEndpoint({
        this.channelIds,
        this.params,
    });

    factory SubscribeEndpoint.fromJson(Map<String, dynamic> json) => SubscribeEndpoint(
        channelIds: json["channelIds"] == null ? [] : List<String>.from(json["channelIds"]!.map((x) => x)),
        params: json["params"],
    );

    Map<String, dynamic> toJson() => {
        "channelIds": channelIds == null ? [] : List<dynamic>.from(channelIds!.map((x) => x)),
        "params": params,
    };
}

class SignInEndpoint {
    String? clickTrackingParams;
    SignInEndpointCommandMetadata? commandMetadata;

    SignInEndpoint({
        this.clickTrackingParams,
        this.commandMetadata,
    });

    factory SignInEndpoint.fromJson(Map<String, dynamic> json) => SignInEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SignInEndpointCommandMetadata.fromJson(json["commandMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
    };
}

class SignInEndpointCommandMetadata {
    TentacledWebCommandMetadata? webCommandMetadata;

    SignInEndpointCommandMetadata({
        this.webCommandMetadata,
    });

    factory SignInEndpointCommandMetadata.fromJson(Map<String, dynamic> json) => SignInEndpointCommandMetadata(
        webCommandMetadata: json["webCommandMetadata"] == null ? null : TentacledWebCommandMetadata.fromJson(json["webCommandMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "webCommandMetadata": webCommandMetadata?.toJson(),
    };
}

class TentacledWebCommandMetadata {
    String? url;

    TentacledWebCommandMetadata({
        this.url,
    });

    factory TentacledWebCommandMetadata.fromJson(Map<String, dynamic> json) => TentacledWebCommandMetadata(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

class SubscribeAccessibility {
    Accessibility? accessibilityData;

    SubscribeAccessibility({
        this.accessibilityData,
    });

    factory SubscribeAccessibility.fromJson(Map<String, dynamic> json) => SubscribeAccessibility(
        accessibilityData: json["accessibilityData"] == null ? null : Accessibility.fromJson(json["accessibilityData"]),
    );

    Map<String, dynamic> toJson() => {
        "accessibilityData": accessibilityData?.toJson(),
    };
}

class IconClass {
    List<ThumbnailElement>? thumbnails;

    IconClass({
        this.thumbnails,
    });

    factory IconClass.fromJson(Map<String, dynamic> json) => IconClass(
        thumbnails: json["thumbnails"] == null ? [] : List<ThumbnailElement>.from(json["thumbnails"]!.map((x) => ThumbnailElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "thumbnails": thumbnails == null ? [] : List<dynamic>.from(thumbnails!.map((x) => x.toJson())),
    };
}

class ThumbnailElement {
    String? url;
    int? width;
    int? height;

    ThumbnailElement({
        this.url,
        this.width,
        this.height,
    });

    factory ThumbnailElement.fromJson(Map<String, dynamic> json) => ThumbnailElement(
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

class Attestation {
    PlayerAttestationRenderer? playerAttestationRenderer;

    Attestation({
        this.playerAttestationRenderer,
    });

    factory Attestation.fromJson(Map<String, dynamic> json) => Attestation(
        playerAttestationRenderer: json["playerAttestationRenderer"] == null ? null : PlayerAttestationRenderer.fromJson(json["playerAttestationRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "playerAttestationRenderer": playerAttestationRenderer?.toJson(),
    };
}

class PlayerAttestationRenderer {
    String? challenge;
    BotguardData? botguardData;

    PlayerAttestationRenderer({
        this.challenge,
        this.botguardData,
    });

    factory PlayerAttestationRenderer.fromJson(Map<String, dynamic> json) => PlayerAttestationRenderer(
        challenge: json["challenge"],
        botguardData: json["botguardData"] == null ? null : BotguardData.fromJson(json["botguardData"]),
    );

    Map<String, dynamic> toJson() => {
        "challenge": challenge,
        "botguardData": botguardData?.toJson(),
    };
}

class BotguardData {
    String? program;
    InterpreterSafeUrl? interpreterSafeUrl;
    int? serverEnvironment;

    BotguardData({
        this.program,
        this.interpreterSafeUrl,
        this.serverEnvironment,
    });

    factory BotguardData.fromJson(Map<String, dynamic> json) => BotguardData(
        program: json["program"],
        interpreterSafeUrl: json["interpreterSafeUrl"] == null ? null : InterpreterSafeUrl.fromJson(json["interpreterSafeUrl"]),
        serverEnvironment: json["serverEnvironment"],
    );

    Map<String, dynamic> toJson() => {
        "program": program,
        "interpreterSafeUrl": interpreterSafeUrl?.toJson(),
        "serverEnvironment": serverEnvironment,
    };
}

class InterpreterSafeUrl {
    String? privateDoNotAccessOrElseTrustedResourceUrlWrappedValue;

    InterpreterSafeUrl({
        this.privateDoNotAccessOrElseTrustedResourceUrlWrappedValue,
    });

    factory InterpreterSafeUrl.fromJson(Map<String, dynamic> json) => InterpreterSafeUrl(
        privateDoNotAccessOrElseTrustedResourceUrlWrappedValue: json["privateDoNotAccessOrElseTrustedResourceUrlWrappedValue"],
    );

    Map<String, dynamic> toJson() => {
        "privateDoNotAccessOrElseTrustedResourceUrlWrappedValue": privateDoNotAccessOrElseTrustedResourceUrlWrappedValue,
    };
}

class Captions {
    PlayerCaptionsTracklistRenderer? playerCaptionsTracklistRenderer;

    Captions({
        this.playerCaptionsTracklistRenderer,
    });

    factory Captions.fromJson(Map<String, dynamic> json) => Captions(
        playerCaptionsTracklistRenderer: json["playerCaptionsTracklistRenderer"] == null ? null : PlayerCaptionsTracklistRenderer.fromJson(json["playerCaptionsTracklistRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "playerCaptionsTracklistRenderer": playerCaptionsTracklistRenderer?.toJson(),
    };
}

class PlayerCaptionsTracklistRenderer {
    List<CaptionTrack>? captionTracks;
    List<AudioTrack>? audioTracks;
    List<TranslationLanguage>? translationLanguages;
    int? defaultAudioTrackIndex;

    PlayerCaptionsTracklistRenderer({
        this.captionTracks,
        this.audioTracks,
        this.translationLanguages,
        this.defaultAudioTrackIndex,
    });

    factory PlayerCaptionsTracklistRenderer.fromJson(Map<String, dynamic> json) => PlayerCaptionsTracklistRenderer(
        captionTracks: json["captionTracks"] == null ? [] : List<CaptionTrack>.from(json["captionTracks"]!.map((x) => CaptionTrack.fromJson(x))),
        audioTracks: json["audioTracks"] == null ? [] : List<AudioTrack>.from(json["audioTracks"]!.map((x) => AudioTrack.fromJson(x))),
        translationLanguages: json["translationLanguages"] == null ? [] : List<TranslationLanguage>.from(json["translationLanguages"]!.map((x) => TranslationLanguage.fromJson(x))),
        defaultAudioTrackIndex: json["defaultAudioTrackIndex"],
    );

    Map<String, dynamic> toJson() => {
        "captionTracks": captionTracks == null ? [] : List<dynamic>.from(captionTracks!.map((x) => x.toJson())),
        "audioTracks": audioTracks == null ? [] : List<dynamic>.from(audioTracks!.map((x) => x.toJson())),
        "translationLanguages": translationLanguages == null ? [] : List<dynamic>.from(translationLanguages!.map((x) => x.toJson())),
        "defaultAudioTrackIndex": defaultAudioTrackIndex,
    };
}

class AudioTrack {
    List<int>? captionTrackIndices;

    AudioTrack({
        this.captionTrackIndices,
    });

    factory AudioTrack.fromJson(Map<String, dynamic> json) => AudioTrack(
        captionTrackIndices: json["captionTrackIndices"] == null ? [] : List<int>.from(json["captionTrackIndices"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "captionTrackIndices": captionTrackIndices == null ? [] : List<dynamic>.from(captionTrackIndices!.map((x) => x)),
    };
}

class CaptionTrack {
    String? baseUrl;
    HeaderText? name;
    String? vssId;
    String? languageCode;
    String? kind;
    bool? isTranslatable;
    String? trackName;

    CaptionTrack({
        this.baseUrl,
        this.name,
        this.vssId,
        this.languageCode,
        this.kind,
        this.isTranslatable,
        this.trackName,
    });

    factory CaptionTrack.fromJson(Map<String, dynamic> json) => CaptionTrack(
        baseUrl: json["baseUrl"],
        name: json["name"] == null ? null : HeaderText.fromJson(json["name"]),
        vssId: json["vssId"],
        languageCode: json["languageCode"],
        kind: json["kind"],
        isTranslatable: json["isTranslatable"],
        trackName: json["trackName"],
    );

    Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
        "name": name?.toJson(),
        "vssId": vssId,
        "languageCode": languageCode,
        "kind": kind,
        "isTranslatable": isTranslatable,
        "trackName": trackName,
    };
}

class HeaderText {
    String? simpleText;

    HeaderText({
        this.simpleText,
    });

    factory HeaderText.fromJson(Map<String, dynamic> json) => HeaderText(
        simpleText: json["simpleText"],
    );

    Map<String, dynamic> toJson() => {
        "simpleText": simpleText,
    };
}

class TranslationLanguage {
    String? languageCode;
    HeaderText? languageName;

    TranslationLanguage({
        this.languageCode,
        this.languageName,
    });

    factory TranslationLanguage.fromJson(Map<String, dynamic> json) => TranslationLanguage(
        languageCode: json["languageCode"],
        languageName: json["languageName"] == null ? null : HeaderText.fromJson(json["languageName"]),
    );

    Map<String, dynamic> toJson() => {
        "languageCode": languageCode,
        "languageName": languageName?.toJson(),
    };
}

class Cards {
    CardCollectionRenderer? cardCollectionRenderer;

    Cards({
        this.cardCollectionRenderer,
    });

    factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        cardCollectionRenderer: json["cardCollectionRenderer"] == null ? null : CardCollectionRenderer.fromJson(json["cardCollectionRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "cardCollectionRenderer": cardCollectionRenderer?.toJson(),
    };
}

class CardCollectionRenderer {
    List<Card>? cards;
    HeaderText? headerText;
    CloseButton? icon;
    CloseButton? closeButton;
    String? trackingParams;
    bool? allowTeaserDismiss;
    bool? logIconVisibilityUpdates;

    CardCollectionRenderer({
        this.cards,
        this.headerText,
        this.icon,
        this.closeButton,
        this.trackingParams,
        this.allowTeaserDismiss,
        this.logIconVisibilityUpdates,
    });

    factory CardCollectionRenderer.fromJson(Map<String, dynamic> json) => CardCollectionRenderer(
        cards: json["cards"] == null ? [] : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
        headerText: json["headerText"] == null ? null : HeaderText.fromJson(json["headerText"]),
        icon: json["icon"] == null ? null : CloseButton.fromJson(json["icon"]),
        closeButton: json["closeButton"] == null ? null : CloseButton.fromJson(json["closeButton"]),
        trackingParams: json["trackingParams"],
        allowTeaserDismiss: json["allowTeaserDismiss"],
        logIconVisibilityUpdates: json["logIconVisibilityUpdates"],
    );

    Map<String, dynamic> toJson() => {
        "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toJson())),
        "headerText": headerText?.toJson(),
        "icon": icon?.toJson(),
        "closeButton": closeButton?.toJson(),
        "trackingParams": trackingParams,
        "allowTeaserDismiss": allowTeaserDismiss,
        "logIconVisibilityUpdates": logIconVisibilityUpdates,
    };
}

class Card {
    CardRenderer? cardRenderer;

    Card({
        this.cardRenderer,
    });

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        cardRenderer: json["cardRenderer"] == null ? null : CardRenderer.fromJson(json["cardRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "cardRenderer": cardRenderer?.toJson(),
    };
}

class CardRenderer {
    Teaser? teaser;
    List<CueRange>? cueRanges;
    String? trackingParams;

    CardRenderer({
        this.teaser,
        this.cueRanges,
        this.trackingParams,
    });

    factory CardRenderer.fromJson(Map<String, dynamic> json) => CardRenderer(
        teaser: json["teaser"] == null ? null : Teaser.fromJson(json["teaser"]),
        cueRanges: json["cueRanges"] == null ? [] : List<CueRange>.from(json["cueRanges"]!.map((x) => CueRange.fromJson(x))),
        trackingParams: json["trackingParams"],
    );

    Map<String, dynamic> toJson() => {
        "teaser": teaser?.toJson(),
        "cueRanges": cueRanges == null ? [] : List<dynamic>.from(cueRanges!.map((x) => x.toJson())),
        "trackingParams": trackingParams,
    };
}

class CueRange {
    String? startCardActiveMs;
    String? endCardActiveMs;
    String? teaserDurationMs;
    String? iconAfterTeaserMs;

    CueRange({
        this.startCardActiveMs,
        this.endCardActiveMs,
        this.teaserDurationMs,
        this.iconAfterTeaserMs,
    });

    factory CueRange.fromJson(Map<String, dynamic> json) => CueRange(
        startCardActiveMs: json["startCardActiveMs"],
        endCardActiveMs: json["endCardActiveMs"],
        teaserDurationMs: json["teaserDurationMs"],
        iconAfterTeaserMs: json["iconAfterTeaserMs"],
    );

    Map<String, dynamic> toJson() => {
        "startCardActiveMs": startCardActiveMs,
        "endCardActiveMs": endCardActiveMs,
        "teaserDurationMs": teaserDurationMs,
        "iconAfterTeaserMs": iconAfterTeaserMs,
    };
}

class Teaser {
    SimpleCardTeaserRenderer? simpleCardTeaserRenderer;

    Teaser({
        this.simpleCardTeaserRenderer,
    });

    factory Teaser.fromJson(Map<String, dynamic> json) => Teaser(
        simpleCardTeaserRenderer: json["simpleCardTeaserRenderer"] == null ? null : SimpleCardTeaserRenderer.fromJson(json["simpleCardTeaserRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "simpleCardTeaserRenderer": simpleCardTeaserRenderer?.toJson(),
    };
}

class SimpleCardTeaserRenderer {
    HeaderText? message;
    String? trackingParams;
    bool? prominent;
    bool? logVisibilityUpdates;
    OnTapCommand? onTapCommand;

    SimpleCardTeaserRenderer({
        this.message,
        this.trackingParams,
        this.prominent,
        this.logVisibilityUpdates,
        this.onTapCommand,
    });

    factory SimpleCardTeaserRenderer.fromJson(Map<String, dynamic> json) => SimpleCardTeaserRenderer(
        message: json["message"] == null ? null : HeaderText.fromJson(json["message"]),
        trackingParams: json["trackingParams"],
        prominent: json["prominent"],
        logVisibilityUpdates: json["logVisibilityUpdates"],
        onTapCommand: json["onTapCommand"] == null ? null : OnTapCommand.fromJson(json["onTapCommand"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
        "trackingParams": trackingParams,
        "prominent": prominent,
        "logVisibilityUpdates": logVisibilityUpdates,
        "onTapCommand": onTapCommand?.toJson(),
    };
}

class OnTapCommand {
    String? clickTrackingParams;
    ChangeEngagementPanelVisibilityAction? changeEngagementPanelVisibilityAction;

    OnTapCommand({
        this.clickTrackingParams,
        this.changeEngagementPanelVisibilityAction,
    });

    factory OnTapCommand.fromJson(Map<String, dynamic> json) => OnTapCommand(
        clickTrackingParams: json["clickTrackingParams"],
        changeEngagementPanelVisibilityAction: json["changeEngagementPanelVisibilityAction"] == null ? null : ChangeEngagementPanelVisibilityAction.fromJson(json["changeEngagementPanelVisibilityAction"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "changeEngagementPanelVisibilityAction": changeEngagementPanelVisibilityAction?.toJson(),
    };
}

class ChangeEngagementPanelVisibilityAction {
    String? targetId;
    String? visibility;

    ChangeEngagementPanelVisibilityAction({
        this.targetId,
        this.visibility,
    });

    factory ChangeEngagementPanelVisibilityAction.fromJson(Map<String, dynamic> json) => ChangeEngagementPanelVisibilityAction(
        targetId: json["targetId"],
        visibility: json["visibility"],
    );

    Map<String, dynamic> toJson() => {
        "targetId": targetId,
        "visibility": visibility,
    };
}

class CloseButton {
    InfoCardIconRenderer? infoCardIconRenderer;

    CloseButton({
        this.infoCardIconRenderer,
    });

    factory CloseButton.fromJson(Map<String, dynamic> json) => CloseButton(
        infoCardIconRenderer: json["infoCardIconRenderer"] == null ? null : InfoCardIconRenderer.fromJson(json["infoCardIconRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "infoCardIconRenderer": infoCardIconRenderer?.toJson(),
    };
}

class InfoCardIconRenderer {
    String? trackingParams;

    InfoCardIconRenderer({
        this.trackingParams,
    });

    factory InfoCardIconRenderer.fromJson(Map<String, dynamic> json) => InfoCardIconRenderer(
        trackingParams: json["trackingParams"],
    );

    Map<String, dynamic> toJson() => {
        "trackingParams": trackingParams,
    };
}

class FrameworkUpdates {
    EntityBatchUpdate? entityBatchUpdate;

    FrameworkUpdates({
        this.entityBatchUpdate,
    });

    factory FrameworkUpdates.fromJson(Map<String, dynamic> json) => FrameworkUpdates(
        entityBatchUpdate: json["entityBatchUpdate"] == null ? null : EntityBatchUpdate.fromJson(json["entityBatchUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "entityBatchUpdate": entityBatchUpdate?.toJson(),
    };
}

class EntityBatchUpdate {
    List<Mutation>? mutations;
    Timestamp? timestamp;

    EntityBatchUpdate({
        this.mutations,
        this.timestamp,
    });

    factory EntityBatchUpdate.fromJson(Map<String, dynamic> json) => EntityBatchUpdate(
        mutations: json["mutations"] == null ? [] : List<Mutation>.from(json["mutations"]!.map((x) => Mutation.fromJson(x))),
        timestamp: json["timestamp"] == null ? null : Timestamp.fromJson(json["timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "mutations": mutations == null ? [] : List<dynamic>.from(mutations!.map((x) => x.toJson())),
        "timestamp": timestamp?.toJson(),
    };
}

class Mutation {
    String? entityKey;
    String? type;
    Payload? payload;

    Mutation({
        this.entityKey,
        this.type,
        this.payload,
    });

    factory Mutation.fromJson(Map<String, dynamic> json) => Mutation(
        entityKey: json["entityKey"],
        type: json["type"],
        payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "entityKey": entityKey,
        "type": type,
        "payload": payload?.toJson(),
    };
}

class Payload {
    OfflineabilityEntity? offlineabilityEntity;

    Payload({
        this.offlineabilityEntity,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        offlineabilityEntity: json["offlineabilityEntity"] == null ? null : OfflineabilityEntity.fromJson(json["offlineabilityEntity"]),
    );

    Map<String, dynamic> toJson() => {
        "offlineabilityEntity": offlineabilityEntity?.toJson(),
    };
}

class OfflineabilityEntity {
    String? key;
    String? addToOfflineButtonState;

    OfflineabilityEntity({
        this.key,
        this.addToOfflineButtonState,
    });

    factory OfflineabilityEntity.fromJson(Map<String, dynamic> json) => OfflineabilityEntity(
        key: json["key"],
        addToOfflineButtonState: json["addToOfflineButtonState"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "addToOfflineButtonState": addToOfflineButtonState,
    };
}

class Timestamp {
    String? seconds;
    int? nanos;

    Timestamp({
        this.seconds,
        this.nanos,
    });

    factory Timestamp.fromJson(Map<String, dynamic> json) => Timestamp(
        seconds: json["seconds"],
        nanos: json["nanos"],
    );

    Map<String, dynamic> toJson() => {
        "seconds": seconds,
        "nanos": nanos,
    };
}

class Message {
    MealbarPromoRenderer? mealbarPromoRenderer;

    Message({
        this.mealbarPromoRenderer,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        mealbarPromoRenderer: json["mealbarPromoRenderer"] == null ? null : MealbarPromoRenderer.fromJson(json["mealbarPromoRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "mealbarPromoRenderer": mealbarPromoRenderer?.toJson(),
    };
}

class MealbarPromoRenderer {
    IconClass? icon;
    List<MessageTitle>? messageTexts;
    ActionButton? actionButton;
    DismissButton? dismissButton;
    String? triggerCondition;
    String? style;
    String? trackingParams;
    List<ImpressionEndpoint>? impressionEndpoints;
    bool? isVisible;
    MessageTitle? messageTitle;

    MealbarPromoRenderer({
        this.icon,
        this.messageTexts,
        this.actionButton,
        this.dismissButton,
        this.triggerCondition,
        this.style,
        this.trackingParams,
        this.impressionEndpoints,
        this.isVisible,
        this.messageTitle,
    });

    factory MealbarPromoRenderer.fromJson(Map<String, dynamic> json) => MealbarPromoRenderer(
        icon: json["icon"] == null ? null : IconClass.fromJson(json["icon"]),
        messageTexts: json["messageTexts"] == null ? [] : List<MessageTitle>.from(json["messageTexts"]!.map((x) => MessageTitle.fromJson(x))),
        actionButton: json["actionButton"] == null ? null : ActionButton.fromJson(json["actionButton"]),
        dismissButton: json["dismissButton"] == null ? null : DismissButton.fromJson(json["dismissButton"]),
        triggerCondition: json["triggerCondition"],
        style: json["style"],
        trackingParams: json["trackingParams"],
        impressionEndpoints: json["impressionEndpoints"] == null ? [] : List<ImpressionEndpoint>.from(json["impressionEndpoints"]!.map((x) => ImpressionEndpoint.fromJson(x))),
        isVisible: json["isVisible"],
        messageTitle: json["messageTitle"] == null ? null : MessageTitle.fromJson(json["messageTitle"]),
    );

    Map<String, dynamic> toJson() => {
        "icon": icon?.toJson(),
        "messageTexts": messageTexts == null ? [] : List<dynamic>.from(messageTexts!.map((x) => x.toJson())),
        "actionButton": actionButton?.toJson(),
        "dismissButton": dismissButton?.toJson(),
        "triggerCondition": triggerCondition,
        "style": style,
        "trackingParams": trackingParams,
        "impressionEndpoints": impressionEndpoints == null ? [] : List<dynamic>.from(impressionEndpoints!.map((x) => x.toJson())),
        "isVisible": isVisible,
        "messageTitle": messageTitle?.toJson(),
    };
}

class ActionButton {
    ActionButtonButtonRenderer? buttonRenderer;

    ActionButton({
        this.buttonRenderer,
    });

    factory ActionButton.fromJson(Map<String, dynamic> json) => ActionButton(
        buttonRenderer: json["buttonRenderer"] == null ? null : ActionButtonButtonRenderer.fromJson(json["buttonRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "buttonRenderer": buttonRenderer?.toJson(),
    };
}

class ActionButtonButtonRenderer {
    String? style;
    String? size;
    MessageTitle? text;
    String? trackingParams;
    PurpleCommand? command;

    ActionButtonButtonRenderer({
        this.style,
        this.size,
        this.text,
        this.trackingParams,
        this.command,
    });

    factory ActionButtonButtonRenderer.fromJson(Map<String, dynamic> json) => ActionButtonButtonRenderer(
        style: json["style"],
        size: json["size"],
        text: json["text"] == null ? null : MessageTitle.fromJson(json["text"]),
        trackingParams: json["trackingParams"],
        command: json["command"] == null ? null : PurpleCommand.fromJson(json["command"]),
    );

    Map<String, dynamic> toJson() => {
        "style": style,
        "size": size,
        "text": text?.toJson(),
        "trackingParams": trackingParams,
        "command": command?.toJson(),
    };
}

class PurpleCommand {
    String? clickTrackingParams;
    PurpleCommandExecutorCommand? commandExecutorCommand;

    PurpleCommand({
        this.clickTrackingParams,
        this.commandExecutorCommand,
    });

    factory PurpleCommand.fromJson(Map<String, dynamic> json) => PurpleCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandExecutorCommand: json["commandExecutorCommand"] == null ? null : PurpleCommandExecutorCommand.fromJson(json["commandExecutorCommand"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandExecutorCommand": commandExecutorCommand?.toJson(),
    };
}

class PurpleCommandExecutorCommand {
    List<CommandElement>? commands;

    PurpleCommandExecutorCommand({
        this.commands,
    });

    factory PurpleCommandExecutorCommand.fromJson(Map<String, dynamic> json) => PurpleCommandExecutorCommand(
        commands: json["commands"] == null ? [] : List<CommandElement>.from(json["commands"]!.map((x) => CommandElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "commands": commands == null ? [] : List<dynamic>.from(commands!.map((x) => x.toJson())),
    };
}

class CommandElement {
    String? clickTrackingParams;
    NavigationEndpointCommandMetadata? commandMetadata;
    CommandBrowseEndpoint? browseEndpoint;
    FeedbackEndpoint? feedbackEndpoint;

    CommandElement({
        this.clickTrackingParams,
        this.commandMetadata,
        this.browseEndpoint,
        this.feedbackEndpoint,
    });

    factory CommandElement.fromJson(Map<String, dynamic> json) => CommandElement(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : NavigationEndpointCommandMetadata.fromJson(json["commandMetadata"]),
        browseEndpoint: json["browseEndpoint"] == null ? null : CommandBrowseEndpoint.fromJson(json["browseEndpoint"]),
        feedbackEndpoint: json["feedbackEndpoint"] == null ? null : FeedbackEndpoint.fromJson(json["feedbackEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "browseEndpoint": browseEndpoint?.toJson(),
        "feedbackEndpoint": feedbackEndpoint?.toJson(),
    };
}

class CommandBrowseEndpoint {
    String? browseId;
    String? params;

    CommandBrowseEndpoint({
        this.browseId,
        this.params,
    });

    factory CommandBrowseEndpoint.fromJson(Map<String, dynamic> json) => CommandBrowseEndpoint(
        browseId: json["browseId"],
        params: json["params"],
    );

    Map<String, dynamic> toJson() => {
        "browseId": browseId,
        "params": params,
    };
}

class FeedbackEndpoint {
    String? feedbackToken;
    UiActions? uiActions;

    FeedbackEndpoint({
        this.feedbackToken,
        this.uiActions,
    });

    factory FeedbackEndpoint.fromJson(Map<String, dynamic> json) => FeedbackEndpoint(
        feedbackToken: json["feedbackToken"],
        uiActions: json["uiActions"] == null ? null : UiActions.fromJson(json["uiActions"]),
    );

    Map<String, dynamic> toJson() => {
        "feedbackToken": feedbackToken,
        "uiActions": uiActions?.toJson(),
    };
}

class UiActions {
    bool? hideEnclosingContainer;

    UiActions({
        this.hideEnclosingContainer,
    });

    factory UiActions.fromJson(Map<String, dynamic> json) => UiActions(
        hideEnclosingContainer: json["hideEnclosingContainer"],
    );

    Map<String, dynamic> toJson() => {
        "hideEnclosingContainer": hideEnclosingContainer,
    };
}

class DismissButton {
    DismissButtonButtonRenderer? buttonRenderer;

    DismissButton({
        this.buttonRenderer,
    });

    factory DismissButton.fromJson(Map<String, dynamic> json) => DismissButton(
        buttonRenderer: json["buttonRenderer"] == null ? null : DismissButtonButtonRenderer.fromJson(json["buttonRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "buttonRenderer": buttonRenderer?.toJson(),
    };
}

class DismissButtonButtonRenderer {
    String? style;
    String? size;
    MessageTitle? text;
    String? trackingParams;
    FluffyCommand? command;

    DismissButtonButtonRenderer({
        this.style,
        this.size,
        this.text,
        this.trackingParams,
        this.command,
    });

    factory DismissButtonButtonRenderer.fromJson(Map<String, dynamic> json) => DismissButtonButtonRenderer(
        style: json["style"],
        size: json["size"],
        text: json["text"] == null ? null : MessageTitle.fromJson(json["text"]),
        trackingParams: json["trackingParams"],
        command: json["command"] == null ? null : FluffyCommand.fromJson(json["command"]),
    );

    Map<String, dynamic> toJson() => {
        "style": style,
        "size": size,
        "text": text?.toJson(),
        "trackingParams": trackingParams,
        "command": command?.toJson(),
    };
}

class FluffyCommand {
    String? clickTrackingParams;
    FluffyCommandExecutorCommand? commandExecutorCommand;

    FluffyCommand({
        this.clickTrackingParams,
        this.commandExecutorCommand,
    });

    factory FluffyCommand.fromJson(Map<String, dynamic> json) => FluffyCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandExecutorCommand: json["commandExecutorCommand"] == null ? null : FluffyCommandExecutorCommand.fromJson(json["commandExecutorCommand"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandExecutorCommand": commandExecutorCommand?.toJson(),
    };
}

class FluffyCommandExecutorCommand {
    List<ImpressionEndpoint>? commands;

    FluffyCommandExecutorCommand({
        this.commands,
    });

    factory FluffyCommandExecutorCommand.fromJson(Map<String, dynamic> json) => FluffyCommandExecutorCommand(
        commands: json["commands"] == null ? [] : List<ImpressionEndpoint>.from(json["commands"]!.map((x) => ImpressionEndpoint.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "commands": commands == null ? [] : List<dynamic>.from(commands!.map((x) => x.toJson())),
    };
}

class ImpressionEndpoint {
    String? clickTrackingParams;
    SubscribeCommandCommandMetadata? commandMetadata;
    FeedbackEndpoint? feedbackEndpoint;

    ImpressionEndpoint({
        this.clickTrackingParams,
        this.commandMetadata,
        this.feedbackEndpoint,
    });

    factory ImpressionEndpoint.fromJson(Map<String, dynamic> json) => ImpressionEndpoint(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SubscribeCommandCommandMetadata.fromJson(json["commandMetadata"]),
        feedbackEndpoint: json["feedbackEndpoint"] == null ? null : FeedbackEndpoint.fromJson(json["feedbackEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "feedbackEndpoint": feedbackEndpoint?.toJson(),
    };
}

class Microformat {
    PlayerMicroformatRenderer? playerMicroformatRenderer;

    Microformat({
        this.playerMicroformatRenderer,
    });

    factory Microformat.fromJson(Map<String, dynamic> json) => Microformat(
        playerMicroformatRenderer: json["playerMicroformatRenderer"] == null ? null : PlayerMicroformatRenderer.fromJson(json["playerMicroformatRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "playerMicroformatRenderer": playerMicroformatRenderer?.toJson(),
    };
}

class PlayerMicroformatRenderer {
    IconClass? thumbnail;
    Embed? embed;
    HeaderText? title;
    HeaderText? description;
    String? lengthSeconds;
    String? ownerProfileUrl;
    String? externalChannelId;
    bool? isFamilySafe;
    List<String>? availableCountries;
    bool? isUnlisted;
    bool? hasYpcMetadata;
    String? viewCount;
    String? category;
    DateTime? publishDate;
    String? ownerChannelName;
    DateTime? uploadDate;

    PlayerMicroformatRenderer({
        this.thumbnail,
        this.embed,
        this.title,
        this.description,
        this.lengthSeconds,
        this.ownerProfileUrl,
        this.externalChannelId,
        this.isFamilySafe,
        this.availableCountries,
        this.isUnlisted,
        this.hasYpcMetadata,
        this.viewCount,
        this.category,
        this.publishDate,
        this.ownerChannelName,
        this.uploadDate,
    });

    factory PlayerMicroformatRenderer.fromJson(Map<String, dynamic> json) => PlayerMicroformatRenderer(
        thumbnail: json["thumbnail"] == null ? null : IconClass.fromJson(json["thumbnail"]),
        embed: json["embed"] == null ? null : Embed.fromJson(json["embed"]),
        title: json["title"] == null ? null : HeaderText.fromJson(json["title"]),
        description: json["description"] == null ? null : HeaderText.fromJson(json["description"]),
        lengthSeconds: json["lengthSeconds"],
        ownerProfileUrl: json["ownerProfileUrl"],
        externalChannelId: json["externalChannelId"],
        isFamilySafe: json["isFamilySafe"],
        availableCountries: json["availableCountries"] == null ? [] : List<String>.from(json["availableCountries"]!.map((x) => x)),
        isUnlisted: json["isUnlisted"],
        hasYpcMetadata: json["hasYpcMetadata"],
        viewCount: json["viewCount"],
        category: json["category"],
        publishDate: json["publishDate"] == null ? null : DateTime.parse(json["publishDate"]),
        ownerChannelName: json["ownerChannelName"],
        uploadDate: json["uploadDate"] == null ? null : DateTime.parse(json["uploadDate"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail?.toJson(),
        "embed": embed?.toJson(),
        "title": title?.toJson(),
        "description": description?.toJson(),
        "lengthSeconds": lengthSeconds,
        "ownerProfileUrl": ownerProfileUrl,
        "externalChannelId": externalChannelId,
        "isFamilySafe": isFamilySafe,
        "availableCountries": availableCountries == null ? [] : List<dynamic>.from(availableCountries!.map((x) => x)),
        "isUnlisted": isUnlisted,
        "hasYpcMetadata": hasYpcMetadata,
        "viewCount": viewCount,
        "category": category,
        "publishDate": publishDate?.toIso8601String(),
        "ownerChannelName": ownerChannelName,
        "uploadDate": uploadDate?.toIso8601String(),
    };
}

class Embed {
    String? iframeUrl;
    int? width;
    int? height;

    Embed({
        this.iframeUrl,
        this.width,
        this.height,
    });

    factory Embed.fromJson(Map<String, dynamic> json) => Embed(
        iframeUrl: json["iframeUrl"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "iframeUrl": iframeUrl,
        "width": width,
        "height": height,
    };
}

class PlayabilityStatus {
    String? status;
    bool? playableInEmbed;
    Miniplayer? miniplayer;
    String? contextParams;

    PlayabilityStatus({
        this.status,
        this.playableInEmbed,
        this.miniplayer,
        this.contextParams,
    });

    factory PlayabilityStatus.fromJson(Map<String, dynamic> json) => PlayabilityStatus(
        status: json["status"],
        playableInEmbed: json["playableInEmbed"],
        miniplayer: json["miniplayer"] == null ? null : Miniplayer.fromJson(json["miniplayer"]),
        contextParams: json["contextParams"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "playableInEmbed": playableInEmbed,
        "miniplayer": miniplayer?.toJson(),
        "contextParams": contextParams,
    };
}

class Miniplayer {
    MiniplayerRenderer? miniplayerRenderer;

    Miniplayer({
        this.miniplayerRenderer,
    });

    factory Miniplayer.fromJson(Map<String, dynamic> json) => Miniplayer(
        miniplayerRenderer: json["miniplayerRenderer"] == null ? null : MiniplayerRenderer.fromJson(json["miniplayerRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "miniplayerRenderer": miniplayerRenderer?.toJson(),
    };
}

class MiniplayerRenderer {
    String? playbackMode;

    MiniplayerRenderer({
        this.playbackMode,
    });

    factory MiniplayerRenderer.fromJson(Map<String, dynamic> json) => MiniplayerRenderer(
        playbackMode: json["playbackMode"],
    );

    Map<String, dynamic> toJson() => {
        "playbackMode": playbackMode,
    };
}

class PlaybackTracking {
    Url? videostatsPlaybackUrl;
    Url? videostatsDelayplayUrl;
    Url? videostatsWatchtimeUrl;
    Url? ptrackingUrl;
    Url? qoeUrl;
    AtrUrl? atrUrl;
    List<int>? videostatsScheduledFlushWalltimeSeconds;
    int? videostatsDefaultFlushIntervalSeconds;

    PlaybackTracking({
        this.videostatsPlaybackUrl,
        this.videostatsDelayplayUrl,
        this.videostatsWatchtimeUrl,
        this.ptrackingUrl,
        this.qoeUrl,
        this.atrUrl,
        this.videostatsScheduledFlushWalltimeSeconds,
        this.videostatsDefaultFlushIntervalSeconds,
    });

    factory PlaybackTracking.fromJson(Map<String, dynamic> json) => PlaybackTracking(
        videostatsPlaybackUrl: json["videostatsPlaybackUrl"] == null ? null : Url.fromJson(json["videostatsPlaybackUrl"]),
        videostatsDelayplayUrl: json["videostatsDelayplayUrl"] == null ? null : Url.fromJson(json["videostatsDelayplayUrl"]),
        videostatsWatchtimeUrl: json["videostatsWatchtimeUrl"] == null ? null : Url.fromJson(json["videostatsWatchtimeUrl"]),
        ptrackingUrl: json["ptrackingUrl"] == null ? null : Url.fromJson(json["ptrackingUrl"]),
        qoeUrl: json["qoeUrl"] == null ? null : Url.fromJson(json["qoeUrl"]),
        atrUrl: json["atrUrl"] == null ? null : AtrUrl.fromJson(json["atrUrl"]),
        videostatsScheduledFlushWalltimeSeconds: json["videostatsScheduledFlushWalltimeSeconds"] == null ? [] : List<int>.from(json["videostatsScheduledFlushWalltimeSeconds"]!.map((x) => x)),
        videostatsDefaultFlushIntervalSeconds: json["videostatsDefaultFlushIntervalSeconds"],
    );

    Map<String, dynamic> toJson() => {
        "videostatsPlaybackUrl": videostatsPlaybackUrl?.toJson(),
        "videostatsDelayplayUrl": videostatsDelayplayUrl?.toJson(),
        "videostatsWatchtimeUrl": videostatsWatchtimeUrl?.toJson(),
        "ptrackingUrl": ptrackingUrl?.toJson(),
        "qoeUrl": qoeUrl?.toJson(),
        "atrUrl": atrUrl?.toJson(),
        "videostatsScheduledFlushWalltimeSeconds": videostatsScheduledFlushWalltimeSeconds == null ? [] : List<dynamic>.from(videostatsScheduledFlushWalltimeSeconds!.map((x) => x)),
        "videostatsDefaultFlushIntervalSeconds": videostatsDefaultFlushIntervalSeconds,
    };
}

class AtrUrl {
    String? baseUrl;
    int? elapsedMediaTimeSeconds;

    AtrUrl({
        this.baseUrl,
        this.elapsedMediaTimeSeconds,
    });

    factory AtrUrl.fromJson(Map<String, dynamic> json) => AtrUrl(
        baseUrl: json["baseUrl"],
        elapsedMediaTimeSeconds: json["elapsedMediaTimeSeconds"],
    );

    Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
        "elapsedMediaTimeSeconds": elapsedMediaTimeSeconds,
    };
}

class Url {
    String? baseUrl;

    Url({
        this.baseUrl,
    });

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        baseUrl: json["baseUrl"],
    );

    Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
    };
}

class PlayerAd {
    PlayerLegacyDesktopWatchAdsRenderer? playerLegacyDesktopWatchAdsRenderer;

    PlayerAd({
        this.playerLegacyDesktopWatchAdsRenderer,
    });

    factory PlayerAd.fromJson(Map<String, dynamic> json) => PlayerAd(
        playerLegacyDesktopWatchAdsRenderer: json["playerLegacyDesktopWatchAdsRenderer"] == null ? null : PlayerLegacyDesktopWatchAdsRenderer.fromJson(json["playerLegacyDesktopWatchAdsRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "playerLegacyDesktopWatchAdsRenderer": playerLegacyDesktopWatchAdsRenderer?.toJson(),
    };
}

class PlayerLegacyDesktopWatchAdsRenderer {
    PlayerAdParams? playerAdParams;
    GutParams? gutParams;
    bool? showCompanion;
    bool? showInstream;
    bool? useGut;

    PlayerLegacyDesktopWatchAdsRenderer({
        this.playerAdParams,
        this.gutParams,
        this.showCompanion,
        this.showInstream,
        this.useGut,
    });

    factory PlayerLegacyDesktopWatchAdsRenderer.fromJson(Map<String, dynamic> json) => PlayerLegacyDesktopWatchAdsRenderer(
        playerAdParams: json["playerAdParams"] == null ? null : PlayerAdParams.fromJson(json["playerAdParams"]),
        gutParams: json["gutParams"] == null ? null : GutParams.fromJson(json["gutParams"]),
        showCompanion: json["showCompanion"],
        showInstream: json["showInstream"],
        useGut: json["useGut"],
    );

    Map<String, dynamic> toJson() => {
        "playerAdParams": playerAdParams?.toJson(),
        "gutParams": gutParams?.toJson(),
        "showCompanion": showCompanion,
        "showInstream": showInstream,
        "useGut": useGut,
    };
}

class GutParams {
    String? tag;

    GutParams({
        this.tag,
    });

    factory GutParams.fromJson(Map<String, dynamic> json) => GutParams(
        tag: json["tag"],
    );

    Map<String, dynamic> toJson() => {
        "tag": tag,
    };
}

class PlayerAdParams {
    bool? showContentThumbnail;
    String? enabledEngageTypes;

    PlayerAdParams({
        this.showContentThumbnail,
        this.enabledEngageTypes,
    });

    factory PlayerAdParams.fromJson(Map<String, dynamic> json) => PlayerAdParams(
        showContentThumbnail: json["showContentThumbnail"],
        enabledEngageTypes: json["enabledEngageTypes"],
    );

    Map<String, dynamic> toJson() => {
        "showContentThumbnail": showContentThumbnail,
        "enabledEngageTypes": enabledEngageTypes,
    };
}

class PlayerConfig {
    AudioConfig? audioConfig;
    StreamSelectionConfig? streamSelectionConfig;
    MediaCommonConfig? mediaCommonConfig;
    WebPlayerConfig? webPlayerConfig;

    PlayerConfig({
        this.audioConfig,
        this.streamSelectionConfig,
        this.mediaCommonConfig,
        this.webPlayerConfig,
    });

    factory PlayerConfig.fromJson(Map<String, dynamic> json) => PlayerConfig(
        audioConfig: json["audioConfig"] == null ? null : AudioConfig.fromJson(json["audioConfig"]),
        streamSelectionConfig: json["streamSelectionConfig"] == null ? null : StreamSelectionConfig.fromJson(json["streamSelectionConfig"]),
        mediaCommonConfig: json["mediaCommonConfig"] == null ? null : MediaCommonConfig.fromJson(json["mediaCommonConfig"]),
        webPlayerConfig: json["webPlayerConfig"] == null ? null : WebPlayerConfig.fromJson(json["webPlayerConfig"]),
    );

    Map<String, dynamic> toJson() => {
        "audioConfig": audioConfig?.toJson(),
        "streamSelectionConfig": streamSelectionConfig?.toJson(),
        "mediaCommonConfig": mediaCommonConfig?.toJson(),
        "webPlayerConfig": webPlayerConfig?.toJson(),
    };
}

class AudioConfig {
    double? loudnessDb;
    double? perceptualLoudnessDb;
    bool? enablePerFormatLoudness;

    AudioConfig({
        this.loudnessDb,
        this.perceptualLoudnessDb,
        this.enablePerFormatLoudness,
    });

    factory AudioConfig.fromJson(Map<String, dynamic> json) => AudioConfig(
        loudnessDb: json["loudnessDb"]?.toDouble(),
        perceptualLoudnessDb: json["perceptualLoudnessDb"]?.toDouble(),
        enablePerFormatLoudness: json["enablePerFormatLoudness"],
    );

    Map<String, dynamic> toJson() => {
        "loudnessDb": loudnessDb,
        "perceptualLoudnessDb": perceptualLoudnessDb,
        "enablePerFormatLoudness": enablePerFormatLoudness,
    };
}

class MediaCommonConfig {
    DynamicReadaheadConfig? dynamicReadaheadConfig;

    MediaCommonConfig({
        this.dynamicReadaheadConfig,
    });

    factory MediaCommonConfig.fromJson(Map<String, dynamic> json) => MediaCommonConfig(
        dynamicReadaheadConfig: json["dynamicReadaheadConfig"] == null ? null : DynamicReadaheadConfig.fromJson(json["dynamicReadaheadConfig"]),
    );

    Map<String, dynamic> toJson() => {
        "dynamicReadaheadConfig": dynamicReadaheadConfig?.toJson(),
    };
}

class DynamicReadaheadConfig {
    int? maxReadAheadMediaTimeMs;
    int? minReadAheadMediaTimeMs;
    int? readAheadGrowthRateMs;

    DynamicReadaheadConfig({
        this.maxReadAheadMediaTimeMs,
        this.minReadAheadMediaTimeMs,
        this.readAheadGrowthRateMs,
    });

    factory DynamicReadaheadConfig.fromJson(Map<String, dynamic> json) => DynamicReadaheadConfig(
        maxReadAheadMediaTimeMs: json["maxReadAheadMediaTimeMs"],
        minReadAheadMediaTimeMs: json["minReadAheadMediaTimeMs"],
        readAheadGrowthRateMs: json["readAheadGrowthRateMs"],
    );

    Map<String, dynamic> toJson() => {
        "maxReadAheadMediaTimeMs": maxReadAheadMediaTimeMs,
        "minReadAheadMediaTimeMs": minReadAheadMediaTimeMs,
        "readAheadGrowthRateMs": readAheadGrowthRateMs,
    };
}

class StreamSelectionConfig {
    String? maxBitrate;

    StreamSelectionConfig({
        this.maxBitrate,
    });

    factory StreamSelectionConfig.fromJson(Map<String, dynamic> json) => StreamSelectionConfig(
        maxBitrate: json["maxBitrate"],
    );

    Map<String, dynamic> toJson() => {
        "maxBitrate": maxBitrate,
    };
}

class WebPlayerConfig {
    bool? useCobaltTvosDash;
    WebPlayerActionsPorting? webPlayerActionsPorting;

    WebPlayerConfig({
        this.useCobaltTvosDash,
        this.webPlayerActionsPorting,
    });

    factory WebPlayerConfig.fromJson(Map<String, dynamic> json) => WebPlayerConfig(
        useCobaltTvosDash: json["useCobaltTvosDash"],
        webPlayerActionsPorting: json["webPlayerActionsPorting"] == null ? null : WebPlayerActionsPorting.fromJson(json["webPlayerActionsPorting"]),
    );

    Map<String, dynamic> toJson() => {
        "useCobaltTvosDash": useCobaltTvosDash,
        "webPlayerActionsPorting": webPlayerActionsPorting?.toJson(),
    };
}

class WebPlayerActionsPorting {
    GetSharePanelCommand? getSharePanelCommand;
    SubscribeCommand? subscribeCommand;
    UnsubscribeCommand? unsubscribeCommand;
    AddToWatchLaterCommand? addToWatchLaterCommand;
    RemoveFromWatchLaterCommand? removeFromWatchLaterCommand;

    WebPlayerActionsPorting({
        this.getSharePanelCommand,
        this.subscribeCommand,
        this.unsubscribeCommand,
        this.addToWatchLaterCommand,
        this.removeFromWatchLaterCommand,
    });

    factory WebPlayerActionsPorting.fromJson(Map<String, dynamic> json) => WebPlayerActionsPorting(
        getSharePanelCommand: json["getSharePanelCommand"] == null ? null : GetSharePanelCommand.fromJson(json["getSharePanelCommand"]),
        subscribeCommand: json["subscribeCommand"] == null ? null : SubscribeCommand.fromJson(json["subscribeCommand"]),
        unsubscribeCommand: json["unsubscribeCommand"] == null ? null : UnsubscribeCommand.fromJson(json["unsubscribeCommand"]),
        addToWatchLaterCommand: json["addToWatchLaterCommand"] == null ? null : AddToWatchLaterCommand.fromJson(json["addToWatchLaterCommand"]),
        removeFromWatchLaterCommand: json["removeFromWatchLaterCommand"] == null ? null : RemoveFromWatchLaterCommand.fromJson(json["removeFromWatchLaterCommand"]),
    );

    Map<String, dynamic> toJson() => {
        "getSharePanelCommand": getSharePanelCommand?.toJson(),
        "subscribeCommand": subscribeCommand?.toJson(),
        "unsubscribeCommand": unsubscribeCommand?.toJson(),
        "addToWatchLaterCommand": addToWatchLaterCommand?.toJson(),
        "removeFromWatchLaterCommand": removeFromWatchLaterCommand?.toJson(),
    };
}

class AddToWatchLaterCommand {
    String? clickTrackingParams;
    SubscribeCommandCommandMetadata? commandMetadata;
    AddToWatchLaterCommandPlaylistEditEndpoint? playlistEditEndpoint;

    AddToWatchLaterCommand({
        this.clickTrackingParams,
        this.commandMetadata,
        this.playlistEditEndpoint,
    });

    factory AddToWatchLaterCommand.fromJson(Map<String, dynamic> json) => AddToWatchLaterCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SubscribeCommandCommandMetadata.fromJson(json["commandMetadata"]),
        playlistEditEndpoint: json["playlistEditEndpoint"] == null ? null : AddToWatchLaterCommandPlaylistEditEndpoint.fromJson(json["playlistEditEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "playlistEditEndpoint": playlistEditEndpoint?.toJson(),
    };
}

class AddToWatchLaterCommandPlaylistEditEndpoint {
    String? playlistId;
    List<PurpleAction>? actions;

    AddToWatchLaterCommandPlaylistEditEndpoint({
        this.playlistId,
        this.actions,
    });

    factory AddToWatchLaterCommandPlaylistEditEndpoint.fromJson(Map<String, dynamic> json) => AddToWatchLaterCommandPlaylistEditEndpoint(
        playlistId: json["playlistId"],
        actions: json["actions"] == null ? [] : List<PurpleAction>.from(json["actions"]!.map((x) => PurpleAction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "playlistId": playlistId,
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
    };
}

class PurpleAction {
    String? addedVideoId;
    String? action;

    PurpleAction({
        this.addedVideoId,
        this.action,
    });

    factory PurpleAction.fromJson(Map<String, dynamic> json) => PurpleAction(
        addedVideoId: json["addedVideoId"],
        action: json["action"],
    );

    Map<String, dynamic> toJson() => {
        "addedVideoId": addedVideoId,
        "action": action,
    };
}

class GetSharePanelCommand {
    String? clickTrackingParams;
    SubscribeCommandCommandMetadata? commandMetadata;
    WebPlayerShareEntityServiceEndpoint? webPlayerShareEntityServiceEndpoint;

    GetSharePanelCommand({
        this.clickTrackingParams,
        this.commandMetadata,
        this.webPlayerShareEntityServiceEndpoint,
    });

    factory GetSharePanelCommand.fromJson(Map<String, dynamic> json) => GetSharePanelCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SubscribeCommandCommandMetadata.fromJson(json["commandMetadata"]),
        webPlayerShareEntityServiceEndpoint: json["webPlayerShareEntityServiceEndpoint"] == null ? null : WebPlayerShareEntityServiceEndpoint.fromJson(json["webPlayerShareEntityServiceEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "webPlayerShareEntityServiceEndpoint": webPlayerShareEntityServiceEndpoint?.toJson(),
    };
}

class WebPlayerShareEntityServiceEndpoint {
    String? serializedShareEntity;

    WebPlayerShareEntityServiceEndpoint({
        this.serializedShareEntity,
    });

    factory WebPlayerShareEntityServiceEndpoint.fromJson(Map<String, dynamic> json) => WebPlayerShareEntityServiceEndpoint(
        serializedShareEntity: json["serializedShareEntity"],
    );

    Map<String, dynamic> toJson() => {
        "serializedShareEntity": serializedShareEntity,
    };
}

class RemoveFromWatchLaterCommand {
    String? clickTrackingParams;
    SubscribeCommandCommandMetadata? commandMetadata;
    RemoveFromWatchLaterCommandPlaylistEditEndpoint? playlistEditEndpoint;

    RemoveFromWatchLaterCommand({
        this.clickTrackingParams,
        this.commandMetadata,
        this.playlistEditEndpoint,
    });

    factory RemoveFromWatchLaterCommand.fromJson(Map<String, dynamic> json) => RemoveFromWatchLaterCommand(
        clickTrackingParams: json["clickTrackingParams"],
        commandMetadata: json["commandMetadata"] == null ? null : SubscribeCommandCommandMetadata.fromJson(json["commandMetadata"]),
        playlistEditEndpoint: json["playlistEditEndpoint"] == null ? null : RemoveFromWatchLaterCommandPlaylistEditEndpoint.fromJson(json["playlistEditEndpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "clickTrackingParams": clickTrackingParams,
        "commandMetadata": commandMetadata?.toJson(),
        "playlistEditEndpoint": playlistEditEndpoint?.toJson(),
    };
}

class RemoveFromWatchLaterCommandPlaylistEditEndpoint {
    String? playlistId;
    List<FluffyAction>? actions;

    RemoveFromWatchLaterCommandPlaylistEditEndpoint({
        this.playlistId,
        this.actions,
    });

    factory RemoveFromWatchLaterCommandPlaylistEditEndpoint.fromJson(Map<String, dynamic> json) => RemoveFromWatchLaterCommandPlaylistEditEndpoint(
        playlistId: json["playlistId"],
        actions: json["actions"] == null ? [] : List<FluffyAction>.from(json["actions"]!.map((x) => FluffyAction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "playlistId": playlistId,
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
    };
}

class FluffyAction {
    String? action;
    String? removedVideoId;

    FluffyAction({
        this.action,
        this.removedVideoId,
    });

    factory FluffyAction.fromJson(Map<String, dynamic> json) => FluffyAction(
        action: json["action"],
        removedVideoId: json["removedVideoId"],
    );

    Map<String, dynamic> toJson() => {
        "action": action,
        "removedVideoId": removedVideoId,
    };
}

class ResponseContext {
    String? visitorData;
    List<ServiceTrackingParam>? serviceTrackingParams;
    int? maxAgeSeconds;
    MainAppWebResponseContext? mainAppWebResponseContext;
    WebResponseContextExtensionData? webResponseContextExtensionData;

    ResponseContext({
        this.visitorData,
        this.serviceTrackingParams,
        this.maxAgeSeconds,
        this.mainAppWebResponseContext,
        this.webResponseContextExtensionData,
    });

    factory ResponseContext.fromJson(Map<String, dynamic> json) => ResponseContext(
        visitorData: json["visitorData"],
        serviceTrackingParams: json["serviceTrackingParams"] == null ? [] : List<ServiceTrackingParam>.from(json["serviceTrackingParams"]!.map((x) => ServiceTrackingParam.fromJson(x))),
        maxAgeSeconds: json["maxAgeSeconds"],
        mainAppWebResponseContext: json["mainAppWebResponseContext"] == null ? null : MainAppWebResponseContext.fromJson(json["mainAppWebResponseContext"]),
        webResponseContextExtensionData: json["webResponseContextExtensionData"] == null ? null : WebResponseContextExtensionData.fromJson(json["webResponseContextExtensionData"]),
    );

    Map<String, dynamic> toJson() => {
        "visitorData": visitorData,
        "serviceTrackingParams": serviceTrackingParams == null ? [] : List<dynamic>.from(serviceTrackingParams!.map((x) => x.toJson())),
        "maxAgeSeconds": maxAgeSeconds,
        "mainAppWebResponseContext": mainAppWebResponseContext?.toJson(),
        "webResponseContextExtensionData": webResponseContextExtensionData?.toJson(),
    };
}

class MainAppWebResponseContext {
    bool? loggedOut;
    String? trackingParam;

    MainAppWebResponseContext({
        this.loggedOut,
        this.trackingParam,
    });

    factory MainAppWebResponseContext.fromJson(Map<String, dynamic> json) => MainAppWebResponseContext(
        loggedOut: json["loggedOut"],
        trackingParam: json["trackingParam"],
    );

    Map<String, dynamic> toJson() => {
        "loggedOut": loggedOut,
        "trackingParam": trackingParam,
    };
}

class ServiceTrackingParam {
    String? service;
    List<Param>? params;

    ServiceTrackingParam({
        this.service,
        this.params,
    });

    factory ServiceTrackingParam.fromJson(Map<String, dynamic> json) => ServiceTrackingParam(
        service: json["service"],
        params: json["params"] == null ? [] : List<Param>.from(json["params"]!.map((x) => Param.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "service": service,
        "params": params == null ? [] : List<dynamic>.from(params!.map((x) => x.toJson())),
    };
}

class Param {
    String? key;
    String? value;

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

class WebResponseContextExtensionData {
    bool? hasDecorated;

    WebResponseContextExtensionData({
        this.hasDecorated,
    });

    factory WebResponseContextExtensionData.fromJson(Map<String, dynamic> json) => WebResponseContextExtensionData(
        hasDecorated: json["hasDecorated"],
    );

    Map<String, dynamic> toJson() => {
        "hasDecorated": hasDecorated,
    };
}

class Storyboards {
    PlayerStoryboardSpecRenderer? playerStoryboardSpecRenderer;

    Storyboards({
        this.playerStoryboardSpecRenderer,
    });

    factory Storyboards.fromJson(Map<String, dynamic> json) => Storyboards(
        playerStoryboardSpecRenderer: json["playerStoryboardSpecRenderer"] == null ? null : PlayerStoryboardSpecRenderer.fromJson(json["playerStoryboardSpecRenderer"]),
    );

    Map<String, dynamic> toJson() => {
        "playerStoryboardSpecRenderer": playerStoryboardSpecRenderer?.toJson(),
    };
}

class PlayerStoryboardSpecRenderer {
    String? spec;
    int? recommendedLevel;
    int? highResolutionRecommendedLevel;

    PlayerStoryboardSpecRenderer({
        this.spec,
        this.recommendedLevel,
        this.highResolutionRecommendedLevel,
    });

    factory PlayerStoryboardSpecRenderer.fromJson(Map<String, dynamic> json) => PlayerStoryboardSpecRenderer(
        spec: json["spec"],
        recommendedLevel: json["recommendedLevel"],
        highResolutionRecommendedLevel: json["highResolutionRecommendedLevel"],
    );

    Map<String, dynamic> toJson() => {
        "spec": spec,
        "recommendedLevel": recommendedLevel,
        "highResolutionRecommendedLevel": highResolutionRecommendedLevel,
    };
}

class StreamingData {
    String? expiresInSeconds;
    List<Format>? formats;
    List<AdaptiveFormat>? adaptiveFormats;

    StreamingData({
        this.expiresInSeconds,
        this.formats,
        this.adaptiveFormats,
    });

    factory StreamingData.fromJson(Map<String, dynamic> json) => StreamingData(
        expiresInSeconds: json["expiresInSeconds"],
        formats: json["formats"] == null ? [] : List<Format>.from(json["formats"]!.map((x) => Format.fromJson(x))),
        adaptiveFormats: json["adaptiveFormats"] == null ? [] : List<AdaptiveFormat>.from(json["adaptiveFormats"]!.map((x) => AdaptiveFormat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "expiresInSeconds": expiresInSeconds,
        "formats": formats == null ? [] : List<dynamic>.from(formats!.map((x) => x.toJson())),
        "adaptiveFormats": adaptiveFormats == null ? [] : List<dynamic>.from(adaptiveFormats!.map((x) => x.toJson())),
    };
}

class AdaptiveFormat {
    int? itag;
    String? url;
    String? mimeType;
    int? bitrate;
    int? width;
    int? height;
    Range? initRange;
    Range? indexRange;
    String? lastModified;
    String? contentLength;
    String? quality;
    int? fps;
    String? qualityLabel;
    ProjectionType? projectionType;
    int? averageBitrate;
    String? approxDurationMs;
    ColorInfo? colorInfo;
    bool? highReplication;
    String? audioQuality;
    String? audioSampleRate;
    int? audioChannels;
    double? loudnessDb;

    AdaptiveFormat({
        this.itag,
        this.url,
        this.mimeType,
        this.bitrate,
        this.width,
        this.height,
        this.initRange,
        this.indexRange,
        this.lastModified,
        this.contentLength,
        this.quality,
        this.fps,
        this.qualityLabel,
        this.projectionType,
        this.averageBitrate,
        this.approxDurationMs,
        this.colorInfo,
        this.highReplication,
        this.audioQuality,
        this.audioSampleRate,
        this.audioChannels,
        this.loudnessDb,
    });

    factory AdaptiveFormat.fromJson(Map<String, dynamic> json) => AdaptiveFormat(
        itag: json["itag"],
        url: json["url"],
        mimeType: json["mimeType"],
        bitrate: json["bitrate"],
        width: json["width"],
        height: json["height"],
        initRange: json["initRange"] == null ? null : Range.fromJson(json["initRange"]),
        indexRange: json["indexRange"] == null ? null : Range.fromJson(json["indexRange"]),
        lastModified: json["lastModified"],
        contentLength: json["contentLength"],
        quality: json["quality"],
        fps: json["fps"],
        qualityLabel: json["qualityLabel"],
        projectionType: projectionTypeValues.map[json["projectionType"]]!,
        averageBitrate: json["averageBitrate"],
        approxDurationMs: json["approxDurationMs"],
        colorInfo: json["colorInfo"] == null ? null : ColorInfo.fromJson(json["colorInfo"]),
        highReplication: json["highReplication"],
        audioQuality: json["audioQuality"],
        audioSampleRate: json["audioSampleRate"],
        audioChannels: json["audioChannels"],
        loudnessDb: json["loudnessDb"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "itag": itag,
        "url": url,
        "mimeType": mimeType,
        "bitrate": bitrate,
        "width": width,
        "height": height,
        "initRange": initRange?.toJson(),
        "indexRange": indexRange?.toJson(),
        "lastModified": lastModified,
        "contentLength": contentLength,
        "quality": quality,
        "fps": fps,
        "qualityLabel": qualityLabel,
        "projectionType": projectionTypeValues.reverse[projectionType],
        "averageBitrate": averageBitrate,
        "approxDurationMs": approxDurationMs,
        "colorInfo": colorInfo?.toJson(),
        "highReplication": highReplication,
        "audioQuality": audioQuality,
        "audioSampleRate": audioSampleRate,
        "audioChannels": audioChannels,
        "loudnessDb": loudnessDb,
    };
}

class ColorInfo {
    String? primaries;
    String? transferCharacteristics;
    String? matrixCoefficients;

    ColorInfo({
        this.primaries,
        this.transferCharacteristics,
        this.matrixCoefficients,
    });

    factory ColorInfo.fromJson(Map<String, dynamic> json) => ColorInfo(
        primaries: json["primaries"],
        transferCharacteristics: json["transferCharacteristics"],
        matrixCoefficients: json["matrixCoefficients"],
    );

    Map<String, dynamic> toJson() => {
        "primaries": primaries,
        "transferCharacteristics": transferCharacteristics,
        "matrixCoefficients": matrixCoefficients,
    };
}

class Range {
    String? start;
    String? end;

    Range({
        this.start,
        this.end,
    });

    factory Range.fromJson(Map<String, dynamic> json) => Range(
        start: json["start"],
        end: json["end"],
    );

    Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
    };
}

enum ProjectionType {
    RECTANGULAR
}

final projectionTypeValues = EnumValues({
    "RECTANGULAR": ProjectionType.RECTANGULAR
});

class Format {
    int? itag;
    String? url;
    String? mimeType;
    int? bitrate;
    int? width;
    int? height;
    String? lastModified;
    String? quality;
    int? fps;
    String? qualityLabel;
    ProjectionType? projectionType;
    String? audioQuality;
    String? approxDurationMs;
    String? audioSampleRate;
    int? audioChannels;

    Format({
        this.itag,
        this.url,
        this.mimeType,
        this.bitrate,
        this.width,
        this.height,
        this.lastModified,
        this.quality,
        this.fps,
        this.qualityLabel,
        this.projectionType,
        this.audioQuality,
        this.approxDurationMs,
        this.audioSampleRate,
        this.audioChannels,
    });

    factory Format.fromJson(Map<String, dynamic> json) => Format(
        itag: json["itag"],
        url: json["url"],
        mimeType: json["mimeType"],
        bitrate: json["bitrate"],
        width: json["width"],
        height: json["height"],
        lastModified: json["lastModified"],
        quality: json["quality"],
        fps: json["fps"],
        qualityLabel: json["qualityLabel"],
        projectionType: projectionTypeValues.map[json["projectionType"]]!,
        audioQuality: json["audioQuality"],
        approxDurationMs: json["approxDurationMs"],
        audioSampleRate: json["audioSampleRate"],
        audioChannels: json["audioChannels"],
    );

    Map<String, dynamic> toJson() => {
        "itag": itag,
        "url": url,
        "mimeType": mimeType,
        "bitrate": bitrate,
        "width": width,
        "height": height,
        "lastModified": lastModified,
        "quality": quality,
        "fps": fps,
        "qualityLabel": qualityLabel,
        "projectionType": projectionTypeValues.reverse[projectionType],
        "audioQuality": audioQuality,
        "approxDurationMs": approxDurationMs,
        "audioSampleRate": audioSampleRate,
        "audioChannels": audioChannels,
    };
}

class VideoDetails {
    String? videoId;
    String? title;
    String? lengthSeconds;
    List<String>? keywords;
    String? channelId;
    bool? isOwnerViewing;
    String? shortDescription;
    bool? isCrawlable;
    IconClass? thumbnail;
    bool? allowRatings;
    String? viewCount;
    String? author;
    bool? isPrivate;
    bool? isUnpluggedCorpus;
    bool? isLiveContent;

    VideoDetails({
        this.videoId,
        this.title,
        this.lengthSeconds,
        this.keywords,
        this.channelId,
        this.isOwnerViewing,
        this.shortDescription,
        this.isCrawlable,
        this.thumbnail,
        this.allowRatings,
        this.viewCount,
        this.author,
        this.isPrivate,
        this.isUnpluggedCorpus,
        this.isLiveContent,
    });

    factory VideoDetails.fromJson(Map<String, dynamic> json) => VideoDetails(
        videoId: json["videoId"],
        title: json["title"],
        lengthSeconds: json["lengthSeconds"],
        keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
        channelId: json["channelId"],
        isOwnerViewing: json["isOwnerViewing"],
        shortDescription: json["shortDescription"],
        isCrawlable: json["isCrawlable"],
        thumbnail: json["thumbnail"] == null ? null : IconClass.fromJson(json["thumbnail"]),
        allowRatings: json["allowRatings"],
        viewCount: json["viewCount"],
        author: json["author"],
        isPrivate: json["isPrivate"],
        isUnpluggedCorpus: json["isUnpluggedCorpus"],
        isLiveContent: json["isLiveContent"],
    );

    Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "title": title,
        "lengthSeconds": lengthSeconds,
        "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "channelId": channelId,
        "isOwnerViewing": isOwnerViewing,
        "shortDescription": shortDescription,
        "isCrawlable": isCrawlable,
        "thumbnail": thumbnail?.toJson(),
        "allowRatings": allowRatings,
        "viewCount": viewCount,
        "author": author,
        "isPrivate": isPrivate,
        "isUnpluggedCorpus": isUnpluggedCorpus,
        "isLiveContent": isLiveContent,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
