import 'dart:typed_data';
import 'package:clubpro/api/api_filestore.dart';
import 'package:clubpro/api/api_product.dart';
import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute/boolean_attribute.dart';
import 'package:clubpro/models/attribute/int_attribute.dart';
import 'package:clubpro/models/attribute/real_attribute.dart';
import 'package:clubpro/models/attribute/select_attribute.dart';
import 'package:clubpro/models/attribute/text_attribute.dart';
import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:clubpro/models/attribute_template/int_attribute_template.dart';
import 'package:clubpro/models/attribute_template/real_attribute_template.dart';
import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:clubpro/models/attribute_template/text_attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_element.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/models/fileset.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'product.mapper.dart';

@MappableClass()
class Product extends CatalogElement with ProductMappable {
  @MappableField(key: 'alt_name')
  final String? altName;
  final String? description;
  @MappableField(key: 'secondaryfolder_ids')
  late final List<String> secondaryFolderIds;
  late final FileSet pictures;
  @MappableField(key: 'video_link')
  final String? videoLink;
  @MappableField(key: 'vendor_code')
  final String? vendorCode;
  final String? tags;
  late final List<Attribute> attributes;

  Product({
    super.id,
    super.name,
    super.parentFolderId,
    this.altName,
    this.videoLink,
    this.vendorCode,
    this.description,
    this.tags,
    FileSet? pictures,
    List<String>? secondaryFolderIds,
    List<Attribute>? attributes,
  }) {
    this.pictures = pictures ?? FileSet();
    this.secondaryFolderIds = secondaryFolderIds ?? [];
    this.attributes = attributes ?? [];
  }

  Product.withFolder({
    super.id,
    super.name,
    super.parentFolderId,
    this.altName,
    this.videoLink,
    this.vendorCode,
    this.description,
    this.tags,
    FileSet? pictures,
    List<String>? secondaryFolderIds,
    required CatalogFolder folder,
  }) {
    this.pictures = pictures ?? FileSet();
    this.secondaryFolderIds = secondaryFolderIds ?? [];
    attributes = [];
    for (var attrTmpl in folder.attributes) {
      switch (attrTmpl.runtimeType) {
        case TextAttributeTemplate:
          attributes.add(TextAttribute.withTemplate(template: attrTmpl as TextAttributeTemplate));
          break;
        case BooleanAttributeTemplate:
          attributes.add(BooleanAttribute.withTemplate(template: attrTmpl as BooleanAttributeTemplate));
          break;
        case SelectAttributeTemplate:
          attributes.add(SelectAttribute.withTemplate(template: attrTmpl as SelectAttributeTemplate));
          break;
        case IntAttributeTemplate:
          attributes.add(IntAttribute.withTemplate(template: attrTmpl as IntAttributeTemplate));
          break;
        case RealAttributeTemplate:
          attributes.add(RealAttribute.withTemplate(template: attrTmpl as RealAttributeTemplate));
          break;
      }
    }
  }

  static const fromJson = ProductMapper.fromJson;
  static const fromMap = ProductMapper.fromMap;

  Future<Uint8List?> pictureOrNoFile({bool forceRefresh = false}) async {
    if (pictures.isEmpty) return await ApiFilestore.getNoImageFile();
    return (await pictures[0]).data;
  }

  Future<Product> save() async {
    await pictures.save();
    var newid = await ApiProduct.saveProduct(this);
    id ??= newid;
    return this;
  }
}
