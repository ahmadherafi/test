import 'package:test/features/home/data_layer/models/user.dart';

class Story {
  int id;
  String image;
  int userId;
  User user;
  Story({
    required this.id,
    required this.image,
    required this.userId,
    required this.user
  });
    factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        image: json["image"],
        userId: json["user_id"],
        user: User.fromJson(json["user"])
        
      );

  static List<Story> fromJsonList(Map<String, dynamic> json) {
    List<Story> list = [];

    json["stories"].forEach(
      (element) => list.add(
        Story.fromJson(element),
      ),
    );
    return list;
  }
}
