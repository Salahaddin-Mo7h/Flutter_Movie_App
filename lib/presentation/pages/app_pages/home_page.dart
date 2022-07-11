import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/model/people_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/domain/usecase/actor_details_usecase.dart';
import 'package:movie_app/domain/usecase/get_actor_images_usecase.dart';
import 'package:movie_app/presentation/controller/details_page_controller.dart';
import 'package:movie_app/presentation/controller/main_page_controller.dart';
import 'package:movie_app/presentation/pages/app_pages/detail_page.dart';
import 'package:movie_app/presentation/widgets/app_bar_widget.dart';
import 'package:movie_app/presentation/widgets/people_widget.dart';
import 'package:movie_app/util/dialog_util.dart';

class Home extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    GetActorDetailsUseCase detailsUseCase = Get.find();
    DetailsPageController pageController = Get.find();
    GetActorDetailsUseCase useCase = Get.find();
    GetActorImagesUseCase actorImagesUseCase = Get.find();
    return WillPopScope(
      onWillPop: () async {
       await _showMyDialog(context);
       return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const DiscoverAppBarWidget(),
          backgroundColor: Colors.grey.withOpacity(0.3),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => _showMyDialog(context),
            )
        ),
        body: PagedListView<int, PeopleModel>(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<PeopleModel>(
            itemBuilder: (context, item, index){
              //print("items====================="+controller.peopleList.value[index].name!);
              return InkWell(
                onTap: (){
                  Get.to(()=> DetailPage(id: item.id,));
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 5.0,
                    left: 0.0,
                  ),
                  height: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: LargeImageListRowThumbnailImageWidget(
                          list: item,
                          loadingIndicatorColor: Colors.indigo,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: LargeImageListRowDetailsWidget(
                          model: controller.getActorsData(index),
                          list: item,
                        ),
                      ),
                    ],
                  ),
                ),
              );
        }
          ),
        ),
      ),
    );
  }
}

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    required this.character,
    Key? key,
  }) : super(key: key);

  final PeopleModel character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          character.profilePath!,
        ),
        radius: 40.0,
      ),
      contentPadding: EdgeInsets.all(0.0),
      title: Text(
        character.name!,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w900,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        character.gender.toString(),
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.0,
        color: Colors.grey,
      ));
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit App'),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              Text('Would you like to exit app?'),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Exit'),
            onPressed: () {
              print('Confirmed');
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}