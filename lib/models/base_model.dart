import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

@MappableClass()
class BaseModel with BaseModelMappable {
  final String id;
  final DateTime createDate;

  BaseModel({
    required this.id,
    required this.createDate,
  });

  void save() {
    print(toJson());
  }
}
