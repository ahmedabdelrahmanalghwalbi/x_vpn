import 'package:flutter/material.dart';

class AppSizes {
  static double getScreenWidth(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).width;
  static double getScreenHeight(BuildContext ctx) =>
      MediaQuery.sizeOf(ctx).height;
  static const double s12 = 12.0;
  static const double s26 = 26.0;
  static const double s30 = 36.0;
  static const double s36 = 36.0;
  static const double s60 = 60.0;
}
