import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper.dart';

class InterstitialAdService {
  static InterstitialAd?
  _interstitialAd;

  static void load() {
    InterstitialAd.load(
      adUnitId:
          AdHelper.interstitialAdUnitId,

      request: const AdRequest(),

      adLoadCallback:
          InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              _interstitialAd = ad;
            },

            onAdFailedToLoad: (
              error,
            ) {},
          ),
    );
  }

  static void show() {
    if (_interstitialAd == null) {
      return;
    }

    _interstitialAd?.show();

    _interstitialAd = null;

    load();
  }
}