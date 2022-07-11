import 'package:either_type/either_type.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/model/people_model.dart';
import 'package:movie_app/domain/repository/app_repository.dart';

class GetListOfActorsUseCase implements UseCase<List<PeopleModel>,Params>{

  final AppRepository? repository;

  GetListOfActorsUseCase({this.repository});

  @override
  Future<Either<Failure, List<PeopleModel>>> call(Params params) {
    return repository!.getListOfPeople(params.index!);
  }
}