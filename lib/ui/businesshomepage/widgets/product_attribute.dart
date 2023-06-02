import 'package:clubpro/models/attribute/attribute.dart';
import 'package:clubpro/models/attribute/boolean_attribute.dart';
import 'package:clubpro/models/attribute/int_attribute.dart';
import 'package:clubpro/models/attribute/real_attribute.dart';
import 'package:clubpro/models/attribute/select_attribute.dart';
import 'package:clubpro/models/attribute/text_attribute.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/ui/businesshomepage/widgets/boolean_product_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/int_product_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/real_product_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/select_product_attribute.dart';
import 'package:clubpro/ui/businesshomepage/widgets/text_product_attribute.dart';
import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';

class ProductAttribute extends StatefulWidget {
  final Product product;
  final int attributeIdx;
  final void Function(VoidFunction) update;

  const ProductAttribute({
    required this.product,
    required this.attributeIdx,
    required this.update,
    super.key,
  });

  factory ProductAttribute.factory({
    required Product product,
    required int attributeIdx,
    required void Function(VoidFunction) update,
    Key? key,
  }) {
    switch (product.attributes[attributeIdx].runtimeType) {
      case BooleanAttribute:
        return BooleanProductAttribute(product: product, attributeIdx: attributeIdx, update: update);
      case TextAttribute:
        return TextProductAttribute(product: product, attributeIdx: attributeIdx, update: update);
      case SelectAttribute:
        return SelectProductAttribute(product: product, attributeIdx: attributeIdx, update: update);
      case IntAttribute:
        return IntProductAttribute(product: product, attributeIdx: attributeIdx, update: update);
      case RealAttribute:
        return RealProductAttribute(product: product, attributeIdx: attributeIdx, update: update);
      default:
        return ProductAttribute(product: product, attributeIdx: attributeIdx, update: update);
    }
  }

  @override
  State<ProductAttribute> createState() => ProductAttributeState();
}

class ProductAttributeState<T extends ProductAttribute, U extends Attribute> extends State<T> {
  late U attribute;

  @override
  void initState() {
    super.initState();
    attribute = widget.product.attributes[widget.attributeIdx] as U;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: content(),
      ),
    );
  }

  Widget content() {
    return Row(
      children: [
        Text(widget.product.attributes[widget.attributeIdx].name!),
        Text(widget.product.attributes[widget.attributeIdx].value?.toString() ?? ''),
      ],
    );
  }
}
