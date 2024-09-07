import 'package:antares_insight_app/core/common/themes/theme.dart';
import 'package:antares_insight_app/core/router/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Antares Insight',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerConfig,
    );
  }
}
