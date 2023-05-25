import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogFolderEdit extends StatefulWidget {
  final CatalogFolder folder;

  const CatalogFolderEdit({
    required this.folder,
    super.key,
  });

  @override
  State<CatalogFolderEdit> createState() => _CatalogFolderEditState();
}

class _CatalogFolderEditState extends State<CatalogFolderEdit> {
  final TextEditingController namecont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.folder.name != null) {
      namecont.value = TextEditingValue(text: widget.folder.name!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: namecont,
            decoration: const InputDecoration(
              labelText: 'Имя папки каталога',
            ),
            validator: (value) => Utils.validateNotEmpty(value, 'Укажите имя папки'),
            textInputAction: TextInputAction.next,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...renderAttributes(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: addAttribute,
              child: const Text('Добавить атрибут'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: saveFolder,
              child: const Text('Сохранить'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextButton(
              onPressed: () => Get.back(id: 1),
              child: const Text('BACK'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveFolder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      CatalogFolder folder = widget.folder.copyWith(name: namecont.text);
      await folder.save();
      Get.back<bool>(result: true, id: 1);
    }
  }

  List<Widget> renderAttributes() {
    List<Widget> res = [];
    for (int i = 0; i < widget.folder.attributes.length; i++) {
      res.add(CatalogFolderAttribute(folder: widget.folder, attributeIdx: i, update: () => setState(() {})));
    }
    return res;
  }

  void addAttribute() {
    setState(() {
      widget.folder.attributes.add(AttributeTemplate());
    });
  }
}
