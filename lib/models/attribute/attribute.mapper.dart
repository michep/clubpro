// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'attribute.dart';

class AttributeMapper extends ClassMapperBase<Attribute> {
  AttributeMapper._();

  static AttributeMapper? _instance;
  static AttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttributeMapper._());
      TextAttributeMapper.ensureInitialized();
      SelectAttributeMapper.ensureInitialized();
      BooleanAttributeMapper.ensureInitialized();
      IntAttributeMapper.ensureInitialized();
      RealAttributeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Attribute';
  @override
  Function get typeFactory => <T>(f) => f<Attribute<T>>();

  static String? _$name(Attribute v) => v.name;
  static const Field<Attribute, String> _f$name =
      Field('name', _$name, opt: true);
  static dynamic _$value(Attribute v) => v.value;
  static dynamic _arg$value<T>(f) => f<T>();
  static const Field<Attribute, dynamic> _f$value =
      Field('value', _$value, opt: true, arg: _arg$value);

  @override
  final Map<Symbol, Field<Attribute, dynamic>> fields = const {
    #name: _f$name,
    #value: _f$value,
  };

  static Attribute<T> _instantiate<T>(DecodingData data) {
    return Attribute(name: data.dec(_f$name), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Attribute<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Attribute<T>>(map));
  }

  static Attribute<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<Attribute<T>>(json));
  }
}

mixin AttributeMappable<T> {
  String toJson() {
    return AttributeMapper._guard((c) => c.toJson(this as Attribute<T>));
  }

  Map<String, dynamic> toMap() {
    return AttributeMapper._guard((c) => c.toMap(this as Attribute<T>));
  }

  AttributeCopyWith<Attribute<T>, Attribute<T>, Attribute<T>, T> get copyWith =>
      _AttributeCopyWithImpl(this as Attribute<T>, $identity, $identity);
  @override
  String toString() {
    return AttributeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttributeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AttributeMapper._guard((c) => c.hash(this));
  }
}

extension AttributeValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, Attribute<T>, $Out> {
  AttributeCopyWith<$R, Attribute<T>, $Out, T> get $asAttribute =>
      $base.as((v, t, t2) => _AttributeCopyWithImpl(v, t, t2));
}

abstract class AttributeCopyWith<$R, $In extends Attribute<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, T? value});
  AttributeCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AttributeCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, Attribute<T>, $Out>
    implements AttributeCopyWith<$R, Attribute<T>, $Out, T> {
  _AttributeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Attribute> $mapper =
      AttributeMapper.ensureInitialized();
  @override
  $R call({Object? name = $none, Object? value = $none}) =>
      $apply(FieldCopyWithData(
          {if (name != $none) #name: name, if (value != $none) #value: value}));
  @override
  Attribute<T> $make(CopyWithData data) => Attribute(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value));

  @override
  AttributeCopyWith<$R2, Attribute<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttributeCopyWithImpl($value, $cast, t);
}
