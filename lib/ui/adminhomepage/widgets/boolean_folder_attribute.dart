import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:flutter/material.dart';

class BooleanCatalogFolderAttribute extends CatalogFolderAttribute {
  const BooleanCatalogFolderAttribute({
    required super.folder,
    required super.attributeIdx,
    required super.update,
    super.key,
  });

  @override
  State<BooleanCatalogFolderAttribute> createState() => _BooleanCatalogFolderAttributeState();
}

class _BooleanCatalogFolderAttributeState extends CatalogFolderAttributeState<BooleanCatalogFolderAttribute, BooleanAttributeTemplate> {
  @override
  Widget content() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Логический атрибут',
            style: TextStyle(fontSize: 12),
          ),
          TextFormField(
            controller: namecont,
            decoration: const InputDecoration(
              labelText: 'Название атрибута',
            ),
            validator: (value) => Utils.validateNotEmpty(value, 'Укажите имя атрибута'),
            onSaved: (value) => widget.folder.attributes[widget.attributeIdx] = attribute.copyWith(name: value),
          ),
        ],
      ),
    );
  }
}
