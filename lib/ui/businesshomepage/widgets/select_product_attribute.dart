import 'package:clubpro/models/attribute/select_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_attribute.dart';
import 'package:flutter/material.dart';

class SelectProductAttribute extends ProductAttribute {
  const SelectProductAttribute({
    required super.product,
    required super.attributeIdx,
    required super.update,
    super.key,
  });

  @override
  State<SelectProductAttribute> createState() => _SelectProductAttributeState();
}

class _SelectProductAttributeState extends ProductAttributeState<SelectProductAttribute, SelectAttribute> {
  @override
  Widget content() {
    return DropdownButtonFormField<String>(
      value: attribute.value,
      decoration: InputDecoration(
        labelText: attribute.name ?? '',
      ),
      items: [
        ...attribute.values?.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                )) ??
            []
      ],
      onChanged: (value) => widget.product.attributes[widget.attributeIdx] = attribute.copyWith(value: value),
    );
  }
}
