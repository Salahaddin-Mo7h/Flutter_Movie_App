import 'package:get/get.dart';
import 'package:movie_app/presentation/helper/state_status.dart';
class SplashPageController extends GetxController{

  var getViewState = StateStatus.INITIAL.obs;
  RxBool isUs = false.obs;

  load()async{
    getViewState.value = StateStatus.LOADING;
    await Future.delayed(const Duration(seconds: 2));
    getViewState.value = StateStatus.SUCCESS;
  }

}