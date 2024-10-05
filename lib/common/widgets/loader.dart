import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  const LoaderWidget({
    super.key,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
