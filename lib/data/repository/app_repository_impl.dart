import 'dart:convert';

import 'package:either_type/either_type.dart';
import 'package:movie_app/core/config/config.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/data/client.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:movie_app/data/datasource/local/app_local_datasource.dart';
import 'package:movie_app/data/datasource/remote/app_remote_datasource.dart';
import 'package:movie_app/data/model/actor_details_model.dart';
import 'package:movie_app/data/model/actor_images_model.dart';
import 'package:movie_app/data/model/profile_images_model.dart';
import 'package:movie_app/data/model/people_model.dart';
import 'package:movie_app/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository{

   final AppRemoteDataSource? remoteDataSource;
   final AppLocalDataSource? localDataSource;

  AppRepositoryImpl({this.remoteDataSource,this.localDataSource});


  @override
  Future<Either<Failure, List<PeopleModel>>> getListOfPeople(int page) async{
    try{
      final response = await Client.dio.get("/person/popular?api_key=$apiKey&language=en-US&page=$page",
          options:
          buildCacheOptions(const Duration(hours: 5)));
      final List jsonResponse = jsonDecode(jsonEncode(response.data))['results'];
      //print(jsonResponse);
      List<PeopleModel> responses = jsonResponse.map((f) => PeopleModel.fromJson(f)).toList();
      return Right(responses);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, ActorDetailsModel>> getActorInfo(int? id) async {
    try{
      final response = await Client.dio.get("/person/$id?api_key=$apiKey", options:
      buildCacheOptions(const Duration(hours: 5)));
      final jsonResponse = jsonDecode(jsonEncode(response.data));
      //print(jsonResponse);
      ActorDetailsModel responses = ActorDetailsModel.fromJson(jsonResponse);
      return Right(responses);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, List<ActorImagesModel>>> getActorImages(int? id) async {
    try{
      final response = await Client.dio.get("/person/$id/images?api_key=$apiKey",options:
      buildCacheOptions(const Duration(hours: 5)));
      final List jsonResponse = jsonDecode(jsonEncode(response.data))['profiles'];
      print(jsonResponse);
      List<ActorImagesModel> responses = jsonResponse.map((f) => ActorImagesModel.fromJson(f)).toList();
      return Right(responses);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, List<ActorDetailsModel>>> getActorsDetails(int page) async {
    try{
      final response = await Client.dio.get("/person/popular?api_key=$apiKey&language=en-US&page=$page",options:
      buildCacheOptions(const Duration(hours: 5)));
      final List jsonResponse = jsonDecode(jsonEncode(response.data))['results'][0]['known_for'];
      print(jsonResponse);
      List<ActorDetailsModel> responses = jsonResponse.map((f) => ActorDetailsModel.fromJson(f)).toList();
      return Right(responses);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage!));
    }
  }
}