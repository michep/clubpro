import 'dart:convert';
import 'package:clubpro/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ApiFilestore {
  static final dioservice = Get.find<DioService>();

  static Future<String?> uploadFile(String filename, Uint8List data, {String? id}) async {
    var map = {
      if (id != null) '_id': id,
      'filename': filename,
      'data': base64.encode(data),
    };
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/file'),
      data: map,
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

  static Future<void> deleteFiles(List<String> ids) async {
    await dioservice.dio.postUri(
      dioservice.baseUriFunc('/file/delete'),
      data: ids,
      options: Options(
        contentType: 'application/json',
      ),
    );
  }

  static Uint8List? _noImageData;
  static Future<Uint8List> getNoImageFile() async {
    _noImageData ??= (await rootBundle.load('assets/images/no-image.png')).buffer.asUint8List();
    return _noImageData!;
  }
}
