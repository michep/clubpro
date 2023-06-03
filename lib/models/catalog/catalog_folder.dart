import 'dart:typed_data';

import 'package:clubpro/api/api_catalogfolder.dart';
import 'package:clubpro/api/api_filestore.dart';
import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_element.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/models/fileset.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'catalog_folder.mapper.dart';

@MappableClass()
class CatalogFolder extends CatalogElement with CatalogFolderMappable {
  final int? order;
  late final FileSet pictures;
  final String? seo;
  late final List<AttributeTemplate> attributes;
  late final List<String> breadcrumbs;

  CatalogFolder({
    super.id,
    super.name,
    super.parentFolderId,
    this.order,
    this.seo,
    FileSet? pictures,
    List<AttributeTemplate>? attributes,
    List<String>? breadcrumbs,
  }) {
    this.pictures = pictures ?? FileSet();
    this.attributes = attributes ?? [];
    this.breadcrumbs = breadcrumbs ?? [];
  }

  static const fromJson = CatalogFolderMapper.fromJson;
  static const fromMap = CatalogFolderMapper.fromMap;

  String get breadcrumbstring => '/ ${<String>[...breadcrumbs, name != null ? name! : ''].join(' / ')}';

  List<CatalogFolder>? _subFolders;
  Future<List<CatalogFolder>> subFolders({bool forceRefresh = false}) async {
    if (id == null) return [];
    if (_subFolders != null && !forceRefresh) return _subFolders!;
    _subFolders = await ApiCatalogFolder.getSubFolders(id!);
    return _subFolders!;
  }

  final Map<FolderProductType, List<Product>?> _products = {};
  Future<List<Product>> products(FolderProductType type, {bool forceRefresh = false}) async {
    if (id == null) return [];
    if (_products[type] != null && !forceRefresh) return _products[type]!;
    _products[type] = await ApiCatalogFolder.getProducts(id!, type);
    return _products[type]!;
  }

  Future<Uint8List?> pictureOrNoFile({bool forceRefresh = false}) async {
    if (pictures.isEmpty) return await ApiFilestore.getNoImageFile();
    return (await pictures[0]).data;
  }

  Future<List<CatalogElement>> subFoldersAndProducts(FolderProductType type, {bool forceRefresh = false}) async {
    List<CatalogElement> res = [];
    res.addAll(await subFolders(forceRefresh: forceRefresh));
    res.addAll(await products(type, forceRefresh: forceRefresh));
    return res;
  }

  Future<CatalogFolder> save() async {
    await pictures.save();
    var newid = await ApiCatalogFolder.saveFolder(this);
    id ??= newid;
    return this;
  }

  // Future<void> delete() async {
  //   return await ApiCatalogFolder.deleteFolder(this);
  // }

  static List<CatalogFolder>? _rootFolders;
  static Future<List<CatalogFolder>> getFoldersByParent(CatalogFolder? parentFolder, {bool forceRefresh = false}) async {
    if (parentFolder == null) {
      if (_rootFolders != null && !forceRefresh) return _rootFolders!;
      _rootFolders = await ApiCatalogFolder.getRootFolders();
      return _rootFolders!;
    }
    return await parentFolder.subFolders(forceRefresh: forceRefresh);
  }
}
