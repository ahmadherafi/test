import 'package:test/core/api/end_point.dart';
import 'package:test/core/network/http.dart';
import 'package:test/features/auth/data_layer/models/login_request.dart';
import 'package:test/features/auth/data_layer/models/login_response.dart';
import 'package:test/features/auth/data_layer/models/register_request.dart';

class AuthService {
  Future<void> register(RegisterRequest registerRequest) async {
    Request request = Request(
      EndPoint.register,
      RequestMethod.post,
      isFormData: true,
      body: registerRequest.toJson(),
    );
    Map<String , dynamic> response = await request.sendRequest();
  }
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    Request request = Request(
      EndPoint.login,
      RequestMethod.post,
      body: loginRequest.toJson(),
    );
    Map<String , dynamic> response = await request.sendRequest();
    return LoginResponse.fromJson(response);
  }
}
