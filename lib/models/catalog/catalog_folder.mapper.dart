// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'catalog_folder.dart';

class CatalogFolderMapper extends SubClassMapperBase<CatalogFolder> {
  CatalogFolderMapper._();

  static CatalogFolderMapper? _instance;
  static CatalogFolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CatalogFolderMapper._());
      CatalogElementMapper.ensureInitialized().addSubMapper(_instance!);
      FileSetMapper.ensureInitialized();
      AttributeTemplateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CatalogFolder';

  static String? _$id(CatalogFolder v) => v.id;
  static const Field<CatalogFolder, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$name(CatalogFolder v) => v.name;
  static const Field<CatalogFolder, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$parentFolderId(CatalogFolder v) => v.parentFolderId;
  static const Field<CatalogFolder, String> _f$parentFolderId = Field(
      'parentFolderId', _$parentFolderId,
      key: 'parentfolder_id', opt: true);
  static int? _$order(CatalogFolder v) => v.order;
  static const Field<CatalogFolder, int> _f$order =
      Field('order', _$order, opt: true);
  static String? _$seo(CatalogFolder v) => v.seo;
  static const Field<CatalogFolder, String> _f$seo =
      Field('seo', _$seo, opt: true);
  static FileSet _$pictures(CatalogFolder v) => v.pictures;
  static const Field<CatalogFolder, FileSet> _f$pictures =
      Field('pictures', _$pictures, opt: true);
  static List<AttributeTemplate> _$attributes(CatalogFolder v) => v.attributes;
  static const Field<CatalogFolder, List<AttributeTemplate>> _f$attributes =
      Field('attributes', _$attributes, opt: true);
  static List<String> _$breadcrumbs(CatalogFolder v) => v.breadcrumbs;
  static const Field<CatalogFolder, List<String>> _f$breadcrumbs =
      Field('breadcrumbs', _$breadcrumbs, opt: true);

  @override
  final Map<Symbol, Field<CatalogFolder, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #parentFolderId: _f$parentFolderId,
    #order: _f$order,
    #seo: _f$seo,
    #pictures: _f$pictures,
    #attributes: _f$attributes,
    #breadcrumbs: _f$breadcrumbs,
  };

  @override
  final String discriminatorKey = '_elementType';
  @override
  final dynamic discriminatorValue = 'CatalogFolder';
  @override
  late final ClassMapperBase superMapper =
      CatalogElementMapper.ensureInitialized();

  static CatalogFolder _instantiate(DecodingData data) {
    return CatalogFolder(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        parentFolderId: data.dec(_f$parentFolderId),
        order: data.dec(_f$order),
        seo: data.dec(_f$seo),
        pictures: data.dec(_f$pictures),
        attributes: data.dec(_f$attributes),
        breadcrumbs: data.dec(_f$breadcrumbs));
  }

  @override
  final Function instantiate = _instantiate;

  static CatalogFolder fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CatalogFolder>(map));
  }

  static CatalogFolder fromJson(String json) {
    return _guard((c) => c.fromJson<CatalogFolder>(json));
  }
}

mixin CatalogFolderMappable {
  String toJson() {
    return CatalogFolderMapper._guard((c) => c.toJson(this as CatalogFolder));
  }

  Map<String, dynamic> toMap() {
    return CatalogFolderMapper._guard((c) => c.toMap(this as CatalogFolder));
  }

  CatalogFolderCopyWith<CatalogFolder, CatalogFolder, CatalogFolder>
      get copyWith => _CatalogFolderCopyWithImpl(
          this as CatalogFolder, $identity, $identity);
  @override
  String toString() {
    return CatalogFolderMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CatalogFolderMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CatalogFolderMapper._guard((c) => c.hash(this));
  }
}

extension CatalogFolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CatalogFolder, $Out> {
  CatalogFolderCopyWith<$R, CatalogFolder, $Out> get $asCatalogFolder =>
      $base.as((v, t, t2) => _CatalogFolderCopyWithImpl(v, t, t2));
}

abstract class CatalogFolderCopyWith<$R, $In extends CatalogFolder, $Out>
    implements CatalogElementCopyWith<$R, $In, $Out> {
  FileSetCopyWith<$R, FileSet, FileSet> get pictures;
  ListCopyWith<$R, AttributeTemplate,
          AttributeTemplateCopyWith<$R, AttributeTemplate, AttributeTemplate>>
      get attributes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get breadcrumbs;
  @override
  $R call(
      {String? id,
      String? name,
      String? parentFolderId,
      int? order,
      String? seo,
      FileSet? pictures,
      List<AttributeTemplate>? attributes,
      List<String>? breadcrumbs});
  CatalogFolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CatalogFolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CatalogFolder, $Out>
    implements CatalogFolderCopyWith<$R, CatalogFolder, $Out> {
  _CatalogFolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CatalogFolder> $mapper =
      CatalogFolderMapper.ensureInitialized();
  @override
  FileSetCopyWith<$R, FileSet, FileSet> get pictures =>
      ($value.pictures as FileSet).copyWith.$chain((v) => call(pictures: v));
  @override
  ListCopyWith<$R, AttributeTemplate,
          AttributeTemplateCopyWith<$R, AttributeTemplate, AttributeTemplate>>
      get attributes => ListCopyWith($value.attributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(attributes: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get breadcrumbs => ListCopyWith(
          $value.breadcrumbs,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(breadcrumbs: v));
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? parentFolderId = $none,
          Object? order = $none,
          Object? seo = $none,
          Object? pictures = $none,
          Object? attributes = $none,
          Object? breadcrumbs = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (parentFolderId != $none) #parentFolderId: parentFolderId,
        if (order != $none) #order: order,
        if (seo != $none) #seo: seo,
        if (pictures != $none) #pictures: pictures,
        if (attributes != $none) #attributes: attributes,
        if (breadcrumbs != $none) #breadcrumbs: breadcrumbs
      }));
  @override
  CatalogFolder $make(CopyWithData data) => CatalogFolder(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      parentFolderId: data.get(#parentFolderId, or: $value.parentFolderId),
      order: data.get(#order, or: $value.order),
      seo: data.get(#seo, or: $value.seo),
      pictures: data.get(#pictures, or: $value.pictures),
      attributes: data.get(#attributes, or: $value.attributes),
      breadcrumbs: data.get(#breadcrumbs, or: $value.breadcrumbs));

  @override
  CatalogFolderCopyWith<$R2, CatalogFolder, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CatalogFolderCopyWithImpl($value, $cast, t);
}
