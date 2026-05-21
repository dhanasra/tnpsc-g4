import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/storage/hive_service.dart';
import '../../core/storage/storage_keys.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          const ThemeState(
            themeMode: ThemeMode.light,
          ),
        );

  Future<void> loadTheme() async {
    final isDark =
        HiveService.get<bool>(
          StorageKeys.isDarkMode,
        ) ??
        false;

    emit(
      ThemeState(
        themeMode:
            isDark
                ? ThemeMode.dark
                : ThemeMode.light,
      ),
    );
  }

  Future<void> toggleTheme() async {
    final isDark =
        state.themeMode == ThemeMode.dark;

    final newTheme =
        isDark
            ? ThemeMode.light
            : ThemeMode.dark;

    await HiveService.set(
      StorageKeys.isDarkMode,
      !isDark,
    );

    emit(
      ThemeState(
        themeMode: newTheme,
      ),
    );
  }
}