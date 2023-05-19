import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

@MappableClass(discriminatorKey: '_baseType')
class BaseModel with BaseModelMappable {
  @MappableField(key: '_id')
  String? id;

  BaseModel({
    this.id,
  });
}

extension BaseModelMethods on BaseModel {}
