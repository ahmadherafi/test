class User {
  int id;
  String name;
  String email;
  String image;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });
  factory User.zero() => User(
        id: 0,
        name: "",
        email: "",
        image: "",
      );
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
      );

       static List<User> fromJsonList(Map<String, dynamic> json) {
    List<User> list = [];

    json["users"].forEach(
      (element) => list.add(
        User.fromJson(element),
      ),
    );
    return list;
  }
}
