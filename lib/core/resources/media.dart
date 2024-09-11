/// Variable instances from assets directory
///
/// Defined asset's path with base prefix according to the
/// asset's type. DO NOT use literal string for asset's path
///
/// ```dart
/// Media.homeIcon;
/// Media.flutterLogo;
/// ```
class Media {
  const Media._();

  static const _baseIcon = 'assets/icons';
  static const _baseImage = 'assets/images';

  // Icons
  static const chatOutline = '$_baseIcon/chat_outline.svg';
  static const chatSolid = '$_baseIcon/chat_solid.svg';
  static const homeOutline = '$_baseIcon/home_outline.svg';
  static const homeSolid = '$_baseIcon/home_solid.svg';
  static const processorOutline = '$_baseIcon/processor_outline.svg';
  static const processorSolid = '$_baseIcon/processor_solid.svg';
  static const settingOutline = '$_baseIcon/setting_outline.svg';
  static const settingSolid = '$_baseIcon/setting_solid.svg';

  // Images
  static const dartLogo = '$_baseImage/dart_logo.svg';
  static const flutterLogo = '$_baseImage/flutter_logo.svg';
  static const antaresLogo = '$_baseImage/antares_logo.png';
}
