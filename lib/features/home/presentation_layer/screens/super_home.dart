import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/presentation_layer/screens/home.dart';

class SuperHome extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  SuperHome({super.key});

  List<Widget> screens = [
     HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGradient.first,
      body: screens.elementAt(homeController.index.value),
      bottomNavigationBar:
          //  Obx(() {
          // return
          Container(
        height: 84,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(-2, -3),
            blurRadius: 3,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.2),
          )
        ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: homeController.index.value,
    
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            // currentIndex: index,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/ant-design_home-filled.svg",
                  width: 27,
                  height: 27,
                ).onTap(() {
                  homeController.index.value = 0;
                }),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/carbon_explore.svg",
                  width: 27,
                  height: 27,
                ).onTap(
                  () {
                    // homeController.index.value = 1;
                  },
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/carbon_user-avatar.svg",
                  width: 27,
                  height: 27,
                ).onTap(() {
                  // homeController.index.value = 2;
                }),
              )
            ],
          ),
        ),
      ),
      // }),
    );
  }
}
