import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:clubpro/models/catalog/product.dart';
import 'package:clubpro/service/utils.dart';
import 'package:clubpro/ui/businesshomepage/widgets/product_attribute.dart';
import 'package:clubpro/ui/shared/widget/image_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductEdit extends StatefulWidget {
  final CatalogFolder folder;
  final Product product;

  const ProductEdit({
    required this.product,
    required this.folder,
    super.key,
  });

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  late final Product originalProduct;
  late Product product;
  final TextEditingController namecont = TextEditingController();
  final ScrollController scrollcont = ScrollController();
  final formKey = GlobalKey<FormState>();
  bool needToCheckPrevFile = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    originalProduct = Product.fromMap(product.toMap());
    namecont.value = TextEditingValue(text: product.name ?? '');
  }

  @override
  void dispose() {
    namecont.dispose();
    scrollcont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageField(
                      fileset: widget.product.pictures,
                      type: ImageFieldType.multiple,
                      dimention: 250,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: namecont,
                          decoration: const InputDecoration(
                            labelText: 'Название продукта',
                          ),
                          validator: (value) => Utils.validateNotEmpty(value, 'Укажите название продукта'),
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                ),
                ...renderAttributes(),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: saveProduct,
                    child: const Text('Сохранить'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextButton(
                    onPressed: back,
                    child: const Text('BACK'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> renderAttributes() {
    List<Widget> res = [];
    for (int idx = 0; idx < widget.folder.attributes.length; idx++) {
      res.add(ProductAttribute.factory(product: widget.product, attributeIdx: idx, update: setState));
    }
    return res;
  }

  Future<void> saveProduct() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      product = product.copyWith(
        name: namecont.text,
      );
      await product.save();
      Get.back<bool>(result: true, id: 1);
    }
  }

  Future<void> back() async {
    var refresh = (widget.product != originalProduct);
    Get.back(result: refresh, id: 1);
  }
}
