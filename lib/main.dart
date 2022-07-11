import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/client.dart';
import 'package:movie_app/presentation/bindings/main_binding.dart';
import 'package:movie_app/presentation/navigations/app_navigation.dart';
import 'package:movie_app/presentation/pages/app_pages/splash_page.dart';
import 'package:movie_app/util/messages.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  MainBinding();
  runApp(MyApp());
  Client.init();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool isEn =false;
  @override
  Widget build(BuildContext context) {

    GetStorage box = GetStorage();

    if(box.hasData('isEn')) {
      isEn = box.read('isEn');
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Messages(),
      // locale: isEn?const Locale('en','US'): const Locale('ar','UAE'),
      locale:  const Locale('en','US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo-Black',
      ),
      initialRoute: AppRoutes.splashPage,
      home: ResponsiveView(),
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
    );
  }
}


class ResponsiveView extends GetResponsiveView{
  @override
  Widget builder() {
    return ResponsiveViewCases();
  }
}

class ResponsiveViewCases extends GetResponsiveView {
  ResponsiveViewCases() : super(alwaysUseBuilder: false);

  @override
  Widget phone() => SplashPage();

// @override
// Widget desktop() => Desktop(isTablet: screen.isTablet,);

}
