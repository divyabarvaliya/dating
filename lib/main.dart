import 'package:dating/core/controller/main_controller.dart';
import 'package:dating/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dimens().init(context);
    return GetMaterialApp(
      initialBinding: AppBidding(),
      debugShowCheckedModeBanner: false,
      title: 'Dating App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}

class AppBidding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
