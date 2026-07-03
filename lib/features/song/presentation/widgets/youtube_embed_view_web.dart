import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

class YoutubeEmbedView extends StatefulWidget {
  const YoutubeEmbedView({super.key, required this.videoId});

  final String videoId;

  @override
  State<YoutubeEmbedView> createState() => _YoutubeEmbedViewState();
}

class _YoutubeEmbedViewState extends State<YoutubeEmbedView> {
  late final String _viewType;
  late final web.HTMLIFrameElement _iframe;

  @override
  void initState() {
    super.initState();
    _viewType = 'streambeat-youtube-${identityHashCode(this)}';
    _iframe = web.HTMLIFrameElement()
      ..id = _viewType
      ..src = _embedUrl(widget.videoId)
      ..allow =
          'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share; fullscreen'
      ..allowFullscreen = true
      ..referrerPolicy = 'strict-origin-when-cross-origin'
      ..style.border = '0'
      ..style.width = '100%'
      ..style.height = '100%';

    ui_web.platformViewRegistry.registerViewFactory(
      _viewType,
      (int viewId) => _iframe,
    );
  }

  @override
  void didUpdateWidget(covariant YoutubeEmbedView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _iframe.src = _embedUrl(widget.videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }

  String _embedUrl(String videoId) {
    final safeVideoId = Uri.encodeComponent(videoId);
    final params = <String, String>{
      'autoplay': '1',
      'controls': '1',
      'modestbranding': '1',
      'playsinline': '1',
      'rel': '0',
    };
    return Uri.https(
      'www.youtube-nocookie.com',
      '/embed/$safeVideoId',
      params,
    ).toString();
  }
}
