import 'package:get/get_connect/http/src/request/request.dart';

class CommentModel {
  int id;
  int userId;
  String content;
  bool? prepareToReplay;
  List<String> replies;

  CommentModel({
    required this.id,
    required this.userId,
    required this.content,
    this.prepareToReplay = false,
  required  this.replies,
  });
  bool get wasReplaying => replies.isNotEmpty;
  void addReplay(String replay) => replies?.add(replay);

  void preparingToReplay({bool val = true}) => prepareToReplay = val;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        userId: json["user_id"],
        content: json["content"],
        replies: []
      );

  static List<CommentModel> fromJsonList(Map<String, dynamic> json) {
    List<CommentModel> list = [];
    json["comments"].forEach(
      (element) => list.add(
        CommentModel.fromJson(element),
      ),
    );
    return list;

  }
}
