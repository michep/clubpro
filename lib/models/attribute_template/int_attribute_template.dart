import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'int_attribute_template.mapper.dart';

@MappableClass()
class IntAttributeTemplate extends AttributeTemplate with IntAttributeTemplateMappable {
  IntAttributeTemplate({
    super.name,
  });

  static const fromJson = IntAttributeTemplateMapper.fromJson;
  static const fromMap = IntAttributeTemplateMapper.fromMap;
}
