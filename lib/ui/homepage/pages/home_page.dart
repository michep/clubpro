import 'package:clubpro/api/api_filestore.dart';
import 'package:clubpro/models/app_menu.dart';
import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/service/security_service.dart';
import 'package:clubpro/ui/shared/widget/scaffold_root.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _sec = Get.find<SecurityService>();
  Widget? image;

  @override
  Widget build(BuildContext context) {
    return ScaffoldRoot(
      appMenu: AppMenu(
        header: Text('ТЫРЫПЫРЫ'),
        items: [AppMenuItem(title: Text('Тырыпыры'), icon: Icons.star)],
        bottomItems: [AppMenuItem(title: Text('Выход'), icon: Icons.logout, action: logout)],
      ),
      child: Column(
        children: [
          Text(_sec.currentUser!.firstName!),
          ElevatedButton(
            onPressed: logout,
            child: const Text('Выйти из приложения'),
          ),
          ElevatedButton(
            onPressed: pickavatar,
            child: const Text('Выбрать аватар'),
          ),
          ElevatedButton(
            onPressed: showavatar,
            child: const Text('Показать аватар'),
          ),
          if (image != null) image!,
        ],
      ),
    );
  }

  void logout() async {
    await _sec.logout();
  }

  Future<void> pickavatar() async {
    var res = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (res != null && res.count > 0) {
      var fileid = await ApiFilestore.uploadFile(res.names[0]!, res.files[0].bytes!);
      var user = _sec.currentUser!.copyWith(avatarFileId: fileid);
      user.save();
      _sec.setCurrentUser(user);
    }
  }

  Future<void> showavatar() async {
    var data = await _sec.currentUser!.avatar();
    if (data != null) {
      setState(() {
        image = Image.memory(data);
      });
    }
  }
}
