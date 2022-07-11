import 'package:either_type/either_type.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/actor_images_model.dart';
import 'package:movie_app/data/model/profile_images_model.dart';
import 'package:movie_app/data/model/people_model.dart';
abstract class AppRepository{

  Future<Either<Failure,List<PeopleModel>>> getListOfPeople(int page);
  Future<Either<Failure,ActorDetailsModel>> getActorInfo(int? id);
  Future<Either<Failure,List<ActorImagesModel>>> getActorImages(int? id);
  Future<Either<Failure,List<ActorDetailsModel>>> getActorsDetails(int page);

}