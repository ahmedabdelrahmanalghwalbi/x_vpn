import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';
import 'package:x_vpn/models/vpn_info.dart';
import 'package:x_vpn/screens/home/home_controller.dart';
import 'package:x_vpn/utilites/extensions.dart';
import 'package:x_vpn/utilites/size_manager.dart';
import 'package:x_vpn/vpn_engine/vpn_engine.dart';

class VpnLocationCardWidget extends StatelessWidget {
  final VpnInfo vpnInfo;
  const VpnLocationCardWidget({required this.vpnInfo, super.key});

  String formateSpeedBytes(int speedBytes, int decimals) {
    if (speedBytes <= 0) {
      return "0 B";
    }
    const List<String> suffixesTitle = ["Bps", "kbps", "Mbps", "Gbps", "Tbps"];
    final int speedTitleIndex = (log(speedBytes) / log(1024)).floor();
    return "${(speedBytes / pow(1024, speedTitleIndex)).toStringAsFixed(decimals)} ${suffixesTitle[speedTitleIndex]}";
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: AppSizes.getScreenWidth(context)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () async {
          homeController.vpnInfo.value = vpnInfo;
          AppPrefrencese.vpn = vpnInfo;
          Get.back();
          if (homeController.vpnConnectionState.value ==
              VpnEngine.vpnConnectedNow) {
            await VpnEngine.stopVpnNow();
            Future.delayed(const Duration(seconds: 3),
                () => homeController.connectToVpnNow());
          } else {
            await homeController.connectToVpnNow();
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.s12)),
          leading: Container(
            padding: const EdgeInsets.all(AppSizes.s12),
            child: Image.asset(
              "assets/flags/${vpnInfo.countryShortName?.toLowerCase()}.png",
              height: 40,
              width: AppSizes.getScreenWidth(context) * .15,
              fit: BoxFit.cover,
            ),
          ),
          //country Name
          title: Text(vpnInfo.countryLongName ?? ""),
          //vpn speed
          subtitle: Row(children: [
            const Icon(
              Icons.shutter_speed,
              color: Colors.redAccent,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(formateSpeedBytes(vpnInfo.speed ?? 0, 2))
          ]),
          //number of sessions
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              vpnInfo.vpnSessionsNum.toString(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).lightTextColor),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              CupertinoIcons.person_2_alt,
              color: Colors.redAccent,
            )
          ]),
        ),
      ),
    );
  }
}
