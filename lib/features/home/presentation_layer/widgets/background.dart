import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/const/constant.dart';

class BackgroundWidget extends StatelessWidget {
 final Widget child;
  const BackgroundWidget({super.key , required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      // backgroundColor: AppColor.backgroundColor,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: AppColor.backgroundGradient),
      ),
      child: child,
    );
  }
}