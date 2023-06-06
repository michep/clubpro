import 'dart:typed_data';
import 'package:clubpro/api/api_filestore.dart';
import 'package:clubpro/api/api_product.dart';
import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute/boolean_attribute.dart';
import 'package:clubpro/models/attribute/int_attribute.dart';
import 'package:clubpro/models/attribute/real_attribute.dart';
import 'package:clubpro/models/attribute/select_attribute.dart';
import 'package:clubpro/models/attribute/text_attribute.dart';
import 'package:clubpro/models/attribute_template/attribute_template.dart';
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
    super.created,
    super.createdBy,
    super.modified,
    super.modifiedBy,
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
    super.created,
    super.createdBy,
    super.modified,
    super.modifiedBy,
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
      attributes.add(_attributeFromTemplate(attrTmpl));
    }
  }

  static const fromJson = ProductMapper.fromJson;
  static const fromMap = ProductMapper.fromMap;

  Future<Uint8List?> pictureOrNoFile({bool forceRefresh = false}) async {
    if (pictures.isEmpty) return await ApiFilestore.getNoImageFile();
    return (await pictures[0]).data;
  }

  bool addMissingAttributeTemplates(List<AttributeTemplate> templates) {
    bool res = false;
    for (var templ in templates) {
      if (!templ.existsInProductAttributes(attributes)) {
        res = true;
        attributes.add(_attributeFromTemplate(templ));
      }
    }
    return res;
  }

  @override
  Future<Product> save() async {
    super.save();
    await pictures.save();
    var newid = await ApiProduct.saveProduct(this);
    id ??= newid;
    return this;
  }

  Attribute _attributeFromTemplate(AttributeTemplate template) {
    switch (template.runtimeType) {
      case TextAttributeTemplate:
        return TextAttribute.withTemplate(template: template as TextAttributeTemplate);
      case BooleanAttributeTemplate:
        return BooleanAttribute.withTemplate(template: template as BooleanAttributeTemplate);
      case SelectAttributeTemplate:
        return SelectAttribute.withTemplate(template: template as SelectAttributeTemplate);
      case IntAttributeTemplate:
        return IntAttribute.withTemplate(template: template as IntAttributeTemplate);
      case RealAttributeTemplate:
        return RealAttribute.withTemplate(template: template as RealAttributeTemplate);
      default:
        throw 'Unknown attribute template type';
    }
  }
}
