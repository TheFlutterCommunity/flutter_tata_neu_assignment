import 'package:flutter/cupertino.dart';

class ResponsiveWidget {
  static BuildContext? _context;
  static double? width;
  static double? height;
  static double? paddingTop;
  static double? pixelRatio;
  static bool? isScreenSmall;
  static bool? isScreenMedium;
  static bool? isScreenLarge;

  static void init(BuildContext context) {
    _context = context;

    width = _getWidth();
    height = _getHeight();
    paddingTop = _getPaddingTop();

    pixelRatio = _getPixelRatio();

    isScreenSmall = _isScreenSmall();
    isScreenMedium = _isScreenMedium();
    isScreenLarge = _isScreenLarge();
  }

  static double _getHeight() => MediaQuery.of(_context!).size.height;

  static double _getPaddingTop() => MediaQuery.of(_context!).padding.top;

  static double _getWidth() => MediaQuery.of(_context!).size.width;

  static double _getPixelRatio() => MediaQuery.of(_context!).devicePixelRatio;

  static bool _isScreenLarge() => width! * pixelRatio! >= 1440;

  static bool _isScreenMedium() =>
      width! * pixelRatio! < 1440 && width! * pixelRatio! >= 1080;

  static bool _isScreenSmall() => width! * pixelRatio! <= 720;

  // Get device sizes in inches (Handle screen for below resolutions)
  // 5.0"
  // 5.5"
  // 6.0"
  // 6.8"
  // 7.0"
  // 10.0"

  // Margin

  static double splashTitlePaddingTop() {
    return isScreenLarge!
        ?  71
        : isScreenMedium!
        ? 41
        : 71;
  }

  static double appBarMarginTop() {
    return isScreenLarge!
        ? 40
        : isScreenMedium!
            ? 30
            : 30;
  }

  static double appBarHeight() {
    return isScreenLarge!
        ? 60
        : isScreenMedium!
            ? 56
            : 56;
  }

  static double logoContainerHeight() {
    return isScreenLarge!
        ? 42
        : isScreenMedium!
            ? 40
            : 38;
  }

  static double bellIconSpace() {
    return isScreenLarge!
        ? 20
        : isScreenMedium!
            ? 20
            : 20;
  }

  static double logoContainerMarginLeft() {
    return isScreenLarge!
        ? 20
        : isScreenMedium!
            ? 20
            : 16;
  }

  static double logoContainerMarginTop() {
    return isScreenLarge!
        ? 5
        : isScreenMedium!
            ? 5
            : 5;
  }

  static double logoContainerMarginBottom() {
    return isScreenLarge!
        ? 8
        : isScreenMedium!
            ? 8
            : 8;
  }

  static double payItemsSpace() {
    return isScreenLarge!
        ? 10
        : isScreenMedium!
            ? 10
            : 10;
  }

  static double searchBarHeight() {
    return isScreenLarge!
        ? 45
        : isScreenMedium!
            ? 45
            : 45;
  }

  static double searchBarWidth() {
    return isScreenLarge!
        ? 300
        : isScreenMedium!
            ? 300
            : 300;
  }

  static double searchIconSize() {
    return isScreenLarge!
        ? 18
        : isScreenMedium!
            ? 18
            : 18;
  }

  static double carouselCardHeight() {
    return isScreenLarge!
        ? 200
        : isScreenMedium!
            ? 200
            : 200;
  }

  static double neuCoinsCardHeight() {
    return isScreenLarge!
        ? 84
        : isScreenMedium!
            ? 80
            : 72;
  }
  static double exploreCardHeight() {
    return isScreenLarge!
        ? 90
        : isScreenMedium!
            ? 90
            : 90;
  }
}
