import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static BuildContext? _context;
  static late double _height;
  static late double _width;
  static late double _heightPadding;
  static late double _widthPadding;

  static bool get isWeb =>
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS;

  static void init(BuildContext context) {
    _context = context;
    MediaQueryData mQueryData = MediaQuery.of(_context!);
    _height = mQueryData.size.height / 100.0;
    _width = mQueryData.size.width / 100.0;
    _heightPadding = _height -
        ((mQueryData.padding.top + mQueryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (mQueryData.padding.left + mQueryData.padding.right) / 100.0;
  }

  double rH(double v) {
    return _height * v;
  }

  double rW(double v) {
    return _width * v;
  }

  double rHP(double v) {
    return _heightPadding * v;
  }

  double rWP(double v) {
    return _widthPadding * v;
  }
}
