import 'package:get/get.dart';
import 'package:movie_app/data/datasource/local/app_local_datasource.dart';
import 'package:movie_app/data/datasource/remote/app_remote_datasource.dart';
import 'package:movie_app/data/repository/app_repository_impl.dart';
import 'package:movie_app/domain/repository/app_repository.dart';
import 'package:movie_app/domain/usecase/actor_details_usecase.dart';
import 'package:movie_app/domain/usecase/get_actor_images_usecase.dart';
import 'package:movie_app/domain/usecase/get_list_of_actors_usecase.dart';
import 'package:movie_app/presentation/controller/details_page_controller.dart';
import 'package:movie_app/presentation/controller/main_page_controller.dart';
import 'package:movie_app/presentation/controller/splash_page_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {

    Get.put<AppRemoteDataSource?>(AppRemoteDataSourceImpl());
    Get.put<AppLocalDataSource?>(AppLocalDataSourceImpl());
    Get.put<AppRepository?>(
        AppRepositoryImpl(
            remoteDataSource: Get.find(),
            localDataSource: Get.find()
        ));
    Get.lazyPut<GetListOfActorsUseCase>(() => GetListOfActorsUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.put<SplashPageController>(SplashPageController());
    Get.put<DetailsPageController>(DetailsPageController());
    Get.lazyPut<DetailsPageController>(() => DetailsPageController());
    Get.lazyPut<GetActorDetailsUseCase>(() => GetActorDetailsUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<GetActorImagesUseCase>(() => GetActorImagesUseCase(
        repository: Get.find()
    ));

  }
}