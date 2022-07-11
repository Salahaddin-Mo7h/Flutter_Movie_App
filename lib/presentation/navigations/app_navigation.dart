import 'package:get/get.dart';
import 'package:movie_app/presentation/bindings/details_page_binding.dart';
import 'package:movie_app/presentation/bindings/main_binding.dart';
import 'package:movie_app/presentation/bindings/splash_page_pinding.dart';
import 'package:movie_app/presentation/pages/app_pages/detail_page.dart';
import 'package:movie_app/presentation/pages/app_pages/splash_page.dart';

class AppRoutes{
  static const String home = '/homePage';
  static const String detailPage = '/detailPage';
  static const String splashPage = '/splashPage';
}

class AppPages{

  static final pages = [
    GetPage(name: AppRoutes.detailPage, page: () => const DetailPage(),bindings: [MainBinding(),DetailPageBinding()]),
    GetPage(name: AppRoutes.splashPage, page: () => const SplashPage(),bindings: [SplashPageBinding()]),
    //GetPage(name: AppRoutes.splashPage, page: () => SplashPage(),bindings: [SplashPageBinding()]),
  ];

}