import 'package:flutter/material.dart';
import 'package:x_vpn/utilites/size_manager.dart';

class CustomRoundedWidget extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final Widget iconFile;
  const CustomRoundedWidget(
      {required this.titleText,
      required this.subtitleText,
      required this.iconFile,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getScreenWidth(context) * .45,
      child: Column(
        children: [
          iconFile,
          const SizedBox(
            height: AppSizes.s12,
          ),
          Text(
            titleText,
            style: const TextStyle(
                fontSize: AppSizes.s12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: AppSizes.s12,
          ),
          Text(
            subtitleText,
            style: const TextStyle(
                fontSize: AppSizes.s12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
