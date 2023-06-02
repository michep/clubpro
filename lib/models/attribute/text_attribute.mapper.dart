// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'text_attribute.dart';

class TextAttributeMapper extends SubClassMapperBase<TextAttribute> {
  TextAttributeMapper._();

  static TextAttributeMapper? _instance;
  static TextAttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextAttributeMapper._());
      AttributeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'TextAttribute';

  static String? _$name(TextAttribute v) => v.name;
  static const Field<TextAttribute, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$value(TextAttribute v) => v.value;
  static const Field<TextAttribute, String> _f$value =
      Field('value', _$value, opt: true);

  @override
  final Map<Symbol, Field<TextAttribute, dynamic>> fields = const {
    #name: _f$name,
    #value: _f$value,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'TextAttribute';
  @override
  late final ClassMapperBase superMapper = AttributeMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: []);
  }

  static TextAttribute _instantiate(DecodingData data) {
    return TextAttribute(name: data.dec(_f$name), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static TextAttribute fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<TextAttribute>(map));
  }

  static TextAttribute fromJson(String json) {
    return _guard((c) => c.fromJson<TextAttribute>(json));
  }
}

mixin TextAttributeMappable {
  String toJson() {
    return TextAttributeMapper._guard((c) => c.toJson(this as TextAttribute));
  }

  Map<String, dynamic> toMap() {
    return TextAttributeMapper._guard((c) => c.toMap(this as TextAttribute));
  }

  TextAttributeCopyWith<TextAttribute, TextAttribute, TextAttribute>
      get copyWith => _TextAttributeCopyWithImpl(
          this as TextAttribute, $identity, $identity);
  @override
  String toString() {
    return TextAttributeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TextAttributeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return TextAttributeMapper._guard((c) => c.hash(this));
  }
}

extension TextAttributeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextAttribute, $Out> {
  TextAttributeCopyWith<$R, TextAttribute, $Out> get $asTextAttribute =>
      $base.as((v, t, t2) => _TextAttributeCopyWithImpl(v, t, t2));
}

abstract class TextAttributeCopyWith<$R, $In extends TextAttribute, $Out>
    implements AttributeCopyWith<$R, $In, $Out, String> {
  @override
  $R call({String? name, String? value});
  TextAttributeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextAttributeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextAttribute, $Out>
    implements TextAttributeCopyWith<$R, TextAttribute, $Out> {
  _TextAttributeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextAttribute> $mapper =
      TextAttributeMapper.ensureInitialized();
  @override
  $R call({Object? name = $none, Object? value = $none}) =>
      $apply(FieldCopyWithData(
          {if (name != $none) #name: name, if (value != $none) #value: value}));
  @override
  TextAttribute $make(CopyWithData data) => TextAttribute(
      name: data.get(#name, or: $value.name),
      value: data.get(#value, or: $value.value));

  @override
  TextAttributeCopyWith<$R2, TextAttribute, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextAttributeCopyWithImpl($value, $cast, t);
}
