import 'package:clubpro/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiAuth {
  static final dioservice = Get.find<DioService>();

  static Future<String?> getToken(String login, String password) async {
    try {
      var res = await dioservice.dio.postUri<Map<String, dynamic>>(
        dioservice.baseUriFunc('/auth'),
        data: {'username': login, 'password': password},
        options: Options(
          contentType: 'application/json',
        ),
      );

      if (res.data == null || res.data!.isEmpty || res.data!['access_token'] == null) return null;

      return res.data!['access_token'];
    } catch (e) {
      return null;
    }
  }
}
