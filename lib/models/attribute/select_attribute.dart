import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'select_attribute.mapper.dart';

@MappableClass()
class SelectAttribute extends Attribute<String> with SelectAttributeMappable {
  late final List<String>? values;

  SelectAttribute({
    super.name,
    super.value,
    List<String>? values,
  }) {
    this.values = values ?? [];
  }

  SelectAttribute.withTemplate({
    required SelectAttributeTemplate template,
    String? value,
  }) : this(name: template.name, values: template.values, value: value);

  static const fromJson = SelectAttributeMapper.fromJson;
  static const fromMap = SelectAttributeMapper.fromMap;
}
