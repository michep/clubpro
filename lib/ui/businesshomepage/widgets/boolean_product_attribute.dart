import 'package:clubpro/models/attribute/boolean_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_attribute.dart';
import 'package:flutter/material.dart';

class BooleanProductAttribute extends ProductAttribute {
  const BooleanProductAttribute({
    required super.product,
    required super.attributeIdx,
    required super.update,
    super.deletable = false,
    super.key,
  });

  @override
  State<BooleanProductAttribute> createState() => _BooleanProductAttributeState();
}

class _BooleanProductAttributeState extends ProductAttributeState<BooleanProductAttribute, BooleanAttribute> {
  @override
  Widget content() {
    return DropdownButtonFormField<bool>(
      value: attribute.value,
      decoration: InputDecoration(
        labelText: attribute.name ?? '',
      ),
      items: const [
        DropdownMenuItem(
          value: true,
          child: Text('Да'),
        ),
        DropdownMenuItem(
          value: false,
          child: Text('Нет'),
        ),
      ],
      onChanged: (value) => widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: value),
    );
  }
}
