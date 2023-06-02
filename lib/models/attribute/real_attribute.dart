import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute_template/real_attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'real_attribute.mapper.dart';

@MappableClass()
class RealAttribute extends Attribute<double> with RealAttributeMappable {
  RealAttribute({
    super.name,
    super.value,
  });

  RealAttribute.withTemplate({
    required RealAttributeTemplate template,
    double? value,
  }) : this(name: template.name, value: value);

  static const fromJson = RealAttributeMapper.fromJson;
  static const fromMap = RealAttributeMapper.fromMap;
}
