import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnpsc_g4/features/splash/pages/splash_page.dart';

import 'localization/locale_cubit.dart';
import 'localization/locale_state.dart';

import 'routes/route_generator.dart';
import 'routes/route_names.dart';
import 'theme/app_theme.dart';  
import 'theme/theme_cubit.dart';
import 'theme/theme_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        BlocProvider(create: (_) => LocaleCubit()..loadLocale()),
      ],

      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode,
                locale: localeState.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                initialRoute: RouteNames.splash,
                onGenerateRoute: RouteGenerator.generateRoute,
                builder: BotToastInit(),
                navigatorObservers: [
                  BotToastNavigatorObserver(),
                ],
                home: const SplashPage()
              );
            },
          );
        },
      ),
    );
  }
}
