import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio dio = Dio();
  final Uri Function(String) baseUriFunc;

  DioService({
    required this.baseUriFunc,
  });

  void init() {
    if (dio.httpClientAdapter is IOHttpClientAdapter) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        var currentToken = ''; // TODO: get user JWT token
        options.headers.addAll({'Authorization': 'JWT $currentToken'});
        return handler.next(options);
      },
    ));
  }
}
