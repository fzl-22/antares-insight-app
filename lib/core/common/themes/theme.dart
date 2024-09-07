import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colours.blue500,
      secondary: Colours.gold500,
      error: Colours.error500,
      surface: Colours.grey50,
    ),
    fontFamily: Fonts.poppins,
    useMaterial3: true,
  );
}
