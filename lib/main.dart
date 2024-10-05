import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test/core/dependency_injection/dependency_injection.dart';
import 'package:test/core/local_storage/cache_service.dart';
import 'package:test/core/local_storage/local_storage.dart';
import 'package:test/core/routing/routing_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.injectDependencies();
  LocalStorage localStorage = LocalStorage();
  localStorage.init();
  CacheService.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: RoutingManager.pages,
      initialRoute: RouteName.splash,
    );
  }
}
