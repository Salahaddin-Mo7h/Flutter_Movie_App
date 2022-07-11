import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{
  RxBool isUs = false.obs;

  Locale? locale;
  changeLanguage(bool ln){
    isUs.value = ln;
    String lang;
    if(isUs.value) {
      lang = "English";
    } else {
      lang = "Arabic";
    }
  }
}