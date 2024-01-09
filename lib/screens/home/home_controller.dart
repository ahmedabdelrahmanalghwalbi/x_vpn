import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';
import 'package:x_vpn/models/vpn_configurations.dart';
import 'package:x_vpn/models/vpn_info.dart';
import 'package:x_vpn/vpn_engine/vpn_engine.dart';

class HomeController extends GetxController {
  final Rx<VpnInfo> vpnInfo = AppPrefrencese.vpn.obs;
  final Rx<String> vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  //method that toggle between connecting or disconnecting to vpn
  Future<void> connectToVpnNow() async {
    if (vpnInfo.value.base64OpenVPNConfigurationData?.isEmpty ?? false) {
      Get.snackbar(
          "Country / Location", "Please select country / location first .");
      return;
    }
    //disconnected Mood (User have to start Connecting)
    if (vpnConnectionState.value == VpnEngine.vpnDisconnectedNow) {
      final Uint8List dataConfigVpn = const Base64Decoder()
          .convert(vpnInfo.value.base64OpenVPNConfigurationData!);
      final String configuration = const Utf8Decoder().convert(dataConfigVpn);
      final VpnConfiguration vpnConfiguration = VpnConfiguration(
          username: "vpn",
          password: "vpn",
          config: configuration,
          countryName: vpnInfo.value.countryLongName!);
      await VpnEngine.startVpnNow(vpnConfiguration);
    } else {
      //connected Mood (User have to stop Connecting)
      await VpnEngine.stopVpnNow();
    }
  }

  //get Rounded Vpn Button Color depends on its status
  Color get getRoundedVpnButtonColor {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return Colors.redAccent;
      case VpnEngine.vpnConnectedNow:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }

  //get Rounded Vpn Button Status Text depends on its status
  String get getRoundedVpnButtonText {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return "Tap To Connect";
      case VpnEngine.vpnConnectedNow:
        return "Tap To Disconnect";
      case VpnEngine.vpnDeniedNow:
        return "denied";
      case VpnEngine.vpnPrepareNow:
        return "prepare";
      case VpnEngine.vpnConnectingNow:
        return "connecting";
      case VpnEngine.vpnNoConnectionNow:
        return "no_connection";
      case VpnEngine.vpnReconnectNow:
        return "reconnect";
      case VpnEngine.vpnAuthenticatingNow:
        return "authenticating";
      case VpnEngine.vpnWaitConnectionNow:
        return "wait_connection";
      default:
        return "other connection status  ........";
    }
  }
}
