import 'package:clubpro/models/base_model.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'product.mapper.dart';

@MappableClass()
class Product extends BaseModel with ProductMappable {
  final String? name;
  @MappableField(key: 'alt_name')
  final String? altName;
  final String? description;
  @MappableField(key: 'parentfolder_id')
  final String? primaryFolderId;
  @MappableField(key: 'secondaryfolder_ids')
  final List<String>? secondaryFolderIds;
  @MappableField(key: 'picture_file_id')
  final String? pictureFileId;
  @MappableField(key: 'video_link')
  final String? videoLink;
  @MappableField(key: 'vendor_code')
  final String? vendorCode;

  Product({
    super.id,
    this.name,
    this.altName,
    this.primaryFolderId,
    this.secondaryFolderIds,
    this.pictureFileId,
    this.videoLink,
    this.vendorCode,
    this.description,
  });

  static const fromJson = ProductMapper.fromJson;
  static const fromMap = ProductMapper.fromMap;
}

extension ProductMethods on Product {}
