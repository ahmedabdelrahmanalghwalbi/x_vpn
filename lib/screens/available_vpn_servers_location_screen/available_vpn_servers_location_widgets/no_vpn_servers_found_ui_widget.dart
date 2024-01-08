import 'package:flutter/material.dart';

class NoVpnServersFoundUiWidget extends StatelessWidget {
  const NoVpnServersFoundUiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No VPNs Found , Try Again ....",
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }
}
