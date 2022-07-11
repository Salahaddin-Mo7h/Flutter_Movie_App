
import 'package:either_type/either_type.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/actor_images_model.dart';
import 'package:movie_app/data/model/people_model.dart';
import 'package:movie_app/domain/repository/app_repository.dart';

class GetActorImagesUseCase implements UseCase<List<ActorImagesModel>,Params>{

  final AppRepository? repository;

  GetActorImagesUseCase({this.repository});

  @override
  Future<Either<Failure, List<ActorImagesModel>>> call(Params params) {
    return repository!.getActorImages(params.index!);
  }
}