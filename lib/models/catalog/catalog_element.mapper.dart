// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'catalog_element.dart';

class CatalogElementMapper extends SubClassMapperBase<CatalogElement> {
  CatalogElementMapper._();

  static CatalogElementMapper? _instance;
  static CatalogElementMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatalogElementMapper._());
      BaseModelMapper.ensureInitialized().addSubMapper(_instance!);
      CatalogFolderMapper.ensureInitialized();
      ProductMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CatalogElement';

  static String? _$id(CatalogElement v) => v.id;
  static const Field<CatalogElement, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$name(CatalogElement v) => v.name;
  static const Field<CatalogElement, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$parentFolderId(CatalogElement v) => v.parentFolderId;
  static const Field<CatalogElement, String> _f$parentFolderId = Field(
      'parentFolderId', _$parentFolderId,
      key: 'parentfolder_id', opt: true);

  @override
  final Map<Symbol, Field<CatalogElement, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #parentFolderId: _f$parentFolderId,
  };

  @override
  final String discriminatorKey = '_baseType';
  @override
  final dynamic discriminatorValue = 'CatalogElement';
  @override
  late final ClassMapperBase superMapper = BaseModelMapper.ensureInitialized();

  static CatalogElement _instantiate(DecodingData data) {
    return CatalogElement(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        parentFolderId: data.dec(_f$parentFolderId));
  }

  @override
  final Function instantiate = _instantiate;

  static CatalogElement fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CatalogElement>(map));
  }

  static CatalogElement fromJson(String json) {
    return _guard((c) => c.fromJson<CatalogElement>(json));
  }
}

mixin CatalogElementMappable {
  String toJson() {
    return CatalogElementMapper._guard((c) => c.toJson(this as CatalogElement));
  }

  Map<String, dynamic> toMap() {
    return CatalogElementMapper._guard((c) => c.toMap(this as CatalogElement));
  }

  CatalogElementCopyWith<CatalogElement, CatalogElement, CatalogElement>
      get copyWith => _CatalogElementCopyWithImpl(
          this as CatalogElement, $identity, $identity);
  @override
  String toString() {
    return CatalogElementMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CatalogElementMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CatalogElementMapper._guard((c) => c.hash(this));
  }
}

extension CatalogElementValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CatalogElement, $Out> {
  CatalogElementCopyWith<$R, CatalogElement, $Out> get $asCatalogElement =>
      $base.as((v, t, t2) => _CatalogElementCopyWithImpl(v, t, t2));
}

abstract class CatalogElementCopyWith<$R, $In extends CatalogElement, $Out>
    implements BaseModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? name, String? parentFolderId});
  CatalogElementCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CatalogElementCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CatalogElement, $Out>
    implements CatalogElementCopyWith<$R, CatalogElement, $Out> {
  _CatalogElementCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CatalogElement> $mapper =
      CatalogElementMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? parentFolderId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (parentFolderId != $none) #parentFolderId: parentFolderId
      }));
  @override
  CatalogElement $make(CopyWithData data) => CatalogElement(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      parentFolderId: data.get(#parentFolderId, or: $value.parentFolderId));

  @override
  CatalogElementCopyWith<$R2, CatalogElement, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CatalogElementCopyWithImpl($value, $cast, t);
}
