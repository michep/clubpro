// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'int_attribute_template.dart';

class IntAttributeTemplateMapper
    extends SubClassMapperBase<IntAttributeTemplate> {
  IntAttributeTemplateMapper._();

  static IntAttributeTemplateMapper? _instance;
  static IntAttributeTemplateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntAttributeTemplateMapper._());
      AttributeTemplateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'IntAttributeTemplate';

  static String? _$name(IntAttributeTemplate v) => v.name;
  static const Field<IntAttributeTemplate, String> _f$name =
      Field('name', _$name, opt: true);

  @override
  final Map<Symbol, Field<IntAttributeTemplate, dynamic>> fields = const {
    #name: _f$name,
  };

  @override
  final String discriminatorKey = '_attributeTemplateType';
  @override
  final dynamic discriminatorValue = 'IntAttributeTemplate';
  @override
  late final ClassMapperBase superMapper =
      AttributeTemplateMapper.ensureInitialized();

  static IntAttributeTemplate _instantiate(DecodingData data) {
    return IntAttributeTemplate(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static IntAttributeTemplate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<IntAttributeTemplate>(map));
  }

  static IntAttributeTemplate fromJson(String json) {
    return _guard((c) => c.fromJson<IntAttributeTemplate>(json));
  }
}

mixin IntAttributeTemplateMappable {
  String toJson() {
    return IntAttributeTemplateMapper._guard(
        (c) => c.toJson(this as IntAttributeTemplate));
  }

  Map<String, dynamic> toMap() {
    return IntAttributeTemplateMapper._guard(
        (c) => c.toMap(this as IntAttributeTemplate));
  }

  IntAttributeTemplateCopyWith<IntAttributeTemplate, IntAttributeTemplate,
          IntAttributeTemplate>
      get copyWith => _IntAttributeTemplateCopyWithImpl(
          this as IntAttributeTemplate, $identity, $identity);
  @override
  String toString() {
    return IntAttributeTemplateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IntAttributeTemplateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return IntAttributeTemplateMapper._guard((c) => c.hash(this));
  }
}

extension IntAttributeTemplateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntAttributeTemplate, $Out> {
  IntAttributeTemplateCopyWith<$R, IntAttributeTemplate, $Out>
      get $asIntAttributeTemplate =>
          $base.as((v, t, t2) => _IntAttributeTemplateCopyWithImpl(v, t, t2));
}

abstract class IntAttributeTemplateCopyWith<
    $R,
    $In extends IntAttributeTemplate,
    $Out> implements AttributeTemplateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  IntAttributeTemplateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IntAttributeTemplateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntAttributeTemplate, $Out>
    implements IntAttributeTemplateCopyWith<$R, IntAttributeTemplate, $Out> {
  _IntAttributeTemplateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntAttributeTemplate> $mapper =
      IntAttributeTemplateMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  IntAttributeTemplate $make(CopyWithData data) =>
      IntAttributeTemplate(name: data.get(#name, or: $value.name));

  @override
  IntAttributeTemplateCopyWith<$R2, IntAttributeTemplate, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IntAttributeTemplateCopyWithImpl($value, $cast, t);
}
