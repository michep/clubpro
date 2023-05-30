import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'real_attribute_template.mapper.dart';

@MappableClass()
class RealAttributeTemplate extends AttributeTemplate with RealAttributeTemplateMappable {
  RealAttributeTemplate({
    super.name,
  });

  static const fromJson = RealAttributeTemplateMapper.fromJson;
  static const fromMap = RealAttributeTemplateMapper.fromMap;
}
