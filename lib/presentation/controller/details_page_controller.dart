import 'package:get/get.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/actor_images_model.dart';
import 'package:movie_app/domain/usecase/actor_details_usecase.dart';
import 'package:movie_app/domain/usecase/get_actor_images_usecase.dart';
import 'package:movie_app/presentation/helper/state_status.dart';

class DetailsPageController extends GetxController{

  var getViewState = StateStatus.INITIAL.obs;
  RxBool isUs = false.obs;
  String lan='fa';
  var actorInfo = ActorDetailsModel().obs;
  var actorImages = <ActorImagesModel>[].obs;
  RxInt pageNum = 1.obs;

  // get actor info
  getActorInfo(int id) {
    getViewState.value = StateStatus.LOADING;
    GetActorDetailsUseCase getViewUseCase = Get.find();
    getViewUseCase.call(Params(index: id)).then((response) {
      if (response.isRight) {
        getViewState.value = StateStatus.SUCCESS;
        actorInfo.value = response.right;
      } else if (response.isLeft) {
        getViewState.value = StateStatus.ERROR;
      }
    });
  }

  //get actor images
  getActorImages(int id) {
    getViewState.value = StateStatus.LOADING;
    GetActorImagesUseCase getViewUseCase = Get.find();
    getViewUseCase.call(Params(index: id)).then((response) {
      if (response.isRight) {
        getViewState.value = StateStatus.SUCCESS;
        actorImages.value = response.right;
      } else if (response.isLeft) {
        getViewState.value = StateStatus.ERROR;
      }
    });
  }
}