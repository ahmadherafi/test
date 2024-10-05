import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/core/const/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/user.dart';
import 'package:test/features/home/presentation_layer/widgets/background.dart';
import 'package:test/features/home/presentation_layer/widgets/circle_avatar.dart';
import 'package:test/features/home/presentation_layer/widgets/post.dart';

class HomeScreenMiddleware extends GetMiddleware {
  HomeController homeController = Get.find<HomeController>();

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    homeController.getPosts();
    homeController.getUsers();

    return super.onPageBuildStart(page);
  }
}

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return homeController.postsState.loading || homeController.userState.loading
          ? SizedBox(
              width: Get.width,
              height: Get.height,
              child: CircularProgressIndicator(
                color: AppColor.primeColor,
              ).center(),
            )
          : BackgroundWidget(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.notification).expanded(1),
                        SvgPicture.asset(AppImages.socially).expanded(4),
                        Container().expanded(1)
                      ],
                    ).paddingOnly(top: 20),
                    Container(
                      width: Get.width * .86,
                      height: 76,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        // color: AppColor.primeColor
                        gradient: LinearGradient(colors: AppColor.backgroundStoryGradient),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 9,
                            offset: const Offset(0, 2),
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(48),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.userState.result.length,
                          itemBuilder: (BuildContext context, index) {
                            return CircleAvatarWidget(
                              user: homeController.userState.result[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .93,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeController.postsState.result.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return PostWidget(
                              post: homeController.postsState.result[index],
                            );
                          }),
                    )
                  ],
                ).makeSafeArea(),
              ),
            );
    });
  }
}
