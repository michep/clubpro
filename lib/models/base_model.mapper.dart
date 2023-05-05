// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'base_model.dart';

class BaseModelMapper extends MapperBase<BaseModel> {
  static MapperContainer container = MapperContainer(
    mappers: {BaseModelMapper()},
  );

  @override
  BaseModelMapperElement createElement(MapperContainer container) {
    return BaseModelMapperElement._(this, container);
  }

  @override
  String get id => 'BaseModel';

  static final fromMap = container.fromMap<BaseModel>;
  static final fromJson = container.fromJson<BaseModel>;
}

class BaseModelMapperElement extends MapperElementBase<BaseModel> {
  BaseModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  BaseModel decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  BaseModel fromMap(Map<String, dynamic> map) =>
      BaseModel(id: container.$getOpt(map, '_id'));

  @override
  Function get encoder => encode;
  dynamic encode(BaseModel v) => toMap(v);
  Map<String, dynamic> toMap(BaseModel b) =>
      {'_id': container.$enc(b.id, 'id')};

  @override
  String stringify(BaseModel self) =>
      'BaseModel(id: ${container.asString(self.id)})';
  @override
  int hash(BaseModel self) => container.hash(self.id);
  @override
  bool equals(BaseModel self, BaseModel other) =>
      container.isEqual(self.id, other.id);
}

mixin BaseModelMappable {
  String toJson() => BaseModelMapper.container.toJson(this as BaseModel);
  Map<String, dynamic> toMap() =>
      BaseModelMapper.container.toMap(this as BaseModel);
  BaseModelCopyWith<BaseModel, BaseModel, BaseModel> get copyWith =>
      _BaseModelCopyWithImpl(this as BaseModel, $identity, $identity);
  @override
  String toString() => BaseModelMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BaseModelMapper.container.isEqual(this, other));
  @override
  int get hashCode => BaseModelMapper.container.hash(this);
}

extension BaseModelValueCopy<$R, $Out extends BaseModel>
    on ObjectCopyWith<$R, BaseModel, $Out> {
  BaseModelCopyWith<$R, BaseModel, $Out> get asBaseModel =>
      base.as((v, t, t2) => _BaseModelCopyWithImpl(v, t, t2));
}

typedef BaseModelCopyWithBound = BaseModel;

abstract class BaseModelCopyWith<$R, $In extends BaseModel,
    $Out extends BaseModel> implements ObjectCopyWith<$R, $In, $Out> {
  BaseModelCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends BaseModel>(
      Then<BaseModel, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? id});
}

class _BaseModelCopyWithImpl<$R, $Out extends BaseModel>
    extends CopyWithBase<$R, BaseModel, $Out>
    implements BaseModelCopyWith<$R, BaseModel, $Out> {
  _BaseModelCopyWithImpl(super.value, super.then, super.then2);
  @override
  BaseModelCopyWith<$R2, BaseModel, $Out2> chain<$R2, $Out2 extends BaseModel>(
          Then<BaseModel, $Out2> t, Then<$Out2, $R2> t2) =>
      _BaseModelCopyWithImpl($value, t, t2);

  @override
  $R call({Object? id = $none}) => $then(BaseModel(id: or(id, $value.id)));
}
