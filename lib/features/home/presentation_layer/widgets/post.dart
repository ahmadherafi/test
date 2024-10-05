import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/features/home/data_layer/models/post.dart';
import 'package:test/features/home/presentation_layer/widgets/content_post.dart';
import 'package:test/features/home/presentation_layer/widgets/grid_images.dart';
import 'package:test/features/home/presentation_layer/widgets/header_post.dart';
import 'package:test/features/home/presentation_layer/widgets/interaction_post.dart';
import 'package:test/features/home/presentation_layer/widgets/slide_images.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .93,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 3),
            blurRadius: 9,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HeaderPostWidget(
            post: post,
          ),
          post.images.isNotEmpty
              ? SlideImages(
                  post: post,
                )
              : Container(),
          // const GridImagesWidget(),
          post.content != null
              ? ContentPostWidget(
                  post: post,
                ).paddingSymmetric(horizontal: 20)
              : Container(),
          Divider(
            color: AppColor.dividerColor.withOpacity(0.6),
            // height: 1,
          ).paddingSymmetric(horizontal: 20),
          InteractionPostWidget(
            post: post,
          ).paddingSymmetric(horizontal: 20)
        ],
      ).paddingSymmetric(vertical: 10),
    );
  }
}
