import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/service/dio_service.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiAuth {
  static final dioservice = Get.find<DioService>();
  static final securityservice = Get.find<SecurityService>();

  static Future<UserAccount?> authenticate({required String login, required String password}) async {
    var res = await dioservice.dio.postUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/auth'),
      data: {'username': login, 'password': password},
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    if (res.data!['access_token'] != null) {
      var jwt = res.data!['access_token'];
      securityservice.saveCredentials(login, password);
      securityservice.jwt = jwt;
    }

    var user = await ApiUser.getUserByLogin(login);

    return user;
  }
}
