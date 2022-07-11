
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/config/config.dart';
import 'package:movie_app/presentation/controller/details_page_controller.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:movie_app/presentation/helper/state_status.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:readmore/readmore.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

class DetailPage extends GetView<DetailsPageController> {
  final int? id;
  const DetailPage({Key? key,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getActorInfo(id!);
    controller.getActorImages(id!);
    return Obx(() => controller.getViewState==StateStatus.LOADING?
    const Center(child: CircularProgressIndicator()):
    Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text("Personal Info", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1.2)),
        ), body:  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(controller.actorInfo.value.profilePath==null?
                      "https://cdn-icons-png.flaticon.com/512/2748/2748583.png":
                      imageUrl+controller.actorInfo.value.profilePath!),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(controller.actorInfo.value.name==null?
            "Actor Name":
            controller.actorInfo.value.name!,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.end,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 10),
            child: Text("Biography".toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
         Padding(
           padding: const EdgeInsets.only(left: 20.0,top: 10),
           child: ReadMoreText(
            controller.actorInfo.value.biography==null?"Biography":
            controller.actorInfo.value.biography!,
            trimLines: 3,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            lessStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueAccent),textAlign: TextAlign.start,
            moreStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
         ),
          // known for
          Padding(
            padding: const EdgeInsets.only(left: 0.0,top: 10),
            child: Center(
              child: TapToExpand(
                content: Column(
                  children: <Widget>[
                    Text(
                      controller.actorInfo.value.knownForDepartment==null?"None":controller.actorInfo.value.knownForDepartment!,
                      style: const TextStyle(color: Colors.white,  letterSpacing: 1.4,
                          fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                title: const Text(
                  'Known For',
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.end,
                ),
                onTapPadding: 10,
                closedHeight: 70,
                scrollable: true,
                borderRadius: 10,
                openedHeight: 120,
              ),
            ),
          ),
          // gender
          Padding(
            padding: const EdgeInsets.only(left: 0.0,top: 10),
            child: Center(
              child: TapToExpand(
                content: Column(
                  children: <Widget>[
                    Text(
                      controller.actorInfo.value.gender==1?"Female":"Male",
                      style: const TextStyle(color: Colors.white,  letterSpacing: 1.4,
                          fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                title: const Text(
                  'Gender',
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.end,
                ),
                onTapPadding: 10,
                closedHeight: 70,
                scrollable: true,
                borderRadius: 10,
                openedHeight: 120,
              ),
            ),
          ),
          // birthday
          Padding(
            padding: const EdgeInsets.only(left: 0.0,top: 10),
            child: Center(
              child: TapToExpand(
                content: Column(
                  children: <Widget>[
                    Text(
                      controller.actorInfo.value.birthday!,
                      style: const TextStyle(color: Colors.white,  letterSpacing: 1.4,
                          fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                title: const Text(
                  'Birthday',
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.end,
                ),
                onTapPadding: 10,
                closedHeight: 70,
                scrollable: true,
                borderRadius: 10,
                openedHeight: 120,
              ),
            ),
          ),
          // place of birthday
          Padding(
            padding: const EdgeInsets.only(left: 0.0,top: 10),
            child: Center(
              child: TapToExpand(
                content: Column(
                  children: <Widget>[
                    Text(
                      controller.actorInfo.value.placeOfBirth==null?
                      "1970-12-12":controller.actorInfo.value.placeOfBirth!,
                      style: const TextStyle(color: Colors.white,  letterSpacing: 1.4,
                          fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                title: const Text(
                  'Place Of Birthday',
                  style: TextStyle(
                    letterSpacing: 1.4,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.end,
                ),
                onTapPadding: 10,
                closedHeight: 70,
                scrollable: true,
                borderRadius: 10,
                openedHeight: 120,
              ),
            ),
          ),
          // actor images
          Padding(
            padding: const EdgeInsets.only(left: 0.0,top: 10),
            child: TapToExpand(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: SizedBox(
                            height: 600.0,
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemCount: controller.actorImages.value.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                   Get.to(()=> Scaffold(
                                     appBar: AppBar(
                                       backgroundColor: Colors.black,
                                       actions:  [
                                         InkWell(
                                           onTap: () async {
                                             try {
                                               var imageId = await ImageDownloader.downloadImage(imageUrl+controller.actorImages.value[index].filePath!);
                                               var path = await ImageDownloader.findPath(imageId!);
                                               await ImageDownloader.open(path!);
                                               // Saved with this method.
                                             } on PlatformException catch (error) {
                                               print(error);
                                             }
                                           },
                                           child: const Padding(
                                             padding: EdgeInsets.all(8.0),
                                             child: Icon(Icons.download,color: Colors.grey,size: 30,),
                                           ),
                                         )
                                       ],
                                     ),
                                     backgroundColor: Colors.black,
                                     body: SizedBox(
                                       width: controller.actorImages.value[index].width!.toDouble(),
                                       height: controller.actorImages.value[index].height!.toDouble(),
                                       child: InstaImageViewer(
                                         child: Image(
                                           image: Image.network(imageUrl+controller.actorImages.value[index].filePath!).image,
                                         ),
                                       ),
                                     ),
                                   ));
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(imageUrl+controller.actorImages.value[index].filePath!,
                                            fit: BoxFit.fill),
                                      )
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                  title: const Text(
                    'Images',
                    style: TextStyle(
                      letterSpacing: 1.4,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onTapPadding: 10,
                  closedHeight: 90,
                  scrollable: false,
                  borderRadius: 10,
                  openedHeight: 700,
                ),
            ),
        ],
      ),)

    ));
  }
}
