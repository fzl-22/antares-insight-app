import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';

class RadialGradientBackground extends StatelessWidget {
  const RadialGradientBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuraBox(
      spots: [
        AuraSpot(
          color: Colours.appTone300,
          radius: 196,
          alignment: const Alignment(1, -0.25),
          blurRadius: 96,
        ),
        AuraSpot(
          color: Colours.success200,
          radius: 156,
          alignment: const Alignment(-0.8, 0.25),
          blurRadius: 128,
        ),
      ],
      child: child,
    );
  }
}
