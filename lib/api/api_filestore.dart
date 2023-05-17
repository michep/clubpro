import 'dart:convert';
import 'dart:typed_data';

import 'package:clubpro/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiFilestore {
  static final dioservice = Get.find<DioService>();

  static Future<String?> uploadFile(String filename, Uint8List data) async {
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/file'),
      data: {
        'filename': filename,
        'data': base64.encode(data),
      },
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['fileid'];
  }

  static Future<Uint8List> getFile(String fileid) async {
    var res = await dioservice.dio.getUri<Uint8List>(
      dioservice.baseUriFunc('/file/$fileid'),
      options: Options(responseType: ResponseType.bytes),
    );
    return res.data!;
  }

  static Future<void> deleteFile(String fileid) async {
    await dioservice.dio.deleteUri(
      dioservice.baseUriFunc('/file/$fileid'),
    );
  }
}
