import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/service/subnavigator_service.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class CatalogFoldersList extends StatefulWidget {
  final bool forceRefresh;
  const CatalogFoldersList({
    this.forceRefresh = false,
    super.key,
  });

  @override
  State<CatalogFoldersList> createState() => _CatalogFoldersListState();
}

class _CatalogFoldersListState extends State<CatalogFoldersList> {
  final _subnav = Get.find<SubNavigatorService>();
  bool forceRefresh = false;
  late Future<List<CatalogFolder>?> catalogFuture;

  @override
  void initState() {
    forceRefresh = widget.forceRefresh;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CatalogFoldersList oldWidget) {
    super.didUpdateWidget(oldWidget);
    forceRefresh = widget.forceRefresh;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<CatalogFolder?>(
            stream: _subnav.subnavStream.map<CatalogFolder?>((event) => event?.value as CatalogFolder?),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) return Utils.circularProgressIndicator();
              return FutureBuilder<List<CatalogFolder>?>(
                future: CatalogFolder.getFoldersByParent(snapshot.data, forceRefresh: forceRefresh),
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
                        if (_subnav.currentSubnav?.value != null)
                          ListTile(
                            onTap: () => _subnav.pop(),
                            leading: const Icon(Icons.chevron_left),
                            title: const Text('BACK'),
                          ),
                        if (snapshot.data != null)
                          ...snapshot.data!
                              .map((e) => ListTile(
                                    onTap: () => _subnav.push(SubNavigatorValue<CatalogFolder>(
                                      page: AppPages.admincatalog,
                                      value: e,
                                      forceRefresh: true,
                                    )),
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
              );
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: createFolder,
            child: const Icon(Icons.add_outlined),
          ),
        ),
      ],
    );
  }

  void editFolder(CatalogFolder folder) {
    _subnav.push(SubNavigatorValue<CatalogFolder>(
      page: AppPages.admineditcatalogfolder,
      value: folder,
      forceRefresh: true,
    ));
  }

  void createFolder() {
    _subnav.push(SubNavigatorValue<CatalogFolder>(
      page: AppPages.admineditcatalogfolder,
      value: CatalogFolder(parentFolderId: (_subnav.currentSubnav?.value as CatalogFolder?)?.id),
      forceRefresh: true,
    ));
  }
}
