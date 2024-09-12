import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:flutter/widgets.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    this.style = Typographies.semiBold12,
    super.key,
  });

  final String text;
  final TextStyle style;

  Gradient get _gradient => const LinearGradient(
        colors: [
          Colours.appTone200,
          Colours.appTone300,
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => _gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
