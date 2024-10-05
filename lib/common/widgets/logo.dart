import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/photo_2024-10-05_19-42-20.jpg",
      height: Get.height * .1,
      width: Get.width * .5,
    );
  }
}
