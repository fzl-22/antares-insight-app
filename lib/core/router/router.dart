import 'package:antares_insight_app/core/common/transitions/transitions.dart';
import 'package:antares_insight_app/core/injection/injection.dart';
import 'package:antares_insight_app/core/utils/logger.dart';
import 'package:antares_insight_app/src/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:antares_insight_app/src/auth/presentation/views/login_screen.dart';
import 'package:antares_insight_app/src/auth/presentation/views/register_screen.dart';
import 'package:antares_insight_app/src/dashboard/presentation/views/dashboard_screen.dart';
import 'package:antares_insight_app/src/device/presentation/views/device_screen.dart';
import 'package:antares_insight_app/src/home/presentation/views/home_screen.dart';
import 'package:antares_insight_app/src/service/presentation/views/service_screen.dart';
import 'package:antares_insight_app/src/setting/presentation/views/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'observer.router.dart';

class AppRouter {
  const AppRouter._();

  // Global keys for root navigator and navigators for different sections
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorDevice =
      GlobalKey<NavigatorState>(debugLabel: 'shellDevice');
  static final _rootNavigatorService =
      GlobalKey<NavigatorState>(debugLabel: 'shellService');
  static final _rootNavigatorSetting =
      GlobalKey<NavigatorState>(debugLabel: 'shellSetting');

  static final routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [RouterObserver()],
    initialLocation: RegisterScreen.path,
    routes: [
      GoRoute(
        path: RegisterScreen.path,
        name: RegisterScreen.name,
        pageBuilder: (context, state) {
          return SlideUpRouteTransition(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const RegisterScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        pageBuilder: (context, state) {
          return SlideUpRouteTransition(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const LoginScreen(),
            ),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: HomeScreen.path,
                name: HomeScreen.name,
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorDevice,
            routes: [
              GoRoute(
                path: DeviceScreen.path,
                name: DeviceScreen.name,
                builder: (context, state) {
                  return const DeviceScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorService,
            routes: [
              GoRoute(
                path: ServiceScreen.path,
                name: ServiceScreen.name,
                builder: (context, state) {
                  return const ServiceScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorSetting,
            routes: [
              GoRoute(
                path: SettingScreen.path,
                name: SettingScreen.name,
                builder: (context, state) {
                  return const SettingScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
