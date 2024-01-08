import 'package:get/get.dart';
import 'package:x_vpn/api_vpn_gate/api_vpn_gate.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';
import 'package:x_vpn/models/vpn_info.dart';

class VpnLocationController extends GetxController {
  List<VpnInfo> vpnFreeServersAvailableList = AppPrefrencese.allvpns;
  final RxBool isLoadingNewLocations = false.obs;

  Future<void> retrieveVpnInformation() async {
    isLoadingNewLocations.value = true;
    vpnFreeServersAvailableList.clear();
    vpnFreeServersAvailableList =
        await ApiVpnGate.retrieveAllAvailableFreeServers();
    isLoadingNewLocations.value = false;
  }
}
