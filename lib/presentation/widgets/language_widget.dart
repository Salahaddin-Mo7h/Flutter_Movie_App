import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/controller/main_page_controller.dart';

class LanguageWidget extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return
      Obx(()=>
          Container(
            width: 80,
            height: 40,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        height: 40,
                        width: 40,
                      ),
                      onTap:()=> (){},
                    ),
                  ),
                ],
            ),
          ));
  }
}
