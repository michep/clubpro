import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:clubpro/models/attribute_template/int_attribute_template.dart';
import 'package:clubpro/models/attribute_template/real_attribute_template.dart';
import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:clubpro/models/attribute_template/text_attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'attribute_template.mapper.dart';

@MappableClass(
  discriminatorKey: '_attributeType',
  includeSubClasses: [
    BooleanAttributeTemplate,
    SelectAttributeTemplate,
    TextAttributeTemplate,
    IntAttributeTemplate,
    RealAttributeTemplate,
  ],
)
class AttributeTemplate with AttributeTemplateMappable {
  String? name;

  AttributeTemplate({
    this.name,
  });

  static const fromJson = AttributeTemplateMapper.fromJson;
  static const fromMap = AttributeTemplateMapper.fromMap;
}
