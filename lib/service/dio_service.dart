import 'dart:io';
import 'package:clubpro/api/api_auth.dart';
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
  });

  void init() {
    if (dio.httpClientAdapter is IOHttpClientAdapter) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_secureService.jwt != null) {
            if (JwtDecoder.isExpired(_secureService.jwt!) && _secureService.account != null) {
              _secureService.clearJWT();
              var token = await ApiAuth.getToken(_secureService.account!.login, _secureService.account!.password);
              if (token == null) {
                _secureService.logout();
                handler.reject(DioError(requestOptions: options, type: DioErrorType.cancel, message: 'Token error'));
              }
            }
            options.headers.addAll({'Authorization': 'JWT ${_secureService.jwt}'});
          }
          return handler.next(options);
        },
      ),
    );
  }
}
