import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/admin_page_service.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCatalogPage extends StatefulWidget {
  final CatalogFolder? parentCatalog;
  const AddCatalogPage({required this.parentCatalog, super.key});

  @override
  State<AddCatalogPage> createState() => _AddCatalogPageState();
}

class _AddCatalogPageState extends State<AddCatalogPage> {
  final TextEditingController namecont = TextEditingController();
  final TextEditingController passcont = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _adminpage = Get.find<AdminPageService>();

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
            validator: (value) => Utils.validateNotEmpty(value, 'Укажите имя новой папки'),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: createFolder,
                child: const Text('Создать'),
              ),
            ),
          // TextFormField(
          //   controller: passcont,
          //   obscureText: true,
          //   enableSuggestions: false,
          //   decoration: const InputDecoration(
          //     labelText: 'Пароль',
          //   ),
          //   validator: (value) => Utils.validateNotEmpty(value, 'Укажите пароль для входа'),
          //   // onEditingComplete: login,
          // ),
        ],
      ),
    );
  }

  Future createFolder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      CatalogFolder folder = CatalogFolder(name: namecont.text, parentFolderId: widget.parentCatalog?.id);
      await folder.save();
      _adminpage.setAdminPage(AdminPages.catalog);
    }
  }
}
