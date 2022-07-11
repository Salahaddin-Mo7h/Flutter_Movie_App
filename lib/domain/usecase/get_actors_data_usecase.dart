import 'package:either_type/either_type.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/domain/repository/app_repository.dart';

class GetActorsDataUseCase implements UseCase<List<ActorDetailsModel>,Params>{

  final AppRepository? repository;

  GetActorsDataUseCase({this.repository});

  @override
  Future<Either<Failure, List<ActorDetailsModel>>> call(Params params) {
    return repository!.getActorsDetails(params.index!);
  }
}