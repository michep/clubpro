import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

enum FolderProductType {
  all,
  primary,
  secondary,
}

class ApiCatalogFolder {
  static final dioservice = Get.find<DioService>();

  static Future<CatalogFolder?> getCatalogFolderById(String id) async {
    var res = await dioservice.dio.getUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/catalog/id/$id'),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return CatalogFolder.fromMap(res.data!);
  }

  static Future<List<CatalogFolder>> getSubFolders(String id) async {
    var res = await dioservice.dio.getUri<List>(
      dioservice.baseUriFunc('/catalog/$id/subfolders'),
    );
    if (res.data == null || res.data!.isEmpty) return [];
    return res.data!.map<CatalogFolder>((e) => CatalogFolder.fromMap(e as Map<String, dynamic>)).toList();
  }

  static Future<List<CatalogFolder>> getProducts(String id, FolderProductType type) async {
    var res = await dioservice.dio.getUri<List>(
      dioservice.baseUriFunc('/catalog/$id/subfolders'),
    );
    if (res.data == null || res.data!.isEmpty) return [];
    return res.data!.map<CatalogFolder>((e) => CatalogFolder.fromMap(e as Map<String, dynamic>)).toList();
  }

  static Future<List<CatalogFolder>> getRootFolders() async {
    var res = await dioservice.dio.getUri<List>(
      dioservice.baseUriFunc('/catalog/root'),
    );
    if (res.data == null || res.data!.isEmpty) return [];
    return res.data!.map<CatalogFolder>((e) => CatalogFolder.fromMap(e as Map<String, dynamic>)).toList();
  }

  static Future<String?> saveFolder(CatalogFolder folder) async {
    if (folder.id == null) {
      return createFolder(folder);
    } else {
      return updateFolder(folder);
    }
  }

  static Future<String?> createFolder(CatalogFolder folder) async {
    var data = folder.toMap()..remove('_id');
    var res = await dioservice.dio.putUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/catalog'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['inserted_id'];
  }

  static Future<String?> updateFolder(CatalogFolder folder) async {
    var data = folder.toMap();
    var res = await dioservice.dio.postUri<Map<String, dynamic>>(
      dioservice.baseUriFunc('/catalog/${folder.id}'),
      data: data,
      options: Options(
        contentType: 'application/json',
      ),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!['upserted_id'];
  }
}
