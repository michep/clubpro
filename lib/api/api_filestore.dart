import 'dart:convert';
import 'package:clubpro/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
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

  static Future<Uint8List> getFileOfNoImageFile(String? fileid) async {
    Uint8List? res;
    if (fileid != null) {
      var resp = await dioservice.dio.getUri<Uint8List>(
        dioservice.baseUriFunc('/file/$fileid'),
        options: Options(responseType: ResponseType.bytes),
      );
      if (resp.data != null) {
        res = resp.data!;
      } else {
        res = await getNoImageFile();
      }
    } else {
      res = await getNoImageFile();
    }

    return res;
  }

  static Uint8List? _noImageData;
  static Future<Uint8List> getNoImageFile() async {
    // var asdasd = await rootBundle.loadString('AssetManifest.json');
    _noImageData ??= (await rootBundle.load('assets/images/no-image.png')).buffer.asUint8List();
    return _noImageData!;
  }

  static Future<void> deleteFile(String fileid) async {
    await dioservice.dio.deleteUri(
      dioservice.baseUriFunc('/file/$fileid'),
    );
  }
}
