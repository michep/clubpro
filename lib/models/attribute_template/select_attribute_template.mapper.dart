// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'select_attribute_template.dart';

class SelectAttributeTemplateMapper
    extends SubClassMapperBase<SelectAttributeTemplate> {
  SelectAttributeTemplateMapper._();

  static SelectAttributeTemplateMapper? _instance;
  static SelectAttributeTemplateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SelectAttributeTemplateMapper._());
      AttributeTemplateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SelectAttributeTemplate';

  static String? _$name(SelectAttributeTemplate v) => v.name;
  static const Field<SelectAttributeTemplate, String> _f$name =
      Field('name', _$name, opt: true);
  static List<String> _$values(SelectAttributeTemplate v) => v.values;
  static const Field<SelectAttributeTemplate, List<String>> _f$values =
      Field('values', _$values, opt: true);

  @override
  final Map<Symbol, Field<SelectAttributeTemplate, dynamic>> fields = const {
    #name: _f$name,
    #values: _f$values,
  };

  @override
  final String discriminatorKey = '_attributeTemplateType';
  @override
  final dynamic discriminatorValue = 'SelectAttributeTemplate';
  @override
  late final ClassMapperBase superMapper =
      AttributeTemplateMapper.ensureInitialized();

  static SelectAttributeTemplate _instantiate(DecodingData data) {
    return SelectAttributeTemplate(
        name: data.dec(_f$name), values: data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static SelectAttributeTemplate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SelectAttributeTemplate>(map));
  }

  static SelectAttributeTemplate fromJson(String json) {
    return _guard((c) => c.fromJson<SelectAttributeTemplate>(json));
  }
}

mixin SelectAttributeTemplateMappable {
  String toJson() {
    return SelectAttributeTemplateMapper._guard(
        (c) => c.toJson(this as SelectAttributeTemplate));
  }

  Map<String, dynamic> toMap() {
    return SelectAttributeTemplateMapper._guard(
        (c) => c.toMap(this as SelectAttributeTemplate));
  }

  SelectAttributeTemplateCopyWith<SelectAttributeTemplate,
          SelectAttributeTemplate, SelectAttributeTemplate>
      get copyWith => _SelectAttributeTemplateCopyWithImpl(
          this as SelectAttributeTemplate, $identity, $identity);
  @override
  String toString() {
    return SelectAttributeTemplateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SelectAttributeTemplateMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SelectAttributeTemplateMapper._guard((c) => c.hash(this));
  }
}

extension SelectAttributeTemplateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SelectAttributeTemplate, $Out> {
  SelectAttributeTemplateCopyWith<$R, SelectAttributeTemplate, $Out>
      get $asSelectAttributeTemplate => $base
          .as((v, t, t2) => _SelectAttributeTemplateCopyWithImpl(v, t, t2));
}

abstract class SelectAttributeTemplateCopyWith<
    $R,
    $In extends SelectAttributeTemplate,
    $Out> implements AttributeTemplateCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get values;
  @override
  $R call({String? name, List<String>? values});
  SelectAttributeTemplateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SelectAttributeTemplateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SelectAttributeTemplate, $Out>
    implements
        SelectAttributeTemplateCopyWith<$R, SelectAttributeTemplate, $Out> {
  _SelectAttributeTemplateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SelectAttributeTemplate> $mapper =
      SelectAttributeTemplateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get values =>
      ListCopyWith($value.values, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(values: v));
  @override
  $R call({Object? name = $none, Object? values = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (values != $none) #values: values
      }));
  @override
  SelectAttributeTemplate $make(CopyWithData data) => SelectAttributeTemplate(
      name: data.get(#name, or: $value.name),
      values: data.get(#values, or: $value.values));

  @override
  SelectAttributeTemplateCopyWith<$R2, SelectAttributeTemplate, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SelectAttributeTemplateCopyWithImpl($value, $cast, t);
}
