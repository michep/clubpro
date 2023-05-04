import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

@MappableClass()
class BaseModel with BaseModelMappable {
  @MappableField(key: '_id')
  final String id;

  BaseModel({
    required this.id,
  });

  void save() {
    print(toJson());
  }
}
