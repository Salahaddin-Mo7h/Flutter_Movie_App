
import 'package:flutter/material.dart';
import 'package:movie_app/core/config/config.dart';
import 'package:movie_app/data/model/actor_images_model.dart';
import 'package:movie_app/presentation/controller/details_page_controller.dart';
import 'package:get/get.dart';

class ImageGridPage extends StatelessWidget {
  final List<ActorImagesModel>? images;
  const ImageGridPage({Key? key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl+images![index].filePath!),
                      )
                  )
              )
          );
        },
      ),
    );
  }
}
