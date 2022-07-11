import 'package:get/get.dart';
import 'package:movie_app/presentation/controller/splash_page_controller.dart';

class SplashPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashPageController>(() => SplashPageController());
  }
}