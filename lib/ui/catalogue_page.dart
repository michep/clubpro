import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/ui/adminhomepage/widgets/add_catalog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CataloguePage extends StatelessWidget {
  final CatalogFolder? parentFolder;
  const CataloguePage({required this.parentFolder, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parentFolder != null ? parentFolder!.name! : 'Корневая папка'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: FutureBuilder<List<CatalogFolder>?>(
              future: CatalogFolder.getFoldersByParent(parentFolder),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Не удалось получить данные.'),
                  );
                }
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('В этом каталоге нет содержимых каталогов.'),
                  );
                }
                List<CatalogFolder> childcatalogs = snapshot.data!;
                return ListView.builder(itemBuilder: (context, index) {
                  CatalogFolder catalog = childcatalogs[index];
                  return ListTile(
                    title: Text(catalog.name!),
                    leading: const Icon(Icons.folder),
                    onTap: () {
                      Get.to(() => CataloguePage(parentFolder: catalog));
                    },
                  );
                });
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddCatalogPage(parentCatalog: parentFolder));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
