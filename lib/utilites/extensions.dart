import 'package:flutter/material.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';

// i will use this extension to toggle between light mood colors and dark mood colors
extension AppTheme on ThemeData {
  Color get lightTextColor =>
      AppPrefrencese.isDarkTheme ? Colors.white70 : Colors.black54;
  Color get bottomNavigationColor =>
      AppPrefrencese.isDarkTheme ? Colors.white12 : Colors.redAccent;
}
