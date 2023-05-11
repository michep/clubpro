// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'base_model.dart';

class BaseModelMapper extends ClassMapperBase<BaseModel> {
  BaseModelMapper._();

  static BaseModelMapper? _instance;
  static BaseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseModelMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BaseModel';

  static String? _$id(BaseModel v) => v.id;
  static const Field<BaseModel, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);

  @override
  final Map<Symbol, Field<BaseModel, dynamic>> fields = const {
    #id: _f$id,
  };

  static BaseModel _instantiate(DecodingData data) {
    return BaseModel(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static BaseModel fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BaseModel>(map));
  }

  static BaseModel fromJson(String json) {
    return _guard((c) => c.fromJson<BaseModel>(json));
  }
}

mixin BaseModelMappable {
  String toJson() {
    return BaseModelMapper._guard((c) => c.toJson(this as BaseModel));
  }

  Map<String, dynamic> toMap() {
    return BaseModelMapper._guard((c) => c.toMap(this as BaseModel));
  }

  BaseModelCopyWith<BaseModel, BaseModel, BaseModel> get copyWith =>
      _BaseModelCopyWithImpl(this as BaseModel, $identity, $identity);
  @override
  String toString() {
    return BaseModelMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BaseModelMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BaseModelMapper._guard((c) => c.hash(this));
  }
}

extension BaseModelValueCopy<$R, $Out> on ObjectCopyWith<$R, BaseModel, $Out> {
  BaseModelCopyWith<$R, BaseModel, $Out> get $asBaseModel =>
      $base.as((v, t, t2) => _BaseModelCopyWithImpl(v, t, t2));
}

abstract class BaseModelCopyWith<$R, $In extends BaseModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  BaseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BaseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BaseModel, $Out>
    implements BaseModelCopyWith<$R, BaseModel, $Out> {
  _BaseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BaseModel> $mapper =
      BaseModelMapper.ensureInitialized();
  @override
  $R call({Object? id = $none}) =>
      $apply(FieldCopyWithData({if (id != $none) #id: id}));
  @override
  BaseModel $make(CopyWithData data) =>
      BaseModel(id: data.get(#id, or: $value.id));

  @override
  BaseModelCopyWith<$R2, BaseModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BaseModelCopyWithImpl($value, $cast, t);
}
