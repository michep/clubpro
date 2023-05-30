import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:clubpro/models/attribute_template/int_attribute_template.dart';
import 'package:clubpro/models/attribute_template/real_attribute_template.dart';
import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:clubpro/models/attribute_template/text_attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/ui/adminhomepage/widgets/boolean_folder_attribute.dart';
import 'package:clubpro/ui/adminhomepage/widgets/int_folder_attribute.dart';
import 'package:clubpro/ui/adminhomepage/widgets/real_folder_attribute.dart';
import 'package:clubpro/ui/adminhomepage/widgets/select_folder_attribute.dart';
import 'package:clubpro/ui/adminhomepage/widgets/text_folder_attribute.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';

class CatalogFolderAttribute extends StatefulWidget {
  final CatalogFolder folder;
  final int attributeIdx;
  final void Function(VoidFunction) update;

  const CatalogFolderAttribute({
    required this.folder,
    required this.attributeIdx,
    required this.update,
    super.key,
  });

  factory CatalogFolderAttribute.factory({
    required CatalogFolder folder,
    required int attributeIdx,
    required void Function(VoidFunction) update,
    Key? key,
  }) {
    switch (folder.attributes[attributeIdx].runtimeType) {
      case BooleanAttributeTemplate:
        return BooleanCatalogFolderAttribute(folder: folder, attributeIdx: attributeIdx, update: update);
      case TextAttributeTemplate:
        return TextCatalogFolderAttribute(folder: folder, attributeIdx: attributeIdx, update: update);
      case SelectAttributeTemplate:
        return SelectCatalogFolderAttribute(folder: folder, attributeIdx: attributeIdx, update: update);
      case IntAttributeTemplate:
        return IntCatalogFolderAttribute(folder: folder, attributeIdx: attributeIdx, update: update);
      case RealAttributeTemplate:
        return RealCatalogFolderAttribute(folder: folder, attributeIdx: attributeIdx, update: update);
      default:
        return CatalogFolderAttribute(folder: folder, attributeIdx: attributeIdx, update: update);
    }
  }

  @override
  State<CatalogFolderAttribute> createState() => CatalogFolderAttributeState();
}

class CatalogFolderAttributeState<T extends CatalogFolderAttribute, U extends AttributeTemplate> extends State<T> {
  final TextEditingController namecont = TextEditingController();
  late U attribute;

  @override
  void initState() {
    super.initState();
    attribute = widget.folder.attributes[widget.attributeIdx] as U;
    namecont.value = TextEditingValue(text: attribute.name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            content(),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: deleteAttribute,
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Выберите тип атрибута',
        ),
        items: const [
          DropdownMenuItem(value: 'boolean', child: Text('Логический атрибут')),
          DropdownMenuItem(value: 'select', child: Text('Атрибут выбора одного значения')),
          DropdownMenuItem(value: 'text', child: Text('Текстовый атрибут')),
          DropdownMenuItem(value: 'int', child: Text('Целый числовой атрибут')),
          DropdownMenuItem(value: 'real', child: Text('Десятичный числовой атрибут')),
        ],
        validator: (value) => Utils.validateNotEmpty(value, 'Нужно выбрать тип атрибута'),
        onChanged: (value) {
          switch (value) {
            case 'boolean':
              widget.update(() => widget.folder.attributes[widget.attributeIdx] = BooleanAttributeTemplate());
              break;
            case 'select':
              widget.update(() => widget.folder.attributes[widget.attributeIdx] = SelectAttributeTemplate());
              break;
            case 'text':
              widget.update(() => widget.folder.attributes[widget.attributeIdx] = TextAttributeTemplate());
              break;
            case 'int':
              widget.update(() => widget.folder.attributes[widget.attributeIdx] = IntAttributeTemplate());
              break;
            case 'real':
              widget.update(() => widget.folder.attributes[widget.attributeIdx] = RealAttributeTemplate());
              break;
          }
        },
      ),
    );
  }

  void deleteAttribute() {
    widget.update(() => widget.folder.attributes.removeAt(widget.attributeIdx));
  }
}
