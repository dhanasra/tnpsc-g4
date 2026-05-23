import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnpsc_g4/features/analytics/pages/analytics_page.dart';
import 'package:tnpsc_g4/features/previous_year_questions/bloc/previous_year_bloc.dart';
import 'package:tnpsc_g4/features/previous_year_questions/pages/previous_year_questions_page.dart';
import 'package:tnpsc_g4/features/quiz/pages/quiz_page.dart';
import 'package:tnpsc_g4/features/quiz/pages/quiz_result_page.dart';
import 'package:tnpsc_g4/features/random_questions/pages/random_questions_page.dart';

import '../../features/home/bloc/home_bloc.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/quiz/bloc/quiz_bloc.dart';
import '../../features/splash/pages/splash_page.dart';

import 'route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeBloc()..add(LoadHomeStats()),
            child: const HomePage(),
          ),
        );

      case RouteNames.previousYearQuestions:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                PreviousYearBloc()..add(FetchPreviousYearExams()),
            child: const PreviousYearQuestionsPage(),
          ),
        );

      case RouteNames.randomQuestions:
        return MaterialPageRoute(builder: (_) => const RandomQuestionsPage());

      case RouteNames.quiz:
        var args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => QuizBloc()
              ..add(
                StartQuiz(type: args["type"], paperCode: args["paperCode"]),
              ),
            child: QuizPage(
              quizType: args["type"],
              paperCode: args["paperCode"],
            ),
          ),
        );

      case RouteNames.quizResult:
        var args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: (args as BuildContext).read<QuizBloc>()..add(SaveSession()),
            child: const QuizResultPage(),
          ),
        );

      case RouteNames.analytics:
        return MaterialPageRoute(builder: (_) => const AnalyticsPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
