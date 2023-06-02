import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiProduct {
  static final dioservice = Get.find<DioService>();

  static Future<String?> saveProduct(Product product) async {
    if (product.id == null) {
      return createProduct(product);
    } else {
      return updateProduct(product);
    }
  }

  static Future<String?> createProduct(Product product) async {
    var data = product.toMap()..remove('_id');
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/product'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['inserted_id'];
  }

  static Future<String?> updateProduct(Product product) async {
    var data = product.toMap();
    var res = await dioservice.dio.postUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/product/${product.id}'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['upserted_id'];
  }
}
