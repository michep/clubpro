import 'package:clubpro/service/dio_service.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiUser {
  static final dioservice = Get.find<DioService>();

  static Future<String?> createUser(UserAccount user) async {
    var res = await dioservice.dio.putUri<Map<String, String>>(
      dioservice.baseUriFunc('/user'),
      data: user.toMap(),
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['inserted_id'];
  }

  static Future<UserAccount?> getUserById(String id) async {
    var res = await dioservice.dio.getUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/id/$id'),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return UserAccount.fromMap(res.data!);
  }

  static Future<UserAccount?> getUserByLogin(String login) async {
    var res = await dioservice.dio.getUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/login/$login'),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return UserAccount.fromMap(res.data!);
  }
}
