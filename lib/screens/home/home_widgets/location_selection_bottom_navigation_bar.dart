import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/screens/available_vpn_servers_location_screen/available_vpn_servers_location_screen.dart';
import 'package:x_vpn/utilites/color_manager.dart';
import 'package:x_vpn/utilites/size_manager.dart';
import 'package:x_vpn/utilites/string_manager.dart';

class LocationSelectionBottomNavigation extends StatelessWidget {
  const LocationSelectionBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Semantics(
      button: true,
      child: InkWell(
        onTap: () => Get.to(() => AvailableVpnServersLocationScreen()),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s12),
          color: ColorManager.mainColor,
          child: const Row(
            children: [
              Icon(
                CupertinoIcons.flag_circle,
                color: Colors.white,
                size: AppSizes.s36,
              ),
              SizedBox(
                width: AppSizes.s12,
              ),
              Text(
                StringManager.selectCountryRegoin,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.redAccent,
                  size: AppSizes.s26,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
