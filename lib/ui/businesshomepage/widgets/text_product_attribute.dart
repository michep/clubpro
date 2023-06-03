import 'package:clubpro/models/attribute/text_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_attribute.dart';
import 'package:flutter/material.dart';

class TextProductAttribute extends ProductAttribute {
  const TextProductAttribute({
    required super.product,
    required super.attributeIdx,
    required super.update,
    super.key,
  });

  @override
  State<TextProductAttribute> createState() => _TextProductAttributeState();
}

class _TextProductAttributeState extends ProductAttributeState<TextProductAttribute, TextAttribute> {
  @override
  Widget content() {
    return TextFormField(
      initialValue: attribute.value,
      minLines: 1,
      maxLines: 6,
      decoration: InputDecoration(
        labelText: attribute.name ?? '',
      ),
      onFieldSubmitted: (value) => widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: value),
    );
  }
}
