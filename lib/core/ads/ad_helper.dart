import 'dart:io';

import 'ad_constants.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid ||
        Platform.isIOS) {
      return AdConstants.bannerAdUnitId;
    }

    throw UnsupportedError(
      'Unsupported platform',
    );
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid ||
        Platform.isIOS) {
      return AdConstants
          .interstitialAdUnitId;
    }

    throw UnsupportedError(
      'Unsupported platform',
    );
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid ||
        Platform.isIOS) {
      return AdConstants
          .rewardedAdUnitId;
    }

    throw UnsupportedError(
      'Unsupported platform',
    );
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid ||
        Platform.isIOS) {
      return AdConstants.appOpenAdUnitId;
    }

    throw UnsupportedError(
      'Unsupported platform',
    );
  }
}