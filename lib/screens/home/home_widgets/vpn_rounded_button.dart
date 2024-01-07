import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/screens/home/home_controller.dart';
import 'package:x_vpn/utilites/color_manager.dart';
import 'package:x_vpn/utilites/size_manager.dart';

class VpnRoundedButton extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  VpnRoundedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          button: true,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _homeController.getRoundedVpnButtonColor.withOpacity(.4)),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _homeController.getRoundedVpnButtonColor.withOpacity(.6),
                ),
                child: Container(
                  width: AppSizes.getScreenWidth(context) * .3,
                  height: AppSizes.getScreenHeight(context) * .3,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _homeController.getRoundedVpnButtonColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.power_settings_new,
                        size: 30,
                        color: ColorManager.white,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        _homeController.getRoundedVpnButtonText,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
