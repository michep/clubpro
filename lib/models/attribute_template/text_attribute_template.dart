import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'text_attribute_template.mapper.dart';

@MappableClass()
class TextAttributeTemplate extends AttributeTemplate with TextAttributeTemplateMappable {
  TextAttributeTemplate({
    super.name,
  });

  static const fromJson = TextAttributeTemplateMapper.fromJson;
  static const fromMap = TextAttributeTemplateMapper.fromMap;
}
