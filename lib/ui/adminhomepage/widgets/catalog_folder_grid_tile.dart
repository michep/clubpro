import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_edit.dart';
import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogFolderGridTile extends StatelessWidget {
  final CatalogFolder folder;
  final void Function(bool, VoidFunction) update;
  final Widget Function() next;
  final bool editable;

  const CatalogFolderGridTile({
    required this.folder,
    required this.update,
    required this.next,
    this.editable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: () => Get.to(next, id: 1),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.folder_outlined),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          folder.name ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (editable)
                      IconButton(
                        onPressed: () => editFolder(folder),
                        icon: const Icon(Icons.edit),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: folder.pictureOrNoFile(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) return const SizedBox.shrink();
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editFolder(CatalogFolder folder) async {
    var res = await Get.to<bool>(() => CatalogFolderEdit(folder: folder), id: 1);
    if (res is bool && res == true) {
      update(true, () {});
    }
  }
}
