
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/loader.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/core/const/constant.dart';


class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? color;
  final double? width;
  final Color? textColor;
  final bool? isLoading;
  final double? fontSize;
  final bool? showShadow;
  final double? height;
  final String? appFont;

  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.appFont,
    this.width,
    this.textColor,
    this.isLoading = false,
    this.fontSize,
    this.showShadow = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width ??  Get.width * .75 ,
      height: height ?? 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color ?? AppColor.primeColor,
        boxShadow: showShadow!
            ? [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.2),
                ),
              ]
            : null,
      ),
      child: !isLoading!
          ? TextWidget(
              title,
              // fontWeight: appFont,
              color: textColor ?? Colors.white,
              size: fontSize,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  size: fontSize,
                  title,
                  color: textColor ?? Colors.white,
                ),
                // .expanded(6),
                const SizedBox(
                  width: 10,
                ),
                // .expanded(1),
                const LoaderWidget(
                  color: Colors.white,
                  width: 20,
                  height: 20,
                ),
                // .expanded(4),
              ],
            ),
    ).onTap(onTap);
  }
}
