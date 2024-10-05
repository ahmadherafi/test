import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/auth/buisness_logic_layer/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      authController.checkToken(
        onAuthorized: () {
          RoutingManager.offAll(RouteName.superHome);
        },
        onNotAuthorized: () {
          RoutingManager.offAll(RouteName.login);
        },
      );
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/photo_2024-10-05_19-42-20.jpg",
            height: Get.height * .5,
            width: Get.width * .5,
          ),
        ],
      ).center(),
    );
  }
}
