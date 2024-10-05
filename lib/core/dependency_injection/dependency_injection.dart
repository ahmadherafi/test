import 'package:get/get.dart';
import 'package:test/features/auth/buisness_logic_layer/auth_controller.dart';
import 'package:test/features/home/business_logic_layer/home_controller.dart';

class DependencyInjection{

  static void injectDependencies(){
    Get.put(AuthController());
    Get.put(HomeController());

  }
}