import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

typedef ShareInvoker = Future<ShareResult> Function(ShareParams params);

final stationShareServiceProvider = Provider<StationShareService>((ref) {
  return StationShareService(analytics: ref.read(productAnalyticsProvider));
});

class StationShareService {
  StationShareService({
    required ProductAnalytics analytics,
    ShareInvoker? share,
  }) : _analytics = analytics,
       _share = share ?? SharePlus.instance.share;

  final ProductAnalytics _analytics;
  final ShareInvoker _share;

  static Uri? buildShareUrl(RadioStation station) {
    final stationId = station.stationUuid.trim();
    if (!RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      caseSensitive: false,
    ).hasMatch(stationId)) {
      return null;
    }
    return Uri.https('victorcode1.github.io', '/flow-music/share', {
      'station': stationId,
    });
  }

  Future<ShareResult?> shareStation({
    required BuildContext originContext,
    required RadioStation station,
  }) async {
    final shareUrl = buildShareUrl(station);
    if (shareUrl == null) {
      _showUnavailable(originContext);
      return null;
    }

    try {
      final renderObject = originContext.findRenderObject();
      final origin = renderObject is RenderBox && renderObject.hasSize
          ? renderObject.localToGlobal(Offset.zero) & renderObject.size
          : null;
      final result = await _share(
        ShareParams(
          text: LocaleKeys.share_station_message.tr(
            args: [station.name, shareUrl.toString()],
          ),
          subject: LocaleKeys.share_station_subject.tr(args: [station.name]),
          sharePositionOrigin: origin,
        ),
      );
      await _analytics.track(
        'station_shared',
        properties: {
          'station_id': station.stationUuid,
          if (station.countryCode.isNotEmpty)
            'country_code': station.countryCode.toUpperCase(),
          'result': result.status.name,
        },
      );
      if (result.status == ShareResultStatus.unavailable &&
          originContext.mounted) {
        _showUnavailable(originContext);
      }
      return result;
    } catch (_) {
      if (originContext.mounted) _showUnavailable(originContext);
      return null;
    }
  }

  void _showUnavailable(BuildContext context) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(
      SnackBar(content: Text(LocaleKeys.share_unavailable.tr())),
    );
  }
}
