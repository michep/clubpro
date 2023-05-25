import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';

class SelectCatalogFolderAttribute extends StatefulWidget {
  final CatalogFolder folder;
  final int attributeIdx;
  final void Function(VoidFunction) update;

  const SelectCatalogFolderAttribute({
    required this.folder,
    required this.attributeIdx,
    required this.update,
    super.key,
  });

  @override
  State<SelectCatalogFolderAttribute> createState() => _SelectCatalogFolderAttributeState();
}

class _SelectCatalogFolderAttributeState extends State<SelectCatalogFolderAttribute> {
  final TextEditingController namecont = TextEditingController();
  final TextEditingController valuecont = TextEditingController();
  late SelectAttributeTemplate attribute;

  @override
  void initState() {
    super.initState();
    attribute = widget.folder.attributes[widget.attributeIdx] as SelectAttributeTemplate;
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
              'Атрибут выбора одного значения',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                alignment: WrapAlignment.start,
                children: [
                  ...attribute.values.map(
                    (e) => Chip(
                      label: Text(e),
                      deleteIcon: const Icon(Icons.remove_circle_outline_outlined),
                      onDeleted: () => deleteValue(e),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: valuecont,
                    decoration: const InputDecoration(
                      labelText: 'Значение',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextButton(
                    onPressed: addValue,
                    child: const Text('Добавить значение атрибута'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addValue() {
    setState(() {
      attribute.values.add(valuecont.text);
      valuecont.value = TextEditingValue.empty;
    });
  }

  void deleteValue(String value) {
    setState(() {
      attribute.values.remove(value);
    });
  }
}
