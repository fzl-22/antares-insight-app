import 'package:antares_insight_app/core/common/widgets/clickable_text.dart';
import 'package:antares_insight_app/core/common/widgets/radial_gradient_background.dart';
import 'package:antares_insight_app/core/common/widgets/submit_button.dart';
import 'package:antares_insight_app/core/common/widgets/text_input_field.dart';
import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/media.dart';
import 'package:antares_insight_app/core/utils/core_utils.dart';
import 'package:antares_insight_app/core/utils/enums.dart';
import 'package:antares_insight_app/src/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:antares_insight_app/src/auth/presentation/views/register_screen.dart';
import 'package:antares_insight_app/src/auth/presentation/widgets/glass_card.dart';
import 'package:antares_insight_app/src/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const name = 'login';
  static const path = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    context.read<AuthBloc>().add(
          AuthEvent.loginUserEvent(
            email: email,
            password: password,
          ),
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RadialGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Media.antaresLogo,
                          height: 78,
                        ),
                        const SizedBox(height: 24),
                        GlassCard(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextInputField(
                                  controller: _emailController,
                                  label: 'Email',
                                  hintText: 'Masukkan alamat email',
                                  keyboardType: TextInputType.emailAddress,
                                  validator: Validators.required(
                                    'Alamat email wajib diisi',
                                  ),
                                  onEditingComplete: context.nextFocus,
                                ),
                                const SizedBox(height: 16),
                                TextInputField.password(
                                  controller: _passwordController,
                                  label: 'Kata Sandi',
                                  hintText: 'Masukkan kata sandi',
                                  validator: Validators.required(
                                    'Kata sandi wajib diisi',
                                  ),
                                  onEditingComplete: context.nextFocus,
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const GradientText('Lupa Password?'),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                BlocConsumer<AuthBloc, AuthState>(
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      userLoggedIn: (user) {
                                        final fullName =
                                            // ignore: lines_longer_than_80_chars
                                            '${user.firstName} ${user.lastName}';
                                        CoreUtils.showSnackBar(
                                          context: context,
                                          message: 'Selamat datang, $fullName!',
                                          type: SnackBarType.success,
                                        );
                                        context.goNamed(HomeScreen.name);
                                      },
                                      loginUserFailed: (message) {
                                        CoreUtils.showSnackBar(
                                          context: context,
                                          message: message,
                                          type: SnackBarType.error,
                                        );
                                      },
                                    );
                                  },
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      loggingInUser: () {
                                        return SubmitButton(
                                          isLoading: true,
                                          onPressed: _loginUser,
                                          text: 'Masuk',
                                        );
                                      },
                                      orElse: () {
                                        return SubmitButton(
                                          onPressed: _loginUser,
                                          text: 'Masuk',
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                SubmitButton.secondary(
                                  onPressed: () =>
                                      context.goNamed(RegisterScreen.name),
                                  text: 'Belum Punya Akun',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
