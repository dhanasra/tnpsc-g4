import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper.dart';

class BannerAdWidget
    extends StatefulWidget {
  const BannerAdWidget({
    super.key,
  });

  @override
  State<BannerAdWidget> createState() =>
      _BannerAdWidgetState();
}

class _BannerAdWidgetState
    extends State<BannerAdWidget> {
  BannerAd? _bannerAd;

  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.largeBanner,

      adUnitId:
          AdHelper.bannerAdUnitId,

      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },

        onAdFailedToLoad: (
          ad,
          error,
        ) {
          ad.dispose();

          debugPrint(
            'Banner Ad Failed: $error',
          );
        },
      ),

      request: const AdRequest(),
    );

    _bannerAd?.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded ||
        _bannerAd == null) {
      return const SizedBox(
        height: 0,
      );
    }

    return SizedBox(
      height: _bannerAd!.size.height
          .toDouble(),

      width: _bannerAd!.size.width
          .toDouble(),

      child: AdWidget(
        ad: _bannerAd!,
      ),
    );
  }
}