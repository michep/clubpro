// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'real_attribute_template.dart';

class RealAttributeTemplateMapper
    extends SubClassMapperBase<RealAttributeTemplate> {
  RealAttributeTemplateMapper._();

  static RealAttributeTemplateMapper? _instance;
  static RealAttributeTemplateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RealAttributeTemplateMapper._());
      AttributeTemplateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'RealAttributeTemplate';

  static String? _$name(RealAttributeTemplate v) => v.name;
  static const Field<RealAttributeTemplate, String> _f$name =
      Field('name', _$name, opt: true);

  @override
  final Map<Symbol, Field<RealAttributeTemplate, dynamic>> fields = const {
    #name: _f$name,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'RealAttributeTemplate';
  @override
  late final ClassMapperBase superMapper =
      AttributeTemplateMapper.ensureInitialized();

  static RealAttributeTemplate _instantiate(DecodingData data) {
    return RealAttributeTemplate(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static RealAttributeTemplate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<RealAttributeTemplate>(map));
  }

  static RealAttributeTemplate fromJson(String json) {
    return _guard((c) => c.fromJson<RealAttributeTemplate>(json));
  }
}

mixin RealAttributeTemplateMappable {
  String toJson() {
    return RealAttributeTemplateMapper._guard(
        (c) => c.toJson(this as RealAttributeTemplate));
  }

  Map<String, dynamic> toMap() {
    return RealAttributeTemplateMapper._guard(
        (c) => c.toMap(this as RealAttributeTemplate));
  }

  RealAttributeTemplateCopyWith<RealAttributeTemplate, RealAttributeTemplate,
          RealAttributeTemplate>
      get copyWith => _RealAttributeTemplateCopyWithImpl(
          this as RealAttributeTemplate, $identity, $identity);
  @override
  String toString() {
    return RealAttributeTemplateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RealAttributeTemplateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return RealAttributeTemplateMapper._guard((c) => c.hash(this));
  }
}

extension RealAttributeTemplateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RealAttributeTemplate, $Out> {
  RealAttributeTemplateCopyWith<$R, RealAttributeTemplate, $Out>
      get $asRealAttributeTemplate =>
          $base.as((v, t, t2) => _RealAttributeTemplateCopyWithImpl(v, t, t2));
}

abstract class RealAttributeTemplateCopyWith<
    $R,
    $In extends RealAttributeTemplate,
    $Out> implements AttributeTemplateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  RealAttributeTemplateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RealAttributeTemplateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RealAttributeTemplate, $Out>
    implements RealAttributeTemplateCopyWith<$R, RealAttributeTemplate, $Out> {
  _RealAttributeTemplateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RealAttributeTemplate> $mapper =
      RealAttributeTemplateMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  RealAttributeTemplate $make(CopyWithData data) =>
      RealAttributeTemplate(name: data.get(#name, or: $value.name));

  @override
  RealAttributeTemplateCopyWith<$R2, RealAttributeTemplate, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _RealAttributeTemplateCopyWithImpl($value, $cast, t);
}
