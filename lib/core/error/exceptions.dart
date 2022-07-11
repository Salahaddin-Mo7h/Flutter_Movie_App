
class ServerException implements Exception {
  int? errorCode;
  List<String>? errorMessage;
  String? url;

  ServerException(this.errorCode,String url) {
    errorMessage = [];
  }
}

class CacheException implements Exception {}
