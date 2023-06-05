import 'package:clubpro/models/attribute_template/int_attribute_template.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:flutter/material.dart';

class IntCatalogFolderAttribute extends CatalogFolderAttribute {
  const IntCatalogFolderAttribute({
    required super.folder,
    required super.attributeIdx,
    required super.update,
    super.key,
  });

  @override
  State<IntCatalogFolderAttribute> createState() => _IntCatalogFolderAttributeState();
}

class _IntCatalogFolderAttributeState extends CatalogFolderAttributeState<IntCatalogFolderAttribute, IntAttributeTemplate> {
  @override
  Widget content() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Целый числовой атрибут',
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
