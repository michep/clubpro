import 'package:clubpro/models/attribute_template/text_attribute_template.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:flutter/material.dart';

class TextCatalogFolderAttribute extends CatalogFolderAttribute {
  const TextCatalogFolderAttribute({
    required super.folder,
    required super.attributeIdx,
    required super.update,
    super.key,
  });

  @override
  State<TextCatalogFolderAttribute> createState() => _TextCatalogFolderAttributeState();
}

class _TextCatalogFolderAttributeState extends CatalogFolderAttributeState<TextCatalogFolderAttribute, TextAttributeTemplate> {
  @override
  Widget content() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Текстовый атрибут',
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
