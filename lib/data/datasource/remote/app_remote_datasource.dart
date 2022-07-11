import 'dart:async';
import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/generics.dart';
import '../../client.dart';

abstract class AppRemoteDataSource {

  Future<T?> get<T, K>(String url);

}
class AppRemoteDataSourceImpl implements AppRemoteDataSource {

  @override
  Future<T?> get<T, K>(String url) async {
    try {
      final response = await Client.dio.get(url);
      if (response.statusCode == 200) {
        if (T == bool) {
          return true as T;
        }
        return Generics.fromJson<T, K>(response.data);
      }
    } on DioError catch (e) {
      throw ServerException(e.response!.statusCode!, url);
    }
    return null;
  }
}
