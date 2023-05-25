import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';

class BooleanCatalogFolderAttribute extends StatefulWidget {
  final CatalogFolder folder;
  final int attributeIdx;
  final VoidFunction update;

  const BooleanCatalogFolderAttribute({
    required this.folder,
    required this.attributeIdx,
    required this.update,
    super.key,
  });

  @override
  State<BooleanCatalogFolderAttribute> createState() => _BooleanCatalogFolderAttributeState();
}

class _BooleanCatalogFolderAttributeState extends State<BooleanCatalogFolderAttribute> {
  final TextEditingController namecont = TextEditingController();
  late BooleanAttributeTemplate attribute;

  @override
  void initState() {
    super.initState();
    attribute = widget.folder.attributes[widget.attributeIdx] as BooleanAttributeTemplate;
    namecont.value = TextEditingValue(text: attribute.name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
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
              onChanged: (value) => widget.folder.attributes[widget.attributeIdx] = attribute.copyWith(name: value),
            ),
          ],
        ),
      ),
    );
  }
}
