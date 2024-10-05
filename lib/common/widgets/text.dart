import 'package:flutter/material.dart';
import 'package:test/core/const/constant.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;

  const TextWidget(this.title, {super.key, this.color, this.size, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color??AppColor.textColor,
        fontSize: size,
        fontFamily: AppFont.glory,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
