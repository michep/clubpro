import 'package:clubpro/models/attribute/int_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntProductAttribute extends ProductAttribute {
  const IntProductAttribute({
    required super.product,
    required super.attributeIdx,
    required super.update,
    super.deletable = false,
    super.key,
  });

  @override
  State<IntProductAttribute> createState() => _IntProductAttributeState();
}

class _IntProductAttributeState extends ProductAttributeState<IntProductAttribute, IntAttribute> {
  @override
  Widget content() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^-?\d*'))],
      initialValue: attribute.value?.toString() ?? '',
      decoration: InputDecoration(
        labelText: attribute.name ?? '',
      ),
      onSaved: (value) => value != null
          ? widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: int.parse(value))
          : widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: null),
    );
  }
}
