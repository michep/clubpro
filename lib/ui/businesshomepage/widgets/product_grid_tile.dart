import 'dart:typed_data';

import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_edit.dart';
import 'package:clubpro/ui/shared/widget/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductGridTile extends StatelessWidget {
  final CatalogFolder folder;
  final Product product;
  final void Function(bool, VoidFunction) update;
  final bool editable;

  const ProductGridTile({
    required this.folder,
    required this.product,
    required this.update,
    this.editable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
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
                        product.name ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (editable)
                      IconButton(
                        onPressed: () => editProduct(product),
                        icon: const Icon(Icons.edit),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<Uint8List?>(
                  future: product.pictureOrNoFile(),
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
    );
  }

  Future<void> editProduct(Product product) async {
    var res = await Get.to<bool>(
        () => ProductEdit(
              product: product,
              folder: folder,
            ),
        id: 1);
    if (res is bool && res == true) {
      update(true, () {});
    }
  }
}
