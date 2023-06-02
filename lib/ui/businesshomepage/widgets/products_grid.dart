import 'dart:typed_data';

import 'package:clubpro/api/api_catalogfolder.dart';
import 'package:clubpro/models/catalog/catalog_element.dart';
import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  bool forceRefresh = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.folder == null ? const Text('/') : Text(widget.folder!.breadcrumbstring),
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
                      crossAxisCount: 6,
                      children: [
                        if (widget.folder != null)
                          GridTile(
                            child: InkWell(
                              onTap: () => Get.back(id: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.chevron_left),
                                      Text('BACK'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (snapshot.data != null)
                          ...snapshot.data!
                              .whereType<CatalogFolder>()
                              .map((e) => GridTile(
                                    child: FutureBuilder<Uint8List?>(
                                      future: e.pictureOrNoFile(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState != ConnectionState.done) return const SizedBox.shrink();
                                        return InkWell(
                                          onTap: () => Get.to(() => ProductsGrid(folder: e), id: 1),
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
                                                      Expanded(
                                                        child: Text(
                                                          e.name ?? '',
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: Image.memory(snapshot.data!).image,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ))
                              .toList(),
                        if (snapshot.data != null)
                          ...snapshot.data!
                              .whereType<Product>()
                              .map((e) => GridTile(
                                    child: InkWell(
                                      onTap: () {},
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
                                                  Expanded(
                                                    child: Text(
                                                      e.name ?? '',
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () => editProduct(e),
                                                    icon: const Icon(Icons.edit),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: FutureBuilder<Uint8List?>(
                                                future: e.pictureOrNoFile(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState != ConnectionState.done || snapshot.data!.isEmpty) {
                                                    return const SizedBox.shrink();
                                                  }
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

  Future<void> editProduct(Product product) async {
    var res = await Get.to<bool>(
        () => ProductEdit(
              product: product,
              folder: widget.folder!,
            ),
        id: 1);
    if (res is bool && res == true) {
      setState(() {
        forceRefresh = true;
      });
    }
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
