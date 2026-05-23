import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper.dart';

class AppOpenAdService {
  static AppOpenAd? _appOpenAd;

  static void load() {
    AppOpenAd.load(
      adUnitId:
          AdHelper.appOpenAdUnitId,

      request: const AdRequest(),

      adLoadCallback:
          AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              _appOpenAd = ad;
            },

            onAdFailedToLoad: (
              error,
            ) {
              print(error);
            },
          ),
    );
  }

  static void show() {
    _appOpenAd?.show();
  }
}