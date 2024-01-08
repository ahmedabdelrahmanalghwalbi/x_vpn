import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/controllers/vpn_location_controller.dart';
import 'package:x_vpn/screens/available_vpn_servers_location_screen/available_vpn_servers_location_widgets/loading_ui_widget.dart';
import 'package:x_vpn/screens/available_vpn_servers_location_screen/available_vpn_servers_location_widgets/no_vpn_servers_found_ui_widget.dart';
import 'package:x_vpn/screens/available_vpn_servers_location_screen/available_vpn_servers_location_widgets/vpn_available_servers_data.dart';

class AvailableVpnServersLocation extends StatelessWidget {
  AvailableVpnServersLocation({super.key});
  final VpnLocationController _vpnLocationController = VpnLocationController();

  @override
  Widget build(BuildContext context) {
    if (_vpnLocationController.vpnFreeServersAvailableList.isEmpty) {
      _vpnLocationController.retrieveVpnInformation();
    }
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text(
                "VPN LOCATIONS ${_vpnLocationController.vpnFreeServersAvailableList.length.toString()}"),
          ),
          body: _vpnLocationController.isLoadingNewLocations.value
              ? const LoadingUiWidget()
              : _vpnLocationController.vpnFreeServersAvailableList.isEmpty
                  ? const NoVpnServersFoundUiWidget()
                  : VpnAvailableServersData(controller: _vpnLocationController),
        ));
  }
}
