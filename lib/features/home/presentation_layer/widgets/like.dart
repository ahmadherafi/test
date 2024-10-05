import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/post.dart';

class LikeWidget extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  Post post;
  LikeWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool>(
        initialValue: false,
        builder: (bool? value, toggle) {
          return SvgPicture.asset(
            value! ? AppIcons.favoriteFill : AppIcons.favorite,
            width: 25,
            height: 25,
          ).onTap(() {
            toggle(!value);
            homeController.like(post.id);
          });

          // return SvgPicture.asset(AppIcons.favorite),
        });
  }
}
