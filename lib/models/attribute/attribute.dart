import 'package:clubpro/models/attribute/boolean_attribute.dart';
import 'package:clubpro/models/attribute/int_attribute.dart';
import 'package:clubpro/models/attribute/select_attribute.dart';
import 'package:clubpro/models/attribute/real_attribute.dart';
import 'package:clubpro/models/attribute/text_attribute.dart';
import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'attribute.mapper.dart';

@MappableClass(
  discriminatorKey: '_attributeType',
  includeSubClasses: [
    TextAttribute,
    SelectAttribute,
    BooleanAttribute,
    IntAttribute,
    RealAttribute,
  ],
)
class Attribute<T> with AttributeMappable {
  String? name;
  T? value;

  Attribute({
    this.name,
    this.value,
  });

  static const fromJson = AttributeMapper.fromJson;
  static const fromMap = AttributeMapper.fromMap;

  bool existsInFolderAttributes(List<AttributeTemplate> folderAttributes) {
    for (var folderAttr in folderAttributes) {
      if (equalsFolderAttribute(folderAttr)) return true;
    }
    return false;
  }

  bool equalsFolderAttribute(AttributeTemplate folderAttribute) {
    if (name == folderAttribute.name) {
      var attrType = runtimeType.toString();
      var folderAttrType = folderAttribute.runtimeType.toString();
      if (folderAttrType.startsWith(attrType)) {
        return true;
      }
    }
    return false;
  }
}
