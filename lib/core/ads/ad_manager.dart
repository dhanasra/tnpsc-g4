import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  AdManager._();

  static final AdManager instance =
      AdManager._();

  Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  void disposeBanner(
    BannerAd? ad,
  ) {
    ad?.dispose();
  }

  void disposeInterstitial(
    InterstitialAd? ad,
  ) {
    ad?.dispose();
  }

  void disposeRewarded(
    RewardedAd? ad,
  ) {
    ad?.dispose();
  }

  void disposeAppOpen(
    AppOpenAd? ad,
  ) {
    ad?.dispose();
  }
}