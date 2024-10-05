import 'dart:developer';

import 'package:get/get.dart';
import 'package:rx_future/rx_future.dart';
import 'package:test/core/local_storage/local_storage.dart';
import 'package:test/features/auth/data_layer/models/login_request.dart';
import 'package:test/features/auth/data_layer/models/login_response.dart';
import 'package:test/features/auth/data_layer/models/register_request.dart';
import 'package:test/features/auth/data_layer/source/auth_service.dart';

class AuthController extends GetxController {
  // instance//

  AuthService authService = AuthService();

  LocalStorage localStorage = LocalStorage();
// register
  Rx<RegisterRequest> registerRequest = RegisterRequest.zero().obs;

  RxFuture<void> registerState = RxFuture(null);

  Future<void> register({void Function(void)? onSuccess, void Function(Object)? onError}) async {
    registerState.observe(
      (value) async {
        authService.register(registerRequest.value);
      },
      onSuccess: (p0) async {
        loginRequest.email = registerRequest.value.email;
        loginRequest.password = registerRequest.value.password;
        await login();
        onSuccess?.call(p0);
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }

//login
  LoginRequest loginRequest = LoginRequest.zero();

  RxFuture<LoginResponse> loginState = RxFuture(LoginResponse.zero());

  Future<void> login({void Function(LoginResponse)? onSuccess, void Function(Object)? onError}) async {
    loginState.observe(
      (value) async {
        return authService.login(loginRequest);
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
        localStorage.saveToken(p0.token);
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }

  Future<void> checkToken({required void Function() onNotAuthorized, required void Function() onAuthorized}) async {
    String? token = localStorage.getToken();

    log(token.toString());
    if (token == null) {
      onNotAuthorized.call();
    } else {
      onAuthorized.call();
    }
  }
}
