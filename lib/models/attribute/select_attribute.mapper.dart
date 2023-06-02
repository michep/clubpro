// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'select_attribute.dart';

class SelectAttributeMapper extends SubClassMapperBase<SelectAttribute> {
  SelectAttributeMapper._();

  static SelectAttributeMapper? _instance;
  static SelectAttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SelectAttributeMapper._());
      AttributeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SelectAttribute';

  static String? _$name(SelectAttribute v) => v.name;
  static const Field<SelectAttribute, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$value(SelectAttribute v) => v.value;
  static const Field<SelectAttribute, String> _f$value =
      Field('value', _$value, opt: true);
  static List<String>? _$values(SelectAttribute v) => v.values;
  static const Field<SelectAttribute, List<String>> _f$values =
      Field('values', _$values, opt: true);

  @override
  final Map<Symbol, Field<SelectAttribute, dynamic>> fields = const {
    #name: _f$name,
    #value: _f$value,
    #values: _f$values,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'SelectAttribute';
  @override
  late final ClassMapperBase superMapper = AttributeMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: []);
  }

  static SelectAttribute _instantiate(DecodingData data) {
    return SelectAttribute(
        name: data.dec(_f$name),
        value: data.dec(_f$value),
        values: data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static SelectAttribute fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SelectAttribute>(map));
  }

  static SelectAttribute fromJson(String json) {
    return _guard((c) => c.fromJson<SelectAttribute>(json));
  }
}

mixin SelectAttributeMappable {
  String toJson() {
    return SelectAttributeMapper._guard(
        (c) => c.toJson(this as SelectAttribute));
  }

  Map<String, dynamic> toMap() {
    return SelectAttributeMapper._guard(
        (c) => c.toMap(this as SelectAttribute));
  }

  SelectAttributeCopyWith<SelectAttribute, SelectAttribute, SelectAttribute>
      get copyWith => _SelectAttributeCopyWithImpl(
          this as SelectAttribute, $identity, $identity);
  @override
  String toString() {
    return SelectAttributeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SelectAttributeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SelectAttributeMapper._guard((c) => c.hash(this));
  }
}

extension SelectAttributeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SelectAttribute, $Out> {
  SelectAttributeCopyWith<$R, SelectAttribute, $Out> get $asSelectAttribute =>
      $base.as((v, t, t2) => _SelectAttributeCopyWithImpl(v, t, t2));
}

abstract class SelectAttributeCopyWith<$R, $In extends SelectAttribute, $Out>
    implements AttributeCopyWith<$R, $In, $Out, String> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get values;
  @override
  $R call({String? name, String? value, List<String>? values});
  SelectAttributeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SelectAttributeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SelectAttribute, $Out>
    implements SelectAttributeCopyWith<$R, SelectAttribute, $Out> {
  _SelectAttributeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SelectAttribute> $mapper =
      SelectAttributeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get values =>
      $value.values != null
          ? ListCopyWith($value.values!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v))
          : null;
  @override
  $R call(
          {Object? name = $none,
          Object? value = $none,
          Object? values = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (value != $none) #value: value,
        if (values != $none) #values: values
      }));
  @override
  SelectAttribute $make(CopyWithData data) => SelectAttribute(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value),
      values: data.get(#values, or: $value.values));

  @override
  SelectAttributeCopyWith<$R2, SelectAttribute, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SelectAttributeCopyWithImpl($value, $cast, t);
}
