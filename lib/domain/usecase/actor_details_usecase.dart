import 'package:either_type/either_type.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/people_model.dart';
import 'package:movie_app/domain/repository/app_repository.dart';

class GetActorDetailsUseCase implements UseCase<ActorDetailsModel,Params>{

  final AppRepository? repository;

  GetActorDetailsUseCase({this.repository});

  @override
  Future<Either<Failure, ActorDetailsModel>> call(Params params) {
    return repository!.getActorInfo(params.index!);
  }
}