import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/models/attribute_template/boolean_attribute_template.dart';
import 'package:clubpro/models/attribute_template/select_attribute_template.dart';
import 'package:clubpro/models/attribute_template/text_attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/ui/adminhomepage/widgets/boolean_folder_attribute.dart';
import 'package:clubpro/ui/adminhomepage/widgets/select_folder_attribute.dart';
import 'package:clubpro/ui/adminhomepage/widgets/text_folder_attribute.dart';
import 'package:flutter/material.dart';

class CatalogFolderAttribute extends StatefulWidget {
  final CatalogFolder folder;
  final int attributeIdx;
  final VoidFunction update;

  const CatalogFolderAttribute({
    required this.folder,
    required this.attributeIdx,
    required this.update,
    super.key,
  });

  @override
  State<CatalogFolderAttribute> createState() => _CatalogFolderAttributeState();
}

class _CatalogFolderAttributeState extends State<CatalogFolderAttribute> {
  @override
  Widget build(BuildContext context) {
    switch (widget.folder.attributes[widget.attributeIdx].runtimeType) {
      case BooleanAttributeTemplate:
        return BooleanCatalogFolderAttribute(folder: widget.folder, attributeIdx: widget.attributeIdx, update: widget.update);
      case SelectAttributeTemplate:
        return SelectCatalogFolderAttribute(folder: widget.folder, attributeIdx: widget.attributeIdx, update: widget.update);
      case TextAttributeTemplate:
        return TextCatalogFolderAttribute(folder: widget.folder, attributeIdx: widget.attributeIdx, update: widget.update);
      default:
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'boolean', child: Text('Логический атрибут')),
                DropdownMenuItem(value: 'select', child: Text('Атрибут выбора одного значения')),
                DropdownMenuItem(value: 'text', child: Text('Текстовый атрибут')),
              ],
              onChanged: (value) {
                switch (value) {
                  case 'boolean':
                    widget.folder.attributes[widget.attributeIdx] = BooleanAttributeTemplate();
                    widget.update();
                    break;
                  case 'select':
                    widget.folder.attributes[widget.attributeIdx] = SelectAttributeTemplate();
                    widget.update();
                    break;
                  case 'text':
                    widget.folder.attributes[widget.attributeIdx] = TextAttributeTemplate();
                    widget.update();
                    break;
                }
              },
            ),
          ),
        );
    }
  }
}