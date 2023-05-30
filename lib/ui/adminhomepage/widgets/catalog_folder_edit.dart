import 'package:clubpro/api/api_filestore.dart';
import 'package:clubpro/models/attribute_template/attribute_template.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_attribute.dart';
import 'package:file_picker/file_picker.dart';
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
  void dispose() {
    _cleanupPrevPicture(needToCheckPrevFile, folder.pictureFileId);
    super.dispose();
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
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                        maxHeight: 250,
                      ),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          FutureBuilder<Uint8List?>(
                            future: folder.pictureOrNoFile(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) return const SizedBox.shrink();
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Image.memory(snapshot.data!).image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              child: PopupMenuButton<String>(
                                itemBuilder: (context) {
                                  return const [
                                    PopupMenuItem(
                                      value: 'change',
                                      child: Text('Изменить картинку'),
                                    ),
                                    PopupMenuItem(
                                      value: 'clear',
                                      child: Text('Убрать картинку'),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  if (value == 'change') pickpicture();
                                  if (value == 'clear') clearpicture();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          maxLines: 4,
                          minLines: 2,
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

  Future<void> pickpicture() async {
    var res = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (res != null && res.count > 0) {
      var fileid = await ApiFilestore.uploadFile(res.names[0]!, res.files[0].bytes!);
      _cleanupPrevPicture(needToCheckPrevFile, folder.pictureFileId);
      setState(() {
        folder = folder.copyWith(pictureFileId: fileid);
        needToCheckPrevFile = true;
      });
    }
  }

  Future<void> clearpicture() async {
    if (folder.pictureFileId != null) {
      _cleanupPrevPicture(needToCheckPrevFile, folder.pictureFileId);
      setState(() {
        folder = folder.copyWith(pictureFileId: null);
        needToCheckPrevFile = true;
      });
    }
  }

  Future<void> saveFolder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      folder = folder.copyWith(
        name: namecont.text,
        seo: seocont.text,
        order: int.parse(ordercont.text),
      );
      await folder.save();
      _cleanupPrevPicture(true, originalFolder.pictureFileId);
      needToCheckPrevFile = false;
      Get.back<bool>(result: true, id: 1);
    }
  }

  Future<void> back() async {
    var refresh = (widget.folder != originalFolder);
    Get.back(result: refresh, id: 1);
  }

  Future<void> _cleanupPrevPicture(bool check, String? fileId) async {
    if (check && folder.pictureFileId != originalFolder.pictureFileId && fileId != null) {
      ApiFilestore.deleteFile(fileId);
    }
  }
}
