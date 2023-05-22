import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/admin_page_service.dart';
import 'package:clubpro/service/catalog_folders_list_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogFoldersList extends StatelessWidget {
  final _catalogfolder = Get.find<CatalogFolderService>();
  final _adminpage = Get.find<AdminPageService>();

  CatalogFoldersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<CatalogFolder?>(
            stream: _catalogfolder.currentFolderStream,
            builder: (context, snapshot) {
              return FutureBuilder<List<CatalogFolder>?>(
                future: CatalogFolder.getFoldersByParent(snapshot.data),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) return const CircularProgressIndicator();
                  return ListView(
                    children: [
                      if (_catalogfolder.currentFolder != null)
                        ListTile(
                          onTap: () => _catalogfolder.back(),
                          title: const Text('BACK'),
                        ),
                      if (snapshot.data != null)
                        ...snapshot.data!
                            .map((e) => ListTile(
                                  onTap: () => _catalogfolder.setCatalogFolder(e),
                                  title: Text(e.name!),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.edit_outlined),
                                    onPressed: () {},
                                  ),
                                ))
                            .toList(),
                    ],
                  );
                },
              );
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              _adminpage.setParentFolder(_catalogfolder.currentFolder);
              _adminpage.setAdminPage(AdminPages.addcatalog);
            },
            child: const Icon(Icons.add_outlined),
          ),
        ),
      ],
    );
  }
}
