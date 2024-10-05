import 'package:test/features/home/data_layer/models/user.dart';

class Post {
  int id;
  int userId;
  String? content;
  String createdAt;
  List<Image> images;
  User user;
  Post({
    required this.id,
    required this.userId,
    this.content,
    required this.createdAt,
    required this.images,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        images: Image.fromJsonList(json),
        content: json["content"],
        user: User.fromJson(json["user"])
      );

  static List<Post> fromJsonList(Map<String, dynamic> json) {
    List<Post> list = [];

    json["posts"].forEach(
      (element) => list.add(
        Post.fromJson(element),
      ),
    );
    return list;
  }
}

class Image {
  int id;
  String path;
  Image({
    required this.id,
    required this.path,
  });
  factory Image.fromJson(Map<String, dynamic> json) => Image(id: json["id"], path: json["path"]);
  static List<Image> fromJsonList(Map<String, dynamic> json) {
    List<Image> list = [];

    json["images"].forEach(
      (element) => list.add(
        Image.fromJson(element),
      ),
    );
    return list;
  }
}
