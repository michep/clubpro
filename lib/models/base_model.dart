import 'package:clubpro/models/catalog_folder.dart';
import 'package:clubpro/models/product.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

@MappableClass(discriminatorKey: 'model', includeSubClasses: [UserAccount, CatalogFolder, Product])
class BaseModel with BaseModelMappable {
  @MappableField(key: '_id')
  final String? id;

  BaseModel({
    this.id,
  });

  void save() {
    throw UnimplementedError;
  }
}
