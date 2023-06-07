import 'package:clubpro/models/attribute/real_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RealProductAttribute extends ProductAttribute {
  const RealProductAttribute({
    required super.product,
    required super.attributeIdx,
    required super.update,
    super.deletable = false,
    super.key,
  });

  @override
  State<RealProductAttribute> createState() => _RealProductAttributeState();
}

class _RealProductAttributeState extends ProductAttributeState<RealProductAttribute, RealAttribute> {
  @override
  Widget content() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^-?\d*.?\d*'))],
      initialValue: attribute.value?.toString() ?? '',
      decoration: InputDecoration(
        labelText: attribute.name ?? '',
      ),
      onSaved: (value) => value != null
          ? widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: double.parse(value))
          : widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: null),
    );
  }
}
