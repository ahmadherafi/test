import 'package:flutter/material.dart';

extension CustomWidget on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expanded(int? flex) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget makeSafeArea() {
    return SafeArea(child: this,);
  }

  Widget onTap(void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  Widget onLongPress(void Function()? onPress) {
    return GestureDetector(
      onLongPress: onPress,
      child: Container(child: this),
    );
  }
}
