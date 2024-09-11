import 'package:antares_insight_app/core/common/widgets/radial_gradient_background.dart';
import 'package:antares_insight_app/core/common/widgets/submit_button.dart';
import 'package:antares_insight_app/core/common/widgets/text_input_field.dart';
import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/media.dart';
import 'package:antares_insight_app/core/utils/core_utils.dart';
import 'package:antares_insight_app/core/utils/enums.dart';
import 'package:antares_insight_app/src/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:antares_insight_app/src/auth/presentation/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const name = 'register';
  static const path = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    context.read<AuthBloc>().add(
          AuthEvent.registerUserEvent(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
          ),
        );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
                                  controller: _firstNameController,
                                  label: 'Nama Depan',
                                  hintText: 'Masukkan nama depan',
                                  validator: Validators.required(
                                    'Nama depan wajib diisi',
                                  ),
                                  onEditingComplete: context.nextFocus,
                                ),
                                const SizedBox(height: 16),
                                TextInputField(
                                  controller: _lastNameController,
                                  label: 'Nama Belakang',
                                  hintText: 'Masukkan nama belakang',
                                  validator: Validators.required(
                                    'Nama belakang wajib diisi',
                                  ),
                                  onEditingComplete: context.nextFocus,
                                ),
                                const SizedBox(height: 16),
                                TextInputField(
                                  controller: _emailController,
                                  label: 'Email',
                                  hintText: 'Masukkan alamat email',
                                  keyboardType: TextInputType.emailAddress,
                                  validator: Validators.compose([
                                    Validators.required(
                                      'Alamat email wajib diisi',
                                    ),
                                    Validators.email(
                                      'Format alamat email salah, '
                                      'periksa kembali email anda',
                                    ),
                                  ]),
                                  onEditingComplete: context.nextFocus,
                                ),
                                const SizedBox(height: 16),
                                TextInputField.password(
                                  controller: _passwordController,
                                  label: 'Kata Sandi',
                                  hintText: 'Masukkan kata sandi',
                                  validator: Validators.compose([
                                    Validators.required(
                                      'Kata sandi wajib diisi',
                                    ),
                                    Validators.minLength(
                                      8,
                                      'Kata sandi minimal 8 karakter',
                                    ),
                                    Validators.maxLength(
                                      16,
                                      'Kata sandi maksimal 8 karakter',
                                    ),
                                  ]),
                                  onEditingComplete: context.nextFocus,
                                ),
                                const SizedBox(height: 24),
                                BlocConsumer<AuthBloc, AuthState>(
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      registerUserFailed: (message) {
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
                                      registeringUser: () {
                                        return SubmitButton(
                                          isLoading: true,
                                          onPressed: _registerUser,
                                          child: const Text('Daftar'),
                                        );
                                      },
                                      orElse: () {
                                        return SubmitButton(
                                          onPressed: _registerUser,
                                          child: const Text('Daftar'),
                                        );
                                      },
                                    );
                                  },
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
