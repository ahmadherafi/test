import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/post.dart';

class SlideImages extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final Post post;
  final PageController pageController = PageController();
  SlideImages({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .86,
      height: Get.height * .45,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            onPageChanged: (value) {
              homeController.changeCurrentIndex(value);
            },
            itemCount: post.images.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.21),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://ani.point-dev.net/storage/${post.images[index].path}"),
                  ),
                ),
              );
            },
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(post.images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
                  height: 5.54,
                  width: 5.57,
                  decoration: BoxDecoration(
                    color: homeController.currentIndex.value == index ? Colors.white : Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
