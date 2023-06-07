import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:clubpro/service/security_service.dart';

class DioService {
  final Dio dio = Dio();
  final Uri Function(String) baseUriFunc;
  final SecurityService _secureService = Get.find<SecurityService>();

  DioService({
    required this.baseUriFunc,
  }) {
    _init();
  }

  void _init() {
    // if (dio.httpClientAdapter is IOHttpClientAdapter) {
    //   (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //     client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //     return client;
    //   };
    // }
    if (dio.httpClientAdapter is IOHttpClientAdapter) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_secureService.jwt != null) {
            if (JwtDecoder.isExpired(_secureService.jwt!) && _secureService.currentAccount != null) {
              _secureService.clearJWT();
              await _secureService.login(_secureService.currentAccount!.login, _secureService.currentAccount!.password, persist: false);
              if (_secureService.jwt == null) {
                _secureService.logout();
                handler.reject(DioException(requestOptions: options, type: DioExceptionType.cancel, message: 'Token error'));
              } else {}
            }
            options.headers.addAll({'Authorization': 'JWT ${_secureService.jwt}'});
          }
          return handler.next(options);
        },
      ),
    );
  }
}
