import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/user.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final User user;
   CircleAvatarWidget({super.key, this.width, this.height, required this.user});
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 57.48,
      height: height ?? 57.48,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage("https://ani.point-dev.net/storage/${user.image}"),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
    ).onTap(() {
      RoutingManager.to(RouteName.story);
      homeController.setCurrentUserStory(user);
      homeController.getStories(user.id);
      
    });
  }
}
