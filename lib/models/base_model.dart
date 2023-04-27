import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

// @MappableClass(generateMethods: GenerateMethods.all & ~GenerateMethods.copy)
@MappableClass()
class BaseModel with BaseModelMappable {
  final String id;
  final DateTime createDate;

  BaseModel({
    required this.id,
    required this.createDate,
  });

  final fromMap = BaseModelMapper.fromMap;
  final fromJson = BaseModelMapper.fromJson;

  void save() {
    print(toMap());
  }
}
