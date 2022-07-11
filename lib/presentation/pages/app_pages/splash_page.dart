import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/controller/splash_page_controller.dart';
import 'package:movie_app/presentation/helper/state_status.dart';
import 'package:movie_app/presentation/pages/app_pages/home_page.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.load();
    return Obx(() => controller.getViewState==StateStatus.LOADING?SafeArea(child: Scaffold(
      body:  Scaffold(
        body: Container(
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover
            )
          ),
      ),),
    )):Home());
  }
}