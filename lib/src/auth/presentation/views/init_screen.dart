import 'package:antares_insight_app/core/common/views/splash_screen.dart';
import 'package:antares_insight_app/src/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:antares_insight_app/src/auth/presentation/views/login_screen.dart';
import 'package:antares_insight_app/src/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static const name = 'init';
  static const path = '/';

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  void _verifyUserAuthentication() {
    context.read<AuthBloc>().add(
          const AuthEvent.verifyUserAuthenticationEvent(),
        );
  }

  @override
  void initState() {
    _verifyUserAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          userAuthenticationVerified: (user) {
            context.goNamed(HomeScreen.name);
          },
          verifyUserAuthenticationFailed: (message) {
            context.goNamed(LoginScreen.name);
          },
        );
      },
      child: const SplashScreen(),
    );
  }
}
