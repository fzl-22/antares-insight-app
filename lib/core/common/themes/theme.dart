import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colours.appTone300,
      error: Colours.danger300,
    ),
    fontFamily: Fonts.plusJakartaSans,
    useMaterial3: true,
  );
}
