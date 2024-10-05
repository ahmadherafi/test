import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/core/const/constant.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.5,
      height: 28.52,
      decoration: BoxDecoration(
        color: AppColor.tagColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.tag),
          const SizedBox(
            width: 5,
          ),
          TextWidget(
            "Meditation",
            color: AppColor.tagTextColor,
            size: 14,
          )
        ],
      ),
    );
  }
}
