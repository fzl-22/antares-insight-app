import 'package:antares_insight_app/core/common/widgets/radial_gradient_background.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/media.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const name = 'splash';
  static const path = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return RadialGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: Text(
          'v1.0.0',
          style: Typographies.normal14.copyWith(
            color: Colours.neutral60,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                    child: Image.asset(
                      Media.antaresLogo,
                      height: 96,
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
