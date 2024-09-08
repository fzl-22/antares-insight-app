import 'package:flutter/material.dart';

/// Defined project-level color palletes
///
/// DO use colors defined in [Colours] instead of
/// built-in Flutter's [Color] or [Colors].
///
/// ```dart
/// Colours.blue50
/// Colours.error400
/// ```
class Colours {
  const Colours._();

  // General
  static const white = Color(0xFFFFFFFF);
  static const transparent = Color.fromARGB(0, 0, 0, 0);

  // App Tone
  static const appTone100 = Color(0xFFEAE2B7);
  static const appTone200 = Color(0xFFFCBF49);
  static const appTone300 = Color(0xFFF77F00);
  static const appTone400 = Color(0xFFD62828);
  static const appTone500 = Color(0xFF003049);

  // Warning
  static const warning50 = Color(0xFFFFF6E6);
  static const warning75 = Color(0xFFFFD997);
  static const warning100 = Color(0xFFFFC96C);
  static const warning200 = Color(0xFFFFB22C);
  static const warning300 = Color(0xFFFFA201);
  static const warning400 = Color(0xFFB37101);
  static const warning500 = Color(0xFF9C6301);

  // Danger
  static const danger50 = Color(0xFFF9E6E6);
  static const danger75 = Color(0xFFE69696);
  static const danger100 = Color(0xFFDC6B6B);
  static const danger200 = Color(0xFFCC2B2B);
  static const danger300 = Color(0xFFC20000);
  static const danger400 = Color(0xFF880000);
  static const danger500 = Color(0xFF760000);

  // Success
  static const success50 = Color(0xFFE6F6E6);
  static const success75 = Color(0xFF96DC96);
  static const success100 = Color(0xFF6BCD6B);
  static const success200 = Color(0xFF2BB82B);
  static const success300 = Color(0xFF00A900);
  static const success400 = Color(0xFF007600);
  static const success500 = Color(0xFF006700);

  // Neutral (Grey)
  static const neutral0 = Color(0xFFFAFAFA);
  static const neutral20 = Color(0xFFF6F6F6);
  static const neutral40 = Color(0xFFE3E3E3);
  static const neutral60 = Color(0xFFBBBBBB);
  static const neutral80 = Color(0xFFA3A3A3);
  static const neutral100 = Color(0xFF898989);
  static const neutral300 = Color(0xFF6E6E6E);
  static const neutral500 = Color(0xFF565656);
  static const neutral700 = Color(0xFF3C3C3C);
  static const neutral900 = Color(0xFF242424);
}
