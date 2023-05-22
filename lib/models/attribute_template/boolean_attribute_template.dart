import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'boolean_attribute_template.mapper.dart';

@MappableClass()
class BooleanAttributeTemplate extends AttributeTemplate with BooleanAttributeTemplateMappable {
  BooleanAttributeTemplate({
    super.name,
  });

  static const fromJson = BooleanAttributeTemplateMapper.fromJson;
  static const fromMap = BooleanAttributeTemplateMapper.fromMap;
}
