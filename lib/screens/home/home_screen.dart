import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/controllers/theme_controller.dart';
import 'package:x_vpn/models/vpn_status.dart';
import 'package:x_vpn/screens/home/home_controller.dart';
import 'package:x_vpn/screens/home/home_widgets/custom_rounded_widget.dart';
import 'package:x_vpn/screens/home/home_widgets/location_selection_bottom_navigation_bar.dart';
import 'package:x_vpn/screens/home/home_widgets/vpn_rounded_button.dart';
import 'package:x_vpn/utilites/color_manager.dart';
import 'package:x_vpn/utilites/size_manager.dart';
import 'package:x_vpn/utilites/string_manager.dart';
import 'package:x_vpn/vpn_engine/vpn_engine.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VPNX"),
        backgroundColor: ColorManager.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.perm_device_info),
          onPressed: () {},
        ),
        actions: const [
          IconButton(
              onPressed: ThemeController.changeAppTheme,
              icon: Icon(Icons.brightness_2_outlined))
        ],
      ),
      bottomNavigationBar: const LocationSelectionBottomNavigation(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //location and ping
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRoundedWidget(
                    titleText: _homeController
                                .vpnInfo.value.countryLongName?.isEmpty ??
                            false
                        ? StringManager.location
                        : _homeController.vpnInfo.value.countryLongName ??
                            StringManager.location,
                    subtitleText: StringManager.free,
                    iconFile: CircleAvatar(
                      radius: AppSizes.s36,
                      backgroundColor: ColorManager.mainColor,
                      backgroundImage: _homeController
                                  .vpnInfo.value.countryLongName?.isEmpty ??
                              false
                          ? null
                          : const AssetImage(
                              "assets/images/flag.png"), //here i want to put the flag of each country
                      child: _homeController
                                  .vpnInfo.value.countryLongName?.isEmpty ??
                              false
                          ? const Icon(
                              Icons.flag_circle,
                              size: AppSizes.s30,
                              color: ColorManager.white,
                            )
                          : null,
                    )),
                CustomRoundedWidget(
                    titleText:
                        _homeController.vpnInfo.value.ping?.isEmpty ?? false
                            ? StringManager.ms60
                            : "${_homeController.vpnInfo.value.ping} ms",
                    subtitleText: StringManager.ping,
                    iconFile: const CircleAvatar(
                      radius: AppSizes.s36,
                      backgroundColor: ColorManager.mainColor,
                      child: Icon(
                        Icons.graphic_eq,
                        size: AppSizes.s30,
                        color: ColorManager.white,
                      ),
                    )),
              ],
            ),
          ),
          //start / end connection button
          VpnRoundedButton(),
          //upload and download
          StreamBuilder<VpnStatus?>(
              initialData: const VpnStatus(),
              stream: VpnEngine.snapshotVpnStatus(),
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRoundedWidget(
                        titleText: snapshot.data?.byteIn?.isNotEmpty ?? false
                            ? "${snapshot.data?.byteIn} + kbps"
                            : StringManager.kbps0,
                        subtitleText: StringManager.download,
                        iconFile: const CircleAvatar(
                          radius: AppSizes.s36,
                          backgroundColor: ColorManager.mainColor,
                          child: Icon(
                            Icons.arrow_circle_down,
                            size: AppSizes.s30,
                            color: ColorManager.white,
                          ),
                        )),
                    CustomRoundedWidget(
                        titleText: snapshot.data?.byteOut?.isNotEmpty ?? false
                            ? "${snapshot.data?.byteOut} + kbps"
                            : StringManager.kbps0,
                        subtitleText: StringManager.upload,
                        iconFile: const CircleAvatar(
                          radius: AppSizes.s36,
                          backgroundColor: ColorManager.mainColor,
                          child: Icon(
                            Icons.arrow_circle_up,
                            size: AppSizes.s30,
                            color: ColorManager.white,
                          ),
                        )),
                  ],
                );
              })
        ],
      ),
    );
  }
}
