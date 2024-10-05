import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:story/story.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/back.dart';
import 'package:test/common/widgets/loader.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/user.dart';
import 'package:test/features/home/presentation_layer/widgets/tag.dart';

class StoryScreen extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return homeController.userStories.loading
            ? LoaderWidget(
                color: AppColor.backgroundColor,
                width: 35,
                height: 35,
              ).center()
            : StoryPageView(
                onPageChanged: (p0) async {
                  if (homeController.userState.result.last.id == homeController.currentUserStory.id) {
                    RoutingManager.offAll(RouteName.superHome);
                  }
                  homeController.setCurrentUserStory(homeController.nextUserStory);
                  await homeController.getStories(homeController.currentUserStory.id);
                },
                indicatorPadding: const EdgeInsets.only(top: 5),
                backgroundColor: AppColor.backgroundGradient.first,
                itemBuilder: (context, pageIndex, storyIndex) {
                  return Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://ani.point-dev.net/storage/${homeController.userStories.result[storyIndex].image}"),
                    )),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: AppColor.appBarStory,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const BackWidget(),
                                      TextWidget(
                                        homeController.userStories.result[storyIndex].user.name,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        size: 20,
                                      ).paddingSymmetric(horizontal: 10),
                                      const TextWidget(
                                        "17m",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                  SvgPicture.asset(AppIcons.download)
                                ],
                              ).paddingSymmetric(vertical: 20, horizontal: 20),
                            ),
                            Container(
                              width: Get.width,
                              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                AppIcons.favoriteStory,
                                // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            )
                          ],
                        ),
                        const Positioned(
                          right: 100,
                          bottom: 100,
                          child: TagWidget(),
                        ),
                      ],
                    ),
                  );
                },
                storyLength: (pageIndex) {
                  return homeController.userStories.result.length;
                },
                pageLength: homeController.userState.result.length,
              );
      }),
    ).makeSafeArea();
  }
}
