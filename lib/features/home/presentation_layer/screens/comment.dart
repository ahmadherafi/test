import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/loader.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/comment.dart';
import 'package:test/features/home/presentation_layer/widgets/comment_widget.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});
  HomeController homeController = Get.find<HomeController>();
  TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return homeController.commentsState.loading
              ? LoaderWidget(
                  color: AppColor.backgroundColor,
                  width: 35,
                  height: 35,
                ).center()
              : Column(
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: homeController.commentsState.result.length,
                        itemBuilder: (context, index) {
                          return CommentWidget(commentModel: homeController.commentsState.result[index]);
                        },
                      ),
                    ).expanded(12),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextFieldWidget(
                        onChange: (value) {},
                        keyboardType: TextInputType.text,
                        hint: "Comment",
                        validate: (value) {
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          homeController.addComment(homeController.currentPost, value);
                          homeController.getComments(homeController.currentPost);
                        },
                      ),
                    ).expanded(2)
                  ],
                );
        }),
      ),
    ).makeSafeArea();
  }
}

