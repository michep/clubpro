import 'dart:typed_data';
import 'package:clubpro/api/api_catalogfolder.dart';
import 'package:clubpro/api/api_filestore.dart';
import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/base_model.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'catalog_folder.mapper.dart';

@MappableClass()
class CatalogFolder extends BaseModel with CatalogFolderMappable {
  final String? name;
  @MappableField(key: 'parentfolder_id')
  final String? parentFolderId;
  final int? order;
  @MappableField(key: 'picture_file_id')
  final String? pictureFileId;
  final String? seo;
  late final List<AttributeTemplate> attributes;

  CatalogFolder({
    super.id,
    this.name,
    this.parentFolderId,
    this.order,
    this.pictureFileId,
    this.seo,
    List<AttributeTemplate>? attributes,
  }) {
    this.attributes = attributes ?? [];
  }

  static const fromJson = CatalogFolderMapper.fromJson;
  static const fromMap = CatalogFolderMapper.fromMap;

  CatalogFolder? _parentFolder;
  Future<CatalogFolder?> parentFolder({bool forceRefresh = false}) async {
    if (parentFolderId == null) return null;
    if (_parentFolder != null && !forceRefresh) return _parentFolder;
    _parentFolder = await ApiCatalogFolder.getCatalogFolderById(parentFolderId!);
    return _parentFolder;
  }

  List<CatalogFolder>? _subFolders;
  Future<List<CatalogFolder>?> subFolders({bool forceRefresh = false}) async {
    if (id == null) return null;
    if (_subFolders != null && !forceRefresh) return _subFolders;
    _subFolders = await ApiCatalogFolder.getSubFolders(id!);
    return _subFolders;
  }

  Uint8List? _pictureData;
  Future<Uint8List?> picture({bool forceRefresh = false}) async {
    if (pictureFileId == null) return null;
    if (_pictureData != null) return _pictureData;
    _pictureData = await ApiFilestore.getFile(pictureFileId!);
    return _pictureData;
  }

  static List<CatalogFolder>? _rootFolders;
  static Future<List<CatalogFolder>?> getFoldersByParent(CatalogFolder? parentFolder, {bool forceRefresh = false}) async {
    if (parentFolder == null) {
      if (_rootFolders != null && !forceRefresh) return _rootFolders;
      _rootFolders = await ApiCatalogFolder.getRootFolders();
      return _rootFolders;
    }
    return await parentFolder.subFolders(forceRefresh: forceRefresh);
  }

  Future<CatalogFolder> save() async {
    var newid = await ApiCatalogFolder.saveFolder(this);
    id ??= newid;
    return this;
  }
}
