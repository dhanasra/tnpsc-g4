import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/storage/hive_service.dart';
import '../../core/storage/storage_keys.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super(
          const LocaleState(
            locale: Locale('en'),
          ),
        );

  Future<void> loadLocale() async {
    final languageCode =
        HiveService.get<String>(
          StorageKeys.languageCode,
        ) ??
        'en';

    emit(
      LocaleState(
        locale: Locale(languageCode),
      ),
    );
  }

  Future<void> changeLocale(
    String languageCode,
  ) async {
    await HiveService.set(
      StorageKeys.languageCode,
      languageCode,
    );

    emit(
      LocaleState(
        locale: Locale(languageCode),
      ),
    );
  }
}