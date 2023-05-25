import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'select_attribute_template.mapper.dart';

@MappableClass()
class SelectAttributeTemplate extends AttributeTemplate with SelectAttributeTemplateMappable {
  late final List<String> values;

  SelectAttributeTemplate({
    super.name,
    List<String>? values,
  }) {
    this.values = values ?? [];
  }

  static const fromJson = SelectAttributeTemplateMapper.fromJson;
  static const fromMap = SelectAttributeTemplateMapper.fromMap;
}
