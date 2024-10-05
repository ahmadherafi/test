import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/post.dart';
import 'package:test/features/home/presentation_layer/screens/comment.dart';
import 'package:test/features/home/presentation_layer/widgets/like.dart';

class InteractionPostWidget extends StatelessWidget {
final  Post post;
   InteractionPostWidget({super.key , required this.post});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [

            LikeWidget(post: post),
            const TextWidget(
              "1345",
              size: 14,
            ).paddingSymmetric(horizontal: 10),
            SvgPicture.asset(AppIcons.comment).onTap((){
              Navigator.of(context).push(_createRoute() , );
              homeController.getComments(post.id);
              homeController.setCurrentPost(post.id);
            }),
            const TextWidget(
              "23",
              size: 14,
            ).paddingSymmetric(horizontal: 10),
          ],
        ),
        SvgPicture.asset(AppIcons.save),
      ],
    );
  }
   Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration:
          const Duration(milliseconds: 500), // Set the duration to 1 second
      pageBuilder: (context, animation, secondaryAnimation) => CommentScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start at bottom of the screen
        const end = Offset(0.0, 0.0); // End at the top (normal position)
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

}
