import 'package:flutter/material.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/core/const/constant.dart';
import 'package:test/features/home/data_layer/models/post.dart';
import 'package:test/features/home/presentation_layer/widgets/circle_avatar.dart';

class HeaderPostWidget extends StatelessWidget {
  final Post post;
  const HeaderPostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatarWidget(
          width: 23.17,
          height: 25,
          user: post.user,
        ).expanded(1),
        TextWidget(
          post.user.name,
          fontWeight: FontWeight.bold,
        ).expanded(4),
        TextWidget(
          "1w ago",
          color: AppColor.dividerColor.withOpacity(0.6),
        ).expanded(1)
      ],
    );
  }
}
