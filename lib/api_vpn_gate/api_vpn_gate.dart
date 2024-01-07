import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';
import 'package:x_vpn/models/vpn_info.dart';
import 'package:http/http.dart' as http;

class ApiVpnGate {
  //all free available vpn servers
  static Future<List<VpnInfo>> retrieveAllAvailableFreeServers() async {
    final List<VpnInfo> vpnServersList = [];
    try {
      final http.Response response =
          await http.get(Uri.parse("http://www.vpngate.net/api/iphone/"));
      final String commaSeperatedValueString =
          response.body.split("#")[1].replaceAll("*", "");
      // the body of response comes in csv (comma seperated values), so i will use csv package to convert csv to dart data types
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(commaSeperatedValueString);
      final header = listData[0];
      for (var counter = 0; counter < listData.length - 1; counter++) {
        Map<String, dynamic> jsonData = {};
        for (var innerCounter = 0;
            innerCounter < listData.length - 1;
            innerCounter++) {
          jsonData.addAll({
            header[innerCounter].toString(): listData[counter][innerCounter]
          });
        }
        vpnServersList.add(VpnInfo.fromJson(jsonData));
      }
    } catch (ex) {
      Get.snackbar("Error Occured", ex.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent.withOpacity(0.8));
    }
    //make list arranged in random way
    vpnServersList.shuffle();
    //after i get all available ,then i will save them in locale storage
    if (vpnServersList.isNotEmpty) AppPrefrencese.allVpns = vpnServersList;

    return vpnServersList;
  }
}
