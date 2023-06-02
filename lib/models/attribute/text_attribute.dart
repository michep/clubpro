import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute_template/text_attribute_template.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'text_attribute.mapper.dart';

@MappableClass()
class TextAttribute extends Attribute<String> with TextAttributeMappable {
  TextAttribute({
    super.name,
    super.value,
  });

  TextAttribute.withTemplate({
    required TextAttributeTemplate template,
    String? value,
  }) : this(name: template.name, value: value);

  static const fromJson = TextAttributeMapper.fromJson;
  static const fromMap = TextAttributeMapper.fromMap;
}
