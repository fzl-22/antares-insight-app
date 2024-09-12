import 'package:antares_insight_app/core/common/themes/theme.dart';
import 'package:antares_insight_app/core/injection/injection.dart';
import 'package:antares_insight_app/core/router/router.dart';
import 'package:antares_insight_app/src/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AntaresInsightApp extends StatelessWidget {
  const AntaresInsightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: MaterialApp.router(
        title: 'Antares Insight',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routerConfig,
      ),
    );
  }
}
