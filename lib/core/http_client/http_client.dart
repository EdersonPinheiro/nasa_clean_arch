import 'dart:io';

abstract class HttpClient {
  Future<HttpResponse> get(String url);

  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
}

class HttpReponse {
  final dynamic data;
  final int? statusCode;

  HttpReponse({required this.data, required this.statusCode});
}
