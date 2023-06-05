import 'package:clubpro/api/api_catalogfolder.dart';
import 'package:clubpro/models/base_model.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'catalog_element.mapper.dart';

@MappableClass(discriminatorKey: '_elementType', includeSubClasses: [CatalogFolder, Product])
class CatalogElement extends BaseModel with CatalogElementMappable {
  final String? name;
  @MappableField(key: 'parentfolder_id')
  late final String? parentFolderId;

  CatalogElement({
    super.id,
    super.created,
    super.createdBy,
    super.modified,
    super.modifiedBy,
    this.name,
    this.parentFolderId,
  });

  static const fromJson = CatalogElementMapper.fromJson;
  static const fromMap = CatalogElementMapper.fromMap;

  CatalogFolder? _parentFolder;
  Future<CatalogFolder?> parentFolder({bool forceRefresh = false}) async {
    if (parentFolderId == null) return null;
    if (_parentFolder != null && !forceRefresh) return _parentFolder;
    _parentFolder = await ApiCatalogFolder.getCatalogFolderById(parentFolderId!);
    return _parentFolder;
  }
}
