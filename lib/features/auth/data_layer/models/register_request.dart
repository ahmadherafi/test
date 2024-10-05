import 'dart:io';

import 'package:dio/dio.dart';

class RegisterRequest {
  String name;
  String email;
  String password;
  File? avatar;
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });

  factory RegisterRequest.zero() => RegisterRequest(
        email: "",
        name: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "image": MultipartFile.fromFileSync(avatar!.path),
      };
}
