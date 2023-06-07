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
  final bool deletable;
  final void Function(VoidFunction) update;

  const ProductAttribute({
    required this.product,
    required this.attributeIdx,
    required this.update,
    this.deletable = false,
    super.key,
  });

  factory ProductAttribute.factory({
    required Product product,
    required int attributeIdx,
    required void Function(VoidFunction) update,
    bool deletable = false,
    Key? key,
  }) {
    var attribute = product.attributes[attributeIdx];
    switch (attribute.runtimeType) {
      case BooleanAttribute:
        return BooleanProductAttribute(
          product: product,
          attributeIdx: attributeIdx,
          update: update,
          deletable: deletable,
          key: ValueKey(attribute),
        );
      case TextAttribute:
        return TextProductAttribute(
          product: product,
          attributeIdx: attributeIdx,
          update: update,
          deletable: deletable,
          key: ValueKey(attribute),
        );
      case SelectAttribute:
        return SelectProductAttribute(
          product: product,
          attributeIdx: attributeIdx,
          update: update,
          deletable: deletable,
          key: ValueKey(attribute),
        );
      case IntAttribute:
        return IntProductAttribute(
          product: product,
          attributeIdx: attributeIdx,
          update: update,
          deletable: deletable,
          key: ValueKey(attribute),
        );
      case RealAttribute:
        return RealProductAttribute(
          product: product,
          attributeIdx: attributeIdx,
          update: update,
          deletable: deletable,
          key: ValueKey(attribute),
        );
      default:
        throw 'Unknown attribute type';
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
        child: Row(
          children: [
            Expanded(child: content()),
            if (widget.deletable)
              IconButton(
                onPressed: deleteAttribute,
                icon: const Icon(Icons.delete),
              ),
          ],
        ),
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

  void deleteAttribute() {
    widget.update(() => widget.product.attributes.removeAt(widget.attributeIdx));
  }
}
