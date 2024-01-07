import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
import 'package:x_vpn/models/vpn_info.dart';
import 'package:x_vpn/utilites/string_manager.dart';

class AppPrefrencese {
  static late Box boxOfData;
  //intializing local database that i call it before runApp()
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox(StringManager.dataBox);
  }

  // <Theme Setters AND GETTERS>
  //setter for dark theme selection
  static set isDarkTheme(bool value) =>
      boxOfData.put(StringManager.isDarkTheme, value);
  //getter of dark theme selection (i will assign isDarkTheme to themeMode property inside MaterialAppWidget to controll the Application Theme)
  static bool get isDarkTheme =>
      boxOfData.get(StringManager.isDarkTheme) ?? false;
  // </Theme Setters AND GETTERS>

  // <Single VPN Setters AND GETTERS>
  //setter for dark theme selection
  static set vpn(VpnInfo vpnInfo) =>
      boxOfData.put(StringManager.vpn, jsonEncode(vpnInfo.toJson()));
  //getter of dark theme selection (i will assign isDarkTheme to themeMode property inside MaterialAppWidget to controll the Application Theme)
  static VpnInfo get vpn =>
      VpnInfo.fromJson(jsonDecode(boxOfData.get(StringManager.vpn) ?? "{}"));
  // </Single Setters AND GETTERS>

  // <All VPN Setters AND GETTERS>
  static set allVpns(List<VpnInfo> allvpns) => boxOfData.put(
      StringManager.allVpns,
      jsonEncode(allvpns.map((e) => e.toJson()).toList()));

  static List<VpnInfo> get allvpns {
    return ((jsonDecode(boxOfData.get(StringManager.allVpns) ?? []))
            as List<Map<String, dynamic>>)
        .map((e) => VpnInfo.fromJson(e))
        .toList();
  }
  // <All VPN Setters AND GETTERS>
}
