import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute_template/int_attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'int_attribute.mapper.dart';

@MappableClass()
class IntAttribute extends Attribute<int> with IntAttributeMappable {
  IntAttribute({
    super.name,
    super.value,
  });

  IntAttribute.withTemplate({
    required IntAttributeTemplate template,
    int? value,
  }) : this(name: template.name, value: value);

  static const fromJson = IntAttributeMapper.fromJson;
  static const fromMap = IntAttributeMapper.fromMap;
}
