import 'package:flutter/material.dart';
import 'package:tnpsc_g4/core/extensions/size_extensions.dart';
import 'package:tnpsc_g4/core/extensions/string_extensions.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/routes/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), ()=>AppRoutes.pushAndRemoveUntil(context, RouteNames.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Kalvipura".displayLarge(context),
            8.h,
            "TNPSC - General Tamil Practice".bodyLarge(context)
          ],
        )
      ),
    );
  }
} 