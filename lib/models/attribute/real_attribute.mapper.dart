// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'real_attribute.dart';

class RealAttributeMapper extends SubClassMapperBase<RealAttribute> {
  RealAttributeMapper._();

  static RealAttributeMapper? _instance;
  static RealAttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RealAttributeMapper._());
      AttributeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'RealAttribute';

  static String? _$name(RealAttribute v) => v.name;
  static const Field<RealAttribute, String> _f$name =
      Field('name', _$name, opt: true);
  static double? _$value(RealAttribute v) => v.value;
  static const Field<RealAttribute, double> _f$value =
      Field('value', _$value, opt: true);

  @override
  final Map<Symbol, Field<RealAttribute, dynamic>> fields = const {
    #name: _f$name,
    #value: _f$value,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'RealAttribute';
  @override
  late final ClassMapperBase superMapper = AttributeMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: []);
  }

  static RealAttribute _instantiate(DecodingData data) {
    return RealAttribute(name: data.dec(_f$name), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static RealAttribute fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<RealAttribute>(map));
  }

  static RealAttribute fromJson(String json) {
    return _guard((c) => c.fromJson<RealAttribute>(json));
  }
}

mixin RealAttributeMappable {
  String toJson() {
    return RealAttributeMapper._guard((c) => c.toJson(this as RealAttribute));
  }

  Map<String, dynamic> toMap() {
    return RealAttributeMapper._guard((c) => c.toMap(this as RealAttribute));
  }

  RealAttributeCopyWith<RealAttribute, RealAttribute, RealAttribute>
      get copyWith => _RealAttributeCopyWithImpl(
          this as RealAttribute, $identity, $identity);
  @override
  String toString() {
    return RealAttributeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RealAttributeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return RealAttributeMapper._guard((c) => c.hash(this));
  }
}

extension RealAttributeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RealAttribute, $Out> {
  RealAttributeCopyWith<$R, RealAttribute, $Out> get $asRealAttribute =>
      $base.as((v, t, t2) => _RealAttributeCopyWithImpl(v, t, t2));
}

abstract class RealAttributeCopyWith<$R, $In extends RealAttribute, $Out>
    implements AttributeCopyWith<$R, $In, $Out, double> {
  @override
  $R call({String? name, double? value});
  RealAttributeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RealAttributeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RealAttribute, $Out>
    implements RealAttributeCopyWith<$R, RealAttribute, $Out> {
  _RealAttributeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RealAttribute> $mapper =
      RealAttributeMapper.ensureInitialized();
  @override
  $R call({Object? name = $none, Object? value = $none}) =>
      $apply(FieldCopyWithData(
          {if (name != $none) #name: name, if (value != $none) #value: value}));
  @override
  RealAttribute $make(CopyWithData data) => RealAttribute(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value));

  @override
  RealAttributeCopyWith<$R2, RealAttribute, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RealAttributeCopyWithImpl($value, $cast, t);
}
