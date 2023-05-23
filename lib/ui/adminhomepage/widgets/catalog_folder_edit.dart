import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/subnavigator_service.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogFolderEdit extends StatefulWidget {
  const CatalogFolderEdit({super.key});

  @override
  State<CatalogFolderEdit> createState() => _CatalogFolderEditState();
}

class _CatalogFolderEditState extends State<CatalogFolderEdit> {
  final TextEditingController namecont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _subnav = Get.find<SubNavigatorService>();
  late final CatalogFolder subject;

  @override
  void initState() {
    super.initState();
    subject = _subnav.currentSubnav?.value!;
    if (subject.name != null) {
      namecont.value = TextEditingValue(text: subject.name!);
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
              labelText: 'Имя папки',
            ),
            validator: (value) => Utils.validateNotEmpty(value, 'Укажите имя папки'),
            textInputAction: TextInputAction.next,
          ),
          ...renderAttributes(),
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
              onPressed: () => _subnav.pop(),
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
      CatalogFolder folder = subject.copyWith(name: namecont.text);
      await folder.save();
      _subnav.pop();
    }
  }

  List<Widget> renderAttributes() {
    return [];
  }

  void addAttribute() {
    setState(() {
      subject.attributes.add(AttributeTemplate());
    });
  }
}
