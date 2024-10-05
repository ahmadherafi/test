import 'package:flutter/material.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/features/home/data_layer/models/post.dart';

class ContentPostWidget extends StatelessWidget {
  final Post post;
  const ContentPostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      post.content!,
      fontWeight: FontWeight.bold,
      size: 16,
    );
  }
}
