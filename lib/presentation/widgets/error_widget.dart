import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class ErrorWidgett extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Get.height/7),
        child: Lottie.asset('assets/lottie/error.json',width: 150,height: 150));
  }
}
