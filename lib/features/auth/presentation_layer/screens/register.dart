import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/button.dart';
import 'package:test/common/widgets/logo.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/core/utils/utils.dart';
import 'package:test/features/auth/buisness_logic_layer/auth_controller.dart';
import 'package:test/features/auth/presentation_layer/widgets/textfield.dart';

class RegisterScreen extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  RegisterScreen({super.key});

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
                  Obx(() {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: authController.registerRequest.value.avatar == null
                              ? const AssetImage('assets/images/photo_2024-10-05_19-32-21.jpg')
                              : FileImage(authController.registerRequest.value.avatar!),
                        ).onTap(() async {
                          authController.registerRequest.value.avatar = await Utils.pickImage();
                          authController.registerRequest.refresh();
                        }).center(),
                        const Icon(Icons.camera_alt),
                      ],
                    );
                  }),
                  const SizedBox(height: 40.0),
                  TextFieldWidget(
                      onChange: (value) {
                        authController.registerRequest.value.name = value;
                      },
                      keyboardType: TextInputType.text,
                      hint: "Full Name",
                      validate: (value) {
                        return null;
                      }),
                  const SizedBox(height: 12.0),
                  TextFieldWidget(
                      onChange: (value) {
                        authController.registerRequest.value.email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hint: "Email",
                      validate: (value) {
                        return null;
                      }),
                  const SizedBox(height: 12.0),
                  TextFieldWidget(
                      onChange: (value) {
                        authController.registerRequest.value.password = value;
                      },
                      keyboardType: TextInputType.text,
                      hint: "Password",
                      validate: (value) {
                        return null;
                      }),
                  const SizedBox(height: 12.0),
                  TextFieldWidget(
                      onChange: (value) {},
                      keyboardType: TextInputType.text,
                      hint: "Confirm Password",
                      validate: (value) {
                        return null;
                      }),
                  const SizedBox(height: 12.0),
                  Obx(() {
                    return ButtonWidget(
                        isLoading: authController.registerState.loading,
                        onTap: () {
                          authController.register(
                            onSuccess: (p0) {
                              RoutingManager.offAll(RouteName.superHome);
                            },
                            onError: (p0) {
                              Get.snackbar("", p0.toString());
                            },
                          );
                        },
                        title: "Register");
                  }),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      const Text(
                        'Log In.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ).onTap(() {
                        RoutingManager.offAll(RouteName.login);
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
