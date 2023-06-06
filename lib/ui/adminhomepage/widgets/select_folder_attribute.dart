import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:flutter/material.dart';

class SelectCatalogFolderAttribute extends CatalogFolderAttribute {
  const SelectCatalogFolderAttribute({
    required super.folder,
    required super.attributeIdx,
    required super.update,
    super.key,
  });

  @override
  State<SelectCatalogFolderAttribute> createState() => _SelectCatalogFolderAttributeState();
}

class _SelectCatalogFolderAttributeState extends CatalogFolderAttributeState<SelectCatalogFolderAttribute, SelectAttributeTemplate> {
  final TextEditingController valuecont = TextEditingController();

  @override
  void dispose() {
    valuecont.dispose();
    super.dispose();
  }

  @override
  Widget content() {
    return Expanded(
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
            onSaved: (value) => widget.folder.attributes[widget.attributeIdx] = attribute.copyWith(name: value),
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
                    deleteIcon: const Icon(Icons.clear),
                    onDeleted: () => deleteValue(e),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: TextFormField(
                  controller: valuecont,
                  decoration: const InputDecoration(
                    labelText: 'Значение',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  onPressed: addValue,
                  icon: const Icon(Icons.add),
                  tooltip: 'Добавить значение атрибута',
                ),
              ),
            ],
          ),
        ],
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
