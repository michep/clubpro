import 'package:clubpro/service/dio_service.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiUser {
  static final dioservice = Get.find<DioService>();

  static Future<String?> createUser(UserAccount user) async {
    var data = user.toMap()..remove('_id');
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['inserted_id'];
  }

  static Future<String?> updateUser(UserAccount user) async {
    var data = user.toMap();
    var res = await dioservice.dio.postUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['upserted_id'];
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

  static Future<Map<String, dynamic>> registerUser(UserAccount user) async {
    var data = user.toMap()..remove('_id');
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/register'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return {'error': 'unknown error'};
    return res.data!;
  }

  static Future<Map<String, dynamic>> registerUserContinue(UserAccount user) async {
    var data = user.toMap();
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/register/${data['_id']}'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return {'error': 'unknown error'};
    return res.data!;
  }

  static Future<Map<String, dynamic>> sendSMSCode(UserAccount user) async {
    var data = user.toMap();
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/sendcode'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty || res.data!['result'] == null) return {'error': 'unknown error'};
    return res.data!;
  }

  static Future<Map<String, dynamic>> checkSMSCode(UserAccount user, String code) async {
    var data = user.toMap();
    data['smscode'] = code;
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/checkcode'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty || res.data!['result'] == 'error') return {'error': 'unknown error'};
    return res.data!;
  }

  static Future<Map<String, dynamic>> resetPassword(UserAccount user, String code) async {
    var data = user.toMap();
    data['smscode'] = code;
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/user/resetpassword'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return {'error': 'unknown error'};
    return res.data!;
  }
}
