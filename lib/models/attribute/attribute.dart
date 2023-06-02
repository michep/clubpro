import 'package:clubpro/models/attribute/boolean_attribute.dart';
import 'package:clubpro/models/attribute/int_attribute.dart';
import 'package:clubpro/models/attribute/select_attribute.dart';
import 'package:clubpro/models/attribute/real_attribute.dart';
import 'package:clubpro/models/attribute/text_attribute.dart';
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
}
