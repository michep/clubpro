import 'package:clubpro/api/api_catalogfolder.dart';
import 'package:clubpro/models/catalog/catalog_element.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/service/layout_service.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folder_grid_tile.dart';
import 'package:clubpro/ui/adminhomepage/widgets/catalog_folders_grid_back_tile.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_edit.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_grid_tile.dart';
import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductsGrid extends StatefulWidget {
  final CatalogFolder? folder;

  const ProductsGrid({
    this.folder,
    super.key,
  });

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final LayoutService layout = Get.find<LayoutService>();
  bool forceRefresh = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.folder == null ? const Text('/') : Text(widget.folder!.breadcrumbstring),
            ),
            Expanded(
              child: FutureBuilder<List<CatalogElement>>(
                future: widget.folder == null
                    ? CatalogFolder.getFoldersByParent(widget.folder, forceRefresh: forceRefresh)
                    : widget.folder!.subFoldersAndProducts(FolderProductType.all, forceRefresh: forceRefresh),
                builder: (context, snapshot) {
                  forceRefresh = false;
                  if (snapshot.connectionState != ConnectionState.done) return Utils.circularProgressIndicator();
                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        forceRefresh = true;
                      });
                    },
                    child: GridView.count(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: layout.currentSizing == DeviceScreenType.desktop
                          ? 6
                          : layout.currentSizing == DeviceScreenType.tablet
                              ? 3
                              : 2,
                      children: [
                        if (widget.folder != null)
                          CatalogFolderGridBackTile(
                            back: () => Get.back(id: 1),
                          ),
                        if (snapshot.data != null)
                          ...snapshot.data!
                              .whereType<CatalogFolder>()
                              .map((e) => CatalogFolderGridTile(
                                    folder: e,
                                    update: update,
                                    // editable: true,
                                    next: () => ProductsGrid(folder: e),
                                  ))
                              .toList(),
                        if (snapshot.data != null)
                          ...snapshot.data!
                              .whereType<Product>()
                              .map((e) => ProductGridTile(
                                    folder: widget.folder!,
                                    product: e,
                                    editable: true,
                                    update: update,
                                  ))
                              .toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        if (widget.folder != null)
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: createProduct,
                child: const Icon(Icons.add_outlined),
              ),
            ),
          ),
      ],
    );
  }

  void update(bool forceRefresh, VoidFunction func) {
    setState(() {
      this.forceRefresh = forceRefresh;
      func();
    });
  }

  Future<void> createProduct() async {
    var res = await Get.to<bool>(
        () => ProductEdit(
              product: Product.withFolder(parentFolderId: widget.folder!.id, folder: widget.folder!),
              folder: widget.folder!,
            ),
        id: 1);
    if (res is bool && res == true) {
      setState(() {
        forceRefresh = true;
      });
    }
  }
}
