import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController ordercont = TextEditingController();
  final ScrollController scrollcont = ScrollController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.folder.name != null) {
      namecont.value = TextEditingValue(text: widget.folder.name!);
      ordercont.value = TextEditingValue(text: widget.folder.order?.toString() ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
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
              TextFormField(
                controller: ordercont,
                decoration: const InputDecoration(
                  labelText: 'Порядковый номер',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) => Utils.validateNotEmpty(value, 'Укажите порядковый номер'),
                textInputAction: TextInputAction.next,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollcont,
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
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: addAttribute,
              child: const Icon(Icons.add_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> saveFolder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      CatalogFolder folder = widget.folder.copyWith(
        name: namecont.text,
        order: int.parse(ordercont.text),
      );
      await folder.save();
      Get.back<bool>(result: true, id: 1);
    }
  }

  List<Widget> renderAttributes() {
    List<Widget> res = [];
    for (int i = 0; i < widget.folder.attributes.length; i++) {
      res.add(CatalogFolderAttribute(folder: widget.folder, attributeIdx: i, update: setState));
    }
    return res;
  }

  void addAttribute() {
    setState(() {
      widget.folder.attributes.add(AttributeTemplate());
      scrollcont.animateTo(
        scrollcont.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
}
