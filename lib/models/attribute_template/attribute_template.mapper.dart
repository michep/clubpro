// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'attribute_template.dart';

class AttributeTemplateMapper extends ClassMapperBase<AttributeTemplate> {
  AttributeTemplateMapper._();

  static AttributeTemplateMapper? _instance;
  static AttributeTemplateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttributeTemplateMapper._());
      BooleanAttributeTemplateMapper.ensureInitialized();
      SelectAttributeTemplateMapper.ensureInitialized();
      TextAttributeTemplateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AttributeTemplate';

  static String? _$name(AttributeTemplate v) => v.name;
  static const Field<AttributeTemplate, String> _f$name =
      Field('name', _$name, opt: true);

  @override
  final Map<Symbol, Field<AttributeTemplate, dynamic>> fields = const {
    #name: _f$name,
  };

  static AttributeTemplate _instantiate(DecodingData data) {
    return AttributeTemplate(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static AttributeTemplate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AttributeTemplate>(map));
  }

  static AttributeTemplate fromJson(String json) {
    return _guard((c) => c.fromJson<AttributeTemplate>(json));
  }
}

mixin AttributeTemplateMappable {
  String toJson() {
    return AttributeTemplateMapper._guard(
        (c) => c.toJson(this as AttributeTemplate));
  }

  Map<String, dynamic> toMap() {
    return AttributeTemplateMapper._guard(
        (c) => c.toMap(this as AttributeTemplate));
  }

  AttributeTemplateCopyWith<AttributeTemplate, AttributeTemplate,
          AttributeTemplate>
      get copyWith => _AttributeTemplateCopyWithImpl(
          this as AttributeTemplate, $identity, $identity);
  @override
  String toString() {
    return AttributeTemplateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttributeTemplateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AttributeTemplateMapper._guard((c) => c.hash(this));
  }
}

extension AttributeTemplateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttributeTemplate, $Out> {
  AttributeTemplateCopyWith<$R, AttributeTemplate, $Out>
      get $asAttributeTemplate =>
          $base.as((v, t, t2) => _AttributeTemplateCopyWithImpl(v, t, t2));
}

abstract class AttributeTemplateCopyWith<$R, $In extends AttributeTemplate,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  AttributeTemplateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttributeTemplateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttributeTemplate, $Out>
    implements AttributeTemplateCopyWith<$R, AttributeTemplate, $Out> {
  _AttributeTemplateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttributeTemplate> $mapper =
      AttributeTemplateMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  AttributeTemplate $make(CopyWithData data) =>
      AttributeTemplate(name: data.get(#name, or: $value.name));

  @override
  AttributeTemplateCopyWith<$R2, AttributeTemplate, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttributeTemplateCopyWithImpl($value, $cast, t);
}
