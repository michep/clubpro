import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogFoldersList extends StatefulWidget {
  final CatalogFolder? folder;

  const CatalogFoldersList({
    this.folder,
    super.key,
  });

  @override
  State<CatalogFoldersList> createState() => _CatalogFoldersListState();
}

class _CatalogFoldersListState extends State<CatalogFoldersList> {
  bool forceRefresh = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<CatalogFolder>?>(
          future: CatalogFolder.getFoldersByParent(widget.folder, forceRefresh: forceRefresh),
          builder: (context, snapshot) {
            forceRefresh = false;
            if (snapshot.connectionState != ConnectionState.done) return Utils.circularProgressIndicator();
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  forceRefresh = true;
                });
              },
              child: ListView(
                children: [
                  if (widget.folder != null)
                    ListTile(
                      onTap: () => Get.back(id: 1),
                      leading: const Icon(Icons.chevron_left),
                      title: const Text('BACK'),
                    ),
                  if (snapshot.data != null)
                    ...snapshot.data!
                        .map((e) => ListTile(
                              onTap: () => Get.to(() => CatalogFoldersList(folder: e), id: 1),
                              title: Text(e.name!),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit_outlined),
                                onPressed: () => editFolder(e),
                              ),
                            ))
                        .toList(),
                ],
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: createFolder,
              child: const Icon(Icons.add_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> editFolder(CatalogFolder folder) async {
    var res = await Get.to<bool>(() => CatalogFolderEdit(folder: folder), id: 1);
    if (res is bool && res == true) {
      setState(() {
        forceRefresh = true;
      });
    }
  }

  Future<void> createFolder() async {
    var res = await Get.to<bool>(() => CatalogFolderEdit(folder: CatalogFolder(parentFolderId: widget.folder?.id)), id: 1);
    if (res is bool && res == true) {
      setState(() {
        forceRefresh = true;
      });
    }
  }
}
