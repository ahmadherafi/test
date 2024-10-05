import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/button.dart';
import 'package:test/common/widgets/logo.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/auth/buisness_logic_layer/auth_controller.dart';
import 'package:test/features/auth/presentation_layer/widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  const LogoWidget(),
                  const SizedBox(height: 40.0),
                  TextFieldWidget(
                      onChange: (value) {
                        authController.loginRequest.email = value;
                      },
                      keyboardType: TextInputType.text,
                      hint: "Email",
                      validate: (value) {
                        return null;
                      }),
                  const SizedBox(height: 12.0),
                  TextFieldWidget(
                      onChange: (value) {
                        authController.loginRequest.password = value;
                      },
                      keyboardType: TextInputType.text,
                      hint: "Password",
                      validate: (value) {
                        return null;
                      }),
                  const SizedBox(height: 12.0),
                  Obx(() {
                    return ButtonWidget(
                        isLoading: authController.loginState.loading,
                        onTap: () {
                          authController.login(
                            onSuccess: (p0) {
                              RoutingManager.offAll(RouteName.superHome);
                            },
                            onError: (p0) {
                              Get.snackbar("", p0.toString());
                            },
                          );
                        },
                        title: "Login");
                  }),
                  const SizedBox(height: 12.0),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account? "),
                      const Text(
                        'Sign up.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).onTap(() {
                        RoutingManager.to(RouteName.register);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
