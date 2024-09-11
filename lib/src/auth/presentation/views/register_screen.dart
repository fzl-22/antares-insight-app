import 'package:antares_insight_app/core/common/widgets/radial_gradient_background.dart';
import 'package:antares_insight_app/core/resources/media.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const name = 'register';
  static const path = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RadialGradientBackground(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              padding: const EdgeInsets.all(16),
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
