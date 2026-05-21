import 'package:flutter/material.dart';

import 'locale_constants.dart';

class AppLocalization {
  static const supportedLocales = [
    Locale(LocaleConstants.english),
    Locale(LocaleConstants.tamil),
  ];

  static const fallbackLocale =
      Locale(LocaleConstants.english);
}