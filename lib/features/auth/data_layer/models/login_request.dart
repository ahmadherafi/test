class LoginRequest {
  String email;
  String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
  factory LoginRequest.zero() => LoginRequest(
        email: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
