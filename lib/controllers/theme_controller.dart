import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';

class ThemeController {
  static ThemeMode _getCurrentThemeModeForGetXChangeThemeMode() =>
      AppPrefrencese.isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  //when i call this method from any place in application , themeMode of All Application will be changing
  static void changeAppTheme() {
    //first changing the Application Theme
    Get.changeThemeMode(_getCurrentThemeModeForGetXChangeThemeMode());
    //second update the Theme in Local storage with the new theme value
    AppPrefrencese.isDarkTheme = !AppPrefrencese.isDarkTheme;
  }
}
