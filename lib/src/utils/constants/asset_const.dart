class AssetConsts {
  AssetConsts._();

  static const String _imagePath = 'assets/images';
  static const String nikeLogoWhite = '$_imagePath/nike_w.png';
  static const String nikeLogoBlack = '$_imagePath/nike_b.png';
  static const String nikeAirJordanYellow = '$_imagePath/J_yellow.png';
  static const String nikeAirJordanCyan = '$_imagePath/J_cyan.png';
  static const String nikeAirJordanRed = '$_imagePath/J_red.png';
  static const String nikeAirJordanGreen = '$_imagePath/J_green.png';

  static const String nikeZoomLemonGreen = '$_imagePath/N_lemon_green.png';
  static const String nikeZoomViolet = '$_imagePath/N_violet.png';
  static const String nikeZoomBlack = '$_imagePath/N_black.png';
  static const String nikeZoomDeepGreen = '$_imagePath/N_deep_green.png';

  static const String nikeLogoDark = '$_imagePath/nike_logo_dark.png';
  static const String nikeLogoLight = '$_imagePath/nike_logo_light.png';

  static List<String> allAssets() {
    return <String>[
      nikeLogoWhite,
      nikeLogoBlack,
      nikeAirJordanYellow,
      nikeAirJordanCyan,
      nikeAirJordanRed,
      nikeAirJordanGreen,
      nikeZoomBlack,
      nikeZoomDeepGreen,
      nikeZoomLemonGreen,
      nikeZoomViolet,
    ];
  }
}
