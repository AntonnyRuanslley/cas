import '../utils/screen_size.dart';

import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0XFFB80099);
  static Color secondyColor = const Color(0xFFFFFFFF);
  static Color backgroundColor = const Color(0xFFF1F4F8);
  static Color alternate = const Color(0xFF56AB2F);

  static Color primaryText = const Color(0xFF000000);

  static TextStyle title1(BuildContext context) {
    return TextStyle(
      fontFamily: "OpenSans-Regular",
      fontSize: ScreenSizes.getScreenHeightSize(context) * 0.035,
      fontWeight: FontWeight.bold,
      color: primaryText,
    );
  }

  static TextStyle title2(BuildContext context) {
    return TextStyle(
      fontFamily: "OpenSans-Regular",
      fontSize: ScreenSizes.getScreenHeightSize(context) * 0.027,
      fontWeight: FontWeight.bold,
      color: primaryText,
    );
  }

  static TextStyle subtitle1(BuildContext context) {
    return TextStyle(
      fontFamily: "OpenSans-Regular",
      fontSize: ScreenSizes.getScreenHeightSize(context) * 0.025,
      fontWeight: FontWeight.normal,
      color: primaryText,
    );
  }

  static TextStyle subtitle2(BuildContext context) {
    return TextStyle(
      fontFamily: "OpenSans-Regular",
      fontSize: ScreenSizes.getScreenHeightSize(context) * 0.022,
      fontWeight: FontWeight.w400,
      color: primaryText,
    );
  }
}
