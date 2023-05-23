import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:flutter/material.dart';

class BooleanAttributeTemplateWidget extends StatelessWidget {
  final BooleanAttributeTemplate template;

  const BooleanAttributeTemplateWidget({
    required this.template,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(template.name!);
  }
}
