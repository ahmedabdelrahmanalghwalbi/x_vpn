import 'package:flutter/material.dart';
import 'package:x_vpn/controllers/vpn_location_controller.dart';

class VpnAvailableServersData extends StatelessWidget {
  final VpnLocationController _vpnLocationController;
  const VpnAvailableServersData(
      {super.key, required VpnLocationController controller})
      : _vpnLocationController = controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _vpnLocationController.vpnFreeServersAvailableList.length,
        padding: const EdgeInsets.all(3),
        itemBuilder: (context, index) {});
  }
}
