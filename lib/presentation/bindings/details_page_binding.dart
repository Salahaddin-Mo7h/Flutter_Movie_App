import 'package:get/get.dart';
import 'package:movie_app/domain/usecase/actor_details_usecase.dart';
import 'package:movie_app/presentation/controller/details_page_controller.dart';

class DetailPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailsPageController>(() => DetailsPageController());
    Get.lazyPut<GetActorDetailsUseCase>(() => GetActorDetailsUseCase(
      repository: Get.find()
    ));

  }
}