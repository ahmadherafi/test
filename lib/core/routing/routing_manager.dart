import 'package:get/get.dart';
import 'package:test/features/auth/presentation_layer/screens/login.dart';
import 'package:test/features/auth/presentation_layer/screens/register.dart';
import 'package:test/features/auth/presentation_layer/screens/splash.dart';
import 'package:test/features/home/presentation_layer/screens/home.dart';
import 'package:test/features/home/presentation_layer/screens/story.dart';
import 'package:test/features/home/presentation_layer/screens/super_home.dart';

class RouteName {
  static String splash = '/splash';
  static String login = '/login';
  static String register = '/register';
  static String superHome = "/super-home";
  static String story = "/story";
}

class RoutingManager {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RouteName.splash,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: RouteName.login,
      page: () =>  LoginScreen(),
    ),
    GetPage(
      name: RouteName.register,
      page: () =>  RegisterScreen(),
    ),
    GetPage(
      name: RouteName.superHome,
      page: () => SuperHome(),
      middlewares: [HomeScreenMiddleware()]
    ),
    GetPage(
      name: RouteName.story,
      page: () => StoryScreen(),
    ),
    
  ];

  static void to(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void off(String route) {
    Get.offNamed(route);
  }

  static void offAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  static void back() {
    Get.back();
  }
}
