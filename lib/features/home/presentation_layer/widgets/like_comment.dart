import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeCommentWidget extends StatelessWidget {
  const LikeCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool>(
        initialValue: false,
        builder: (bool? value, toggle) {
          return IconButton(
            icon: Icon(
              Icons.thumb_up,
              color: value! ? Colors.blue : Colors.black,
            ),
            onPressed: () {
              toggle(!value);
            },
          );
        });
  }
}
