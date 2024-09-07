import 'package:antares_insight_app/core/common/transitions/transitions.dart';
import 'package:antares_insight_app/core/injection/injection.dart';
import 'package:antares_insight_app/core/utils/logger.dart';
import 'package:antares_insight_app/src/home/presentation/views/home_screen.dart';
import 'package:antares_insight_app/src/users/presentation/bloc/users_bloc.dart';
import 'package:antares_insight_app/src/users/presentation/views/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'observer.router.dart';

class AppRouter {
  static final routerConfig = GoRouter(
    observers: [
      RouterObserver(),
    ],
    initialLocation: HomeScreen.path,
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        pageBuilder: (context, state) {
          return SlideUpRouteTransition(
            key: state.pageKey,
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: UsersScreen.path,
        name: UsersScreen.name,
        pageBuilder: (context, state) {
          return SlideRouteTransition(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => sl<UsersBloc>(),
              child: const UsersScreen(),
            ),
          );
        },
      ),
    ],
  );
}
