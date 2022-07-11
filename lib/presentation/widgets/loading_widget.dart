import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/bird.json',width: 110,height: 110);
  }
}
