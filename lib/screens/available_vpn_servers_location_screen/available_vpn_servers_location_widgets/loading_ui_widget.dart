import 'package:flutter/material.dart';
import 'package:x_vpn/utilites/size_manager.dart';

class LoadingUiWidget extends StatelessWidget {
  const LoadingUiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),
          SizedBox(
            height: AppSizes.s12,
          ),
          Text(
            "Gathering Free VPN Locations",
            style: TextStyle(
                fontSize: AppSizes.s12,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
