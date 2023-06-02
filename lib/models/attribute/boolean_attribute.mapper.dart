// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'boolean_attribute.dart';

class BooleanAttributeMapper extends SubClassMapperBase<BooleanAttribute> {
  BooleanAttributeMapper._();

  static BooleanAttributeMapper? _instance;
  static BooleanAttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BooleanAttributeMapper._());
      AttributeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BooleanAttribute';

  static String? _$name(BooleanAttribute v) => v.name;
  static const Field<BooleanAttribute, String> _f$name =
      Field('name', _$name, opt: true);
  static bool? _$value(BooleanAttribute v) => v.value;
  static const Field<BooleanAttribute, bool> _f$value =
      Field('value', _$value, opt: true);

  @override
  final Map<Symbol, Field<BooleanAttribute, dynamic>> fields = const {
    #name: _f$name,
    #value: _f$value,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'BooleanAttribute';
  @override
  late final ClassMapperBase superMapper = AttributeMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: []);
  }

  static BooleanAttribute _instantiate(DecodingData data) {
    return BooleanAttribute(name: data.dec(_f$name), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static BooleanAttribute fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BooleanAttribute>(map));
  }

  static BooleanAttribute fromJson(String json) {
    return _guard((c) => c.fromJson<BooleanAttribute>(json));
  }
}

mixin BooleanAttributeMappable {
  String toJson() {
    return BooleanAttributeMapper._guard(
        (c) => c.toJson(this as BooleanAttribute));
  }

  Map<String, dynamic> toMap() {
    return BooleanAttributeMapper._guard(
        (c) => c.toMap(this as BooleanAttribute));
  }

  BooleanAttributeCopyWith<BooleanAttribute, BooleanAttribute, BooleanAttribute>
      get copyWith => _BooleanAttributeCopyWithImpl(
          this as BooleanAttribute, $identity, $identity);
  @override
  String toString() {
    return BooleanAttributeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BooleanAttributeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BooleanAttributeMapper._guard((c) => c.hash(this));
  }
}

extension BooleanAttributeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BooleanAttribute, $Out> {
  BooleanAttributeCopyWith<$R, BooleanAttribute, $Out>
      get $asBooleanAttribute =>
          $base.as((v, t, t2) => _BooleanAttributeCopyWithImpl(v, t, t2));
}

abstract class BooleanAttributeCopyWith<$R, $In extends BooleanAttribute, $Out>
    implements AttributeCopyWith<$R, $In, $Out, bool> {
  @override
  $R call({String? name, bool? value});
  BooleanAttributeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BooleanAttributeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BooleanAttribute, $Out>
    implements BooleanAttributeCopyWith<$R, BooleanAttribute, $Out> {
  _BooleanAttributeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BooleanAttribute> $mapper =
      BooleanAttributeMapper.ensureInitialized();
  @override
  $R call({Object? name = $none, Object? value = $none}) =>
      $apply(FieldCopyWithData(
          {if (name != $none) #name: name, if (value != $none) #value: value}));
  @override
  BooleanAttribute $make(CopyWithData data) => BooleanAttribute(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value));

  @override
  BooleanAttributeCopyWith<$R2, BooleanAttribute, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BooleanAttributeCopyWithImpl($value, $cast, t);
}
