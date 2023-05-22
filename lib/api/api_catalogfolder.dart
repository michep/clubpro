import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/dio_service.dart';
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

  static Future<List<CatalogFolder>?> getSubFolders(String id) async {
    var res = await dioservice.dio.getUri<List>(
      dioservice.baseUriFunc('/catalog/$id/subfolders'),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!.map<CatalogFolder>((e) => CatalogFolder.fromMap(e as Map<String, dynamic>)).toList();
  }

  static Future<List<CatalogFolder>?> getProducts(String id, FolderProductType type) async {
    var res = await dioservice.dio.getUri<List>(
      dioservice.baseUriFunc('/catalog/$id/subfolders'),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!.map<CatalogFolder>((e) => CatalogFolder.fromMap(e as Map<String, dynamic>)).toList();
  }

  static Future<List<CatalogFolder>?> getRootFolders() async {
    var res = await dioservice.dio.getUri<List>(
      dioservice.baseUriFunc('/catalog/root'),
    );
    if (res.data == null || res.data!.isEmpty) return null;
    return res.data!.map<CatalogFolder>((e) => CatalogFolder.fromMap(e as Map<String, dynamic>)).toList();
  }
}
