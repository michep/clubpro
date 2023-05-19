import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'select_attribute_template.mapper.dart';

@MappableClass()
class SelectAttributeTemplate extends AttributeTemplate with SelectAttributeTemplateMappable {
  List<String>? values;

  SelectAttributeTemplate({
    super.name,
    this.values,
  });

  static const fromJson = SelectAttributeTemplateMapper.fromJson;
  static const fromMap = SelectAttributeTemplateMapper.fromMap;
}

extension SelectAttributeTemplateMethods on SelectAttributeTemplate {}
