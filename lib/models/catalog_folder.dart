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

  CatalogFolder({
    super.id,
    this.name,
    this.parentFolderId,
    this.order,
    this.pictureFileId,
    this.seo,
  });

  static const fromJson = CatalogFolderMapper.fromJson;
  static const fromMap = CatalogFolderMapper.fromMap;
}
