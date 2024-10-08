import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarIcon extends StatelessWidget {
  const NavigationBarIcon(
    this.icon, {
    this.isActive = false,
    super.key,
  });

  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        isActive ? context.colorScheme.primary : Colours.neutral300,
        BlendMode.srcIn,
      ),
      width: 24,
    );
  }
}
