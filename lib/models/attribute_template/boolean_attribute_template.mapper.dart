// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'boolean_attribute_template.dart';

class BooleanAttributeTemplateMapper
    extends SubClassMapperBase<BooleanAttributeTemplate> {
  BooleanAttributeTemplateMapper._();

  static BooleanAttributeTemplateMapper? _instance;
  static BooleanAttributeTemplateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = BooleanAttributeTemplateMapper._());
      AttributeTemplateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BooleanAttributeTemplate';

  static String? _$name(BooleanAttributeTemplate v) => v.name;
  static const Field<BooleanAttributeTemplate, String> _f$name =
      Field('name', _$name, opt: true);

  @override
  final Map<Symbol, Field<BooleanAttributeTemplate, dynamic>> fields = const {
    #name: _f$name,
  };

  @override
  final String discriminatorKey = '_attributeType';
  @override
  final dynamic discriminatorValue = 'BooleanAttributeTemplate';
  @override
  late final ClassMapperBase superMapper =
      AttributeTemplateMapper.ensureInitialized();

  static BooleanAttributeTemplate _instantiate(DecodingData data) {
    return BooleanAttributeTemplate(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static BooleanAttributeTemplate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BooleanAttributeTemplate>(map));
  }

  static BooleanAttributeTemplate fromJson(String json) {
    return _guard((c) => c.fromJson<BooleanAttributeTemplate>(json));
  }
}

mixin BooleanAttributeTemplateMappable {
  String toJson() {
    return BooleanAttributeTemplateMapper._guard(
        (c) => c.toJson(this as BooleanAttributeTemplate));
  }

  Map<String, dynamic> toMap() {
    return BooleanAttributeTemplateMapper._guard(
        (c) => c.toMap(this as BooleanAttributeTemplate));
  }

  BooleanAttributeTemplateCopyWith<BooleanAttributeTemplate,
          BooleanAttributeTemplate, BooleanAttributeTemplate>
      get copyWith => _BooleanAttributeTemplateCopyWithImpl(
          this as BooleanAttributeTemplate, $identity, $identity);
  @override
  String toString() {
    return BooleanAttributeTemplateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BooleanAttributeTemplateMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BooleanAttributeTemplateMapper._guard((c) => c.hash(this));
  }
}

extension BooleanAttributeTemplateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BooleanAttributeTemplate, $Out> {
  BooleanAttributeTemplateCopyWith<$R, BooleanAttributeTemplate, $Out>
      get $asBooleanAttributeTemplate => $base
          .as((v, t, t2) => _BooleanAttributeTemplateCopyWithImpl(v, t, t2));
}

abstract class BooleanAttributeTemplateCopyWith<
    $R,
    $In extends BooleanAttributeTemplate,
    $Out> implements AttributeTemplateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name});
  BooleanAttributeTemplateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BooleanAttributeTemplateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BooleanAttributeTemplate, $Out>
    implements
        BooleanAttributeTemplateCopyWith<$R, BooleanAttributeTemplate, $Out> {
  _BooleanAttributeTemplateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BooleanAttributeTemplate> $mapper =
      BooleanAttributeTemplateMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  BooleanAttributeTemplate $make(CopyWithData data) =>
      BooleanAttributeTemplate(name: data.get(#name, or: $value.name));

  @override
  BooleanAttributeTemplateCopyWith<$R2, BooleanAttributeTemplate, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BooleanAttributeTemplateCopyWithImpl($value, $cast, t);
}
