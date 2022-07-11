import 'package:dio/dio.dart';
import 'package:movie_app/core/config/config.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Client{
  static final Client _client = Client._internal();
  factory Client() {
    return _client;
  }
  Client._internal();
  static Dio dio = Dio();
  static init(){
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 40000;
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }
}