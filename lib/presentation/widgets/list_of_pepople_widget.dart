import 'package:flutter/material.dart';
import 'package:movie_app/presentation/controller/main_page_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/presentation/helper/state_status.dart';

class HomePage extends GetView<MainPageController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PaginationView Example',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() =>
      controller.getViewState == StateStatus.LOADING
          ? Text("wait...")
          : ListView.builder(
        //+1 for progressbar
        itemCount: controller.peopleList.value.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(controller.peopleList.value[index].name!);
        },
      )),
    );
  }
}



/*class HomePage extends GetView<MainPageController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        final loadingType = controller.loadingState.value.loadingType;

        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (controller.peopleList.isEmpty) {
          return Text("No Data");
        }
        return ListView.separated(
          controller: controller.scrollController,
          itemBuilder: (context, index) {
            final isLastItem = index == controller.peopleList.length;

            if (isLastItem && loadingType == LoadingType.loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (isLastItem && loadingType == LoadingType.error) {
              return Text(controller.loadingState.value.error.toString());
            } else if (isLastItem && loadingType == LoadingType.completed) {
              return Text(controller.loadingState.value.completed.toString());
            } else {
              return MovieItem(controller.peopleList[index]);
            }
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: loadingType == LoadingType.loading ||
              loadingType == LoadingType.error ||
              loadingType == LoadingType.completed
              ? controller.peopleList.length + 1
              : controller.peopleList.length,
        );
      }),
    );
  }
}*/

/*class HomePage extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("data")),
        body: PaginationView<PeopleModel>(
          header: Text('Header text'),
          footer: Text('Footer text'),
          preloadedItems: <PeopleModel>[
            PeopleModel(
              name: "sasasas"
            )
          ],
          paginationViewType: controller.paginationViewType!,
          itemBuilder: (BuildContext context, PeopleModel user, int index) =>
              (controller.paginationViewType == PaginationViewType.listView)
                  ? ListTile(
                      title: Text(user.name!),
                      subtitle: Text(user.id.toString()),
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    )
                  : GridTile(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(child: Icon(Icons.person)),
                          const SizedBox(height: 8),
                          Text(user.name!),
                          const SizedBox(height: 8),
                          Text(user.id.toString()),
                        ],
                      ),
                    ),
          pageFetch: pageFetch,
          pullToRefresh: true,
          onError: (dynamic error) => Center(
            child: Text('Some error occured'),
          ),
          onEmpty: Center(
            child: Text('Sorry! This is empty'),
          ),
          bottomLoader: Center(
            child: CircularProgressIndicator(),
          ),
          initialLoader: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }

  Future<List<PeopleModel>> pageFetch(int off) async {
    final List<PeopleModel> nextUsersList = List.generate(
      15,
      (int index) => PeopleModel(
        name: "samai"
      ),
    );
    await Future<List<PeopleModel>>.delayed(const Duration(seconds: 1));
    return  nextUsersList;
  }
}*/
