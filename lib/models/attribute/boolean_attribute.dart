import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'boolean_attribute.mapper.dart';

@MappableClass()
class BooleanAttribute extends Attribute<bool> with BooleanAttributeMappable {
  BooleanAttribute({
    super.name,
    super.value,
  });

  BooleanAttribute.withTemplate({
    required BooleanAttributeTemplate template,
    bool? value,
  }) : this(name: template.name, value: value);

  static const fromJson = BooleanAttributeMapper.fromJson;
  static const fromMap = BooleanAttributeMapper.fromMap;
}
