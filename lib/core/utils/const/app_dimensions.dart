import 'package:flutter/painting.dart';

abstract class AppDimensions {
  static const double desktopToolBarHeight = 94;
  static const double mobileToolBarHeight = 64;
  static const double desktopJobWidgetHeight = 500;
  static const double mobileJobWidgetHeight = 100;

  // Spacings
  static const EdgeInsets toolBarVerticalPadding =
      EdgeInsets.symmetric(vertical: 26);
  static const EdgeInsets mainHorizontalMargin =
      EdgeInsets.symmetric(horizontal: 32);
  static const EdgeInsets paddingTop12 = EdgeInsets.only(top: 12);
  static const EdgeInsets paddingBottom12 = EdgeInsets.only(bottom: 12);
  static const EdgeInsets paddingBottom16 = EdgeInsets.only(bottom: 16);
  static const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);
  static const EdgeInsets paddingBottom32 = EdgeInsets.only(bottom: 32);
  static const EdgeInsets paddingBottom40 = EdgeInsets.only(bottom: 40);
  static const EdgeInsets paddingBottom70 = EdgeInsets.only(bottom: 70);
}
