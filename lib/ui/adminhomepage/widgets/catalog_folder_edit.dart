import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:clubpro/ui/shared/widget/image_field.dart';
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
  late final CatalogFolder originalFolder;
  late CatalogFolder folder;
  final TextEditingController namecont = TextEditingController();
  final TextEditingController ordercont = TextEditingController();
  final TextEditingController seocont = TextEditingController();
  final ScrollController scrollcont = ScrollController();
  final formKey = GlobalKey<FormState>();
  bool needToCheckPrevFile = false;

  @override
  void initState() {
    super.initState();
    folder = widget.folder;
    originalFolder = CatalogFolder.fromMap(folder.toMap());
    namecont.value = TextEditingValue(text: folder.name ?? '');
    seocont.value = TextEditingValue(text: folder.seo ?? '');
    ordercont.value = TextEditingValue(text: folder.order?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: SingleChildScrollView(
            controller: scrollcont,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageField(
                      fileset: widget.folder.pictures,
                      type: ImageFieldType.single,
                      dimention: 250,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: namecont,
                          decoration: const InputDecoration(
                            labelText: 'Название раздела каталога',
                          ),
                          validator: (value) => Utils.validateNotEmpty(value, 'Укажите название раздела'),
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
                        TextFormField(
                          controller: seocont,
                          minLines: 1,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            labelText: 'SEO текст',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                ),
                ...renderAttributes(),
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
                    onPressed: back,
                    child: const Text('BACK'),
                  ),
                ),
              ],
            ),
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

  List<Widget> renderAttributes() {
    List<Widget> res = [];
    for (int idx = 0; idx < folder.attributes.length; idx++) {
      res.add(CatalogFolderAttribute.factory(folder: folder, attributeIdx: idx, update: setState));
    }
    return res;
  }

  void addAttribute() {
    setState(() {
      folder.attributes.add(AttributeTemplate());
      scrollcont.animateTo(
        scrollcont.position.maxScrollExtent + 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  Future<void> saveFolder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      folder = folder.copyWith(
        name: namecont.text,
        seo: seocont.text,
        order: int.parse(ordercont.text),
      );
      await folder.save();
      Get.back<bool>(result: true, id: 1);
    }
  }

  Future<void> back() async {
    var refresh = (widget.folder != originalFolder);
    Get.back(result: refresh, id: 1);
  }
}
