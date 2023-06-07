import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute/select_attribute.dart';
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

  @override
  bool equalsProductAttribute(Attribute productAttribute) {
    if (name == productAttribute.name) {
      var attrType = runtimeType.toString();
      var prodAttrType = productAttribute.runtimeType.toString();
      if (attrType.startsWith(prodAttrType) &&
          values.length == (productAttribute as SelectAttribute).values.length &&
          values.toSet().containsAll(productAttribute.values)) {
        return true;
      }
    }
    return false;
  }
}
