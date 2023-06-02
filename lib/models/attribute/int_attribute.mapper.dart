// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'int_attribute.dart';

class IntAttributeMapper extends SubClassMapperBase<IntAttribute> {
  IntAttributeMapper._();

  static IntAttributeMapper? _instance;
  static IntAttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntAttributeMapper._());
      AttributeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'IntAttribute';

  static String? _$name(IntAttribute v) => v.name;
  static const Field<IntAttribute, String> _f$name =
      Field('name', _$name, opt: true);
  static int? _$value(IntAttribute v) => v.value;
  static const Field<IntAttribute, int> _f$value =
      Field('value', _$value, opt: true);

  @override
  final Map<Symbol, Field<IntAttribute, dynamic>> fields = const {
    #name: _f$name,
    #value: _f$value,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'IntAttribute';
  @override
  late final ClassMapperBase superMapper = AttributeMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: []);
  }

  static IntAttribute _instantiate(DecodingData data) {
    return IntAttribute(name: data.dec(_f$name), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static IntAttribute fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<IntAttribute>(map));
  }

  static IntAttribute fromJson(String json) {
    return _guard((c) => c.fromJson<IntAttribute>(json));
  }
}

mixin IntAttributeMappable {
  String toJson() {
    return IntAttributeMapper._guard((c) => c.toJson(this as IntAttribute));
  }

  Map<String, dynamic> toMap() {
    return IntAttributeMapper._guard((c) => c.toMap(this as IntAttribute));
  }

  IntAttributeCopyWith<IntAttribute, IntAttribute, IntAttribute> get copyWith =>
      _IntAttributeCopyWithImpl(this as IntAttribute, $identity, $identity);
  @override
  String toString() {
    return IntAttributeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IntAttributeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return IntAttributeMapper._guard((c) => c.hash(this));
  }
}

extension IntAttributeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntAttribute, $Out> {
  IntAttributeCopyWith<$R, IntAttribute, $Out> get $asIntAttribute =>
      $base.as((v, t, t2) => _IntAttributeCopyWithImpl(v, t, t2));
}

abstract class IntAttributeCopyWith<$R, $In extends IntAttribute, $Out>
    implements AttributeCopyWith<$R, $In, $Out, int> {
  @override
  $R call({String? name, int? value});
  IntAttributeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IntAttributeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntAttribute, $Out>
    implements IntAttributeCopyWith<$R, IntAttribute, $Out> {
  _IntAttributeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntAttribute> $mapper =
      IntAttributeMapper.ensureInitialized();
  @override
  $R call({Object? name = $none, Object? value = $none}) =>
      $apply(FieldCopyWithData(
          {if (name != $none) #name: name, if (value != $none) #value: value}));
  @override
  IntAttribute $make(CopyWithData data) => IntAttribute(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value));

  @override
  IntAttributeCopyWith<$R2, IntAttribute, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IntAttributeCopyWithImpl($value, $cast, t);
}
