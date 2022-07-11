import 'package:get/get.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/model/people_model.dart';
import 'package:movie_app/domain/usecase/get_list_of_actors_usecase.dart';
import 'package:movie_app/presentation/helper/state_status.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainPageController extends  DisposableInterface{

  var getViewState = StateStatus.INITIAL.obs;
  RxBool isUs = false.obs;
  String lan='en';
  RxList<PeopleModel> peopleList = <PeopleModel>[].obs;
  RxInt pageNum = 1.obs;


  final PagingController<int, PeopleModel> pagingController =
  PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getListOfActors(pageKey);
    });
  }


   getListOfActors(int index) {
    getViewState.value = StateStatus.LOADING;
    GetListOfActorsUseCase getViewUseCase = Get.find();
    getViewUseCase.call(Params(index: index)).then((response) {
      if (response.isRight) {
        getViewState.value = StateStatus.SUCCESS;
        final nextPageKey = index + 1;
        pagingController.appendPage(peopleList.value, nextPageKey);
        peopleList.value = response.right;
      } else if (response.isLeft) {
        getViewState.value = StateStatus.ERROR;
      }
    });
  }

  getActorsData(int index) {
    getViewState.value = StateStatus.LOADING;
    GetListOfActorsUseCase getViewUseCase = Get.find();
    getViewUseCase.call(Params(index: index)).then((response) {
      if (response.isRight) {
        getViewState.value = StateStatus.SUCCESS;
        final nextPageKey = index + 1;
        pagingController.appendPage(peopleList.value, nextPageKey);
        peopleList.value = response.right;
      } else if (response.isLeft) {
        getViewState.value = StateStatus.ERROR;
      }
    });
  }
}