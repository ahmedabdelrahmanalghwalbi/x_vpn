import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:x_vpn/models/vpn_configurations.dart';
import 'package:x_vpn/models/vpn_status.dart';

class VpnEngine {
  //native channel
  static const String eventChannelVpnStage = 'vpnStage';
  static const String eventChannelVpnStatus = 'vpnStatus';
  static const String methodChannelVpnControl = 'vpnControl';

  //vpn connection stage snapshot
  static Stream<String> snapshotVpnStage() =>
      const EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

  //vpn connection status snapshot
  static Stream<VpnStatus?> snapshotVpnStatus() =>
      const EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map((eventStatus) => VpnStatus.fromJson(jsonDecode(eventStatus)))
          .cast();

  static Future<void> startVpnNow(VpnConfiguration vpnConfiguration) async =>
      const MethodChannel(methodChannelVpnControl).invokeMethod("start", {
        "config": vpnConfiguration.config,
        "country": vpnConfiguration.countryName,
        "username": vpnConfiguration.username,
        "password": vpnConfiguration.password
      });

  static Future<void> stopVpnNow() async =>
      const MethodChannel(methodChannelVpnControl).invokeMethod("stop");

  static Future<void> killSwitchOpenNow() async =>
      const MethodChannel(methodChannelVpnControl).invokeMethod("kill_switch");

  static Future<void> refreshStageNow() async =>
      const MethodChannel(methodChannelVpnControl).invokeMethod("refresh");

  static Future<String?> getStageNow() async =>
      const MethodChannel(methodChannelVpnControl).invokeMethod("stage");

  static Future<bool> isConnectedNow() =>
      getStageNow().then((value) => value?.toLowerCase() == "connected");

  //stages of vpn connection
  static const String vpnConnectedNow = "connected";
  static const String vpnDisconnectedNow = "disconnected";
  static const String vpnWaitConnectionNow = "wait_connection";
  static const String vpnAuthenticatingNow = "authenticating";
  static const String vpnReconnectNow = "reconnect";
  static const String vpnNoConnectionNow = "no_connection";
  static const String vpnConnectingNow = "connecting";
  static const String vpnPrepareNow = "prepare";
  static const String vpnDeniedNow = "denied";
}
