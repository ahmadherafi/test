import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/features/auth/presentation_layer/widgets/textfield.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';
import 'package:test/features/home/data_layer/models/comment.dart';
import 'package:test/features/home/presentation_layer/widgets/like_comment.dart';

class CommentWidget extends StatefulWidget {
  final CommentModel commentModel;
  const CommentWidget({
    super.key,
    required this.commentModel,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  HomeController homeController = Get.find<HomeController>();

  TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image
              ),
              const SizedBox(width: 10),

              // Comment content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and comment text
                  const TextWidget(
                    "ghina",
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 4.0),
                  TextWidget(
                    widget.commentModel.content,
                  ),
                  const SizedBox(height: 8.0),

                  // Reply and React icons
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.reply),
                        onPressed: () {
                          // Show reply TextField for this comment
                          setState(() {
                            widget.commentModel.preparingToReplay();
                          });
                          // widget.commentModel.preparingToReplay();
                        },
                      ),
                      const LikeCommentWidget(),
                    ],
                  ),

                  // Show reply if available
                  if (widget.commentModel.wasReplaying)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...widget.commentModel.replies.map(
                          (replay) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Reply: $replay',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                  // Show reply input field if replying
                  if (widget.commentModel.prepareToReplay!)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        height: 50,
                        width: Get.width * .5,
                        child: TextField(
                          controller: replyController,
                          decoration: const InputDecoration(
                            hintText: 'Write a reply...',
                          ),
                          onSubmitted: (text) {
                            // When the user submits the reply, save the reply and hide the input field
                            setState(() {
                              widget.commentModel.addReplay(text);
                              widget.commentModel.preparingToReplay(val: false);
                              replyController.clear();
                            });
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// class Comment {
//   final String des;
//   final String name;
//   bool prepareToReplay;
//   List<String> replies;
//   bool liked;
//   Comment({
//     required this.name,
//     required this.des,
//     required this.replies,
//     this.prepareToReplay = false,
//     this.liked = false,
//   });
//   // ~ getters
//   bool get wasReplaying => replies.isNotEmpty;

//   // ~ preparing
//   void addReplay(String replay) => replies.add(replay);

//   void preparingToReplay({bool val = true}) => prepareToReplay = val;

//   void toggleLike() => liked = !liked;
// }

// List<Comment> comments = [
//   Comment(
//     name: 'Person 1 ',
//     des:
//         'This is a comment from person  It can be longer to simulate a typical comment.',
//     replies: [],
//   ),
//   Comment(
//     name: 'Person 2 ',
//     des:
//         'This is a comment from person  It can be longer to simulate a typical comment.',
//     replies: [],
//   ),
//   Comment(
//     name: 'Person 3 ',
//     des:
//         'This is a comment from person  It can be longer to simulate a typical comment.',
//     replies: [],
//   ),
//   Comment(
//     name: 'Person 4 ',
//     des:
//         'This is a comment from person  It can be longer to simulate a typical comment.',
//     replies: [],
//   ),
//   Comment(
//     name: 'Person 5 ',
//     des:
//         'This is a comment from person  It can be longer to simulate a typical comment.',
//     replies: [],
//   ),
//   Comment(
//     name: 'Person 6 ',
//     des:
//         'This is a comment from person  It can be longer to simulate a typical comment.',
//     replies: [],
//   ),
// ];

