import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/core/routing/routing_manager.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.7), boxShadow: [
        BoxShadow(
          blurRadius: 9,
          offset: const Offset(0, 2),
          color: Colors.black.withOpacity(0.1),
        ),
      ]),
      child: SvgPicture.asset(AppIcons.back),
    ).onTap(() {
      log("GGGGGggg");
      RoutingManager.back();
    });
  }
}
