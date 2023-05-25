// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'text_attribute_template.dart';

class TextAttributeTemplateMapper
    extends SubClassMapperBase<TextAttributeTemplate> {
  TextAttributeTemplateMapper._();

  static TextAttributeTemplateMapper? _instance;
  static TextAttributeTemplateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextAttributeTemplateMapper._());
      AttributeTemplateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'TextAttributeTemplate';

  static String? _$name(TextAttributeTemplate v) => v.name;
  static const Field<TextAttributeTemplate, String> _f$name =
      Field('name', _$name, opt: true);

  @override
  final Map<Symbol, Field<TextAttributeTemplate, dynamic>> fields = const {
    #name: _f$name,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'TextAttributeTemplate';
  @override
  late final ClassMapperBase superMapper =
      AttributeTemplateMapper.ensureInitialized();

  static TextAttributeTemplate _instantiate(DecodingData data) {
    return TextAttributeTemplate(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static TextAttributeTemplate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<TextAttributeTemplate>(map));
  }

  static TextAttributeTemplate fromJson(String json) {
    return _guard((c) => c.fromJson<TextAttributeTemplate>(json));
  }
}

mixin TextAttributeTemplateMappable {
  String toJson() {
    return TextAttributeTemplateMapper._guard(
        (c) => c.toJson(this as TextAttributeTemplate));
  }

  Map<String, dynamic> toMap() {
    return TextAttributeTemplateMapper._guard(
        (c) => c.toMap(this as TextAttributeTemplate));
  }

  TextAttributeTemplateCopyWith<TextAttributeTemplate, TextAttributeTemplate,
          TextAttributeTemplate>
      get copyWith => _TextAttributeTemplateCopyWithImpl(
          this as TextAttributeTemplate, $identity, $identity);
  @override
  String toString() {
    return TextAttributeTemplateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TextAttributeTemplateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return TextAttributeTemplateMapper._guard((c) => c.hash(this));
  }
}

extension TextAttributeTemplateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextAttributeTemplate, $Out> {
  TextAttributeTemplateCopyWith<$R, TextAttributeTemplate, $Out>
      get $asTextAttributeTemplate =>
          $base.as((v, t, t2) => _TextAttributeTemplateCopyWithImpl(v, t, t2));
}

abstract class TextAttributeTemplateCopyWith<
    $R,
    $In extends TextAttributeTemplate,
    $Out> implements AttributeTemplateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  TextAttributeTemplateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TextAttributeTemplateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextAttributeTemplate, $Out>
    implements TextAttributeTemplateCopyWith<$R, TextAttributeTemplate, $Out> {
  _TextAttributeTemplateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextAttributeTemplate> $mapper =
      TextAttributeTemplateMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  TextAttributeTemplate $make(CopyWithData data) =>
      TextAttributeTemplate(name: data.get(#name, or: $value.name));

  @override
  TextAttributeTemplateCopyWith<$R2, TextAttributeTemplate, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TextAttributeTemplateCopyWithImpl($value, $cast, t);
}
