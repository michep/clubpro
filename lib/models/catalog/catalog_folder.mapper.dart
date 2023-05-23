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
      BaseModelMapper.ensureInitialized().addSubMapper(_instance!);
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
  static String? _$pictureFileId(CatalogFolder v) => v.pictureFileId;
  static const Field<CatalogFolder, String> _f$pictureFileId = Field(
      'pictureFileId', _$pictureFileId,
      key: 'picture_file_id', opt: true);
  static String? _$seo(CatalogFolder v) => v.seo;
  static const Field<CatalogFolder, String> _f$seo =
      Field('seo', _$seo, opt: true);
  static List<AttributeTemplate> _$attributes(CatalogFolder v) => v.attributes;
  static const Field<CatalogFolder, List<AttributeTemplate>> _f$attributes =
      Field('attributes', _$attributes, opt: true, def: const []);

  @override
  final Map<Symbol, Field<CatalogFolder, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #parentFolderId: _f$parentFolderId,
    #order: _f$order,
    #pictureFileId: _f$pictureFileId,
    #seo: _f$seo,
    #attributes: _f$attributes,
  };

  @override
  final String discriminatorKey = '_baseType';
  @override
  final dynamic discriminatorValue = 'CatalogFolder';
  @override
  late final ClassMapperBase superMapper = BaseModelMapper.ensureInitialized();

  static CatalogFolder _instantiate(DecodingData data) {
    return CatalogFolder(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        parentFolderId: data.dec(_f$parentFolderId),
        order: data.dec(_f$order),
        pictureFileId: data.dec(_f$pictureFileId),
        seo: data.dec(_f$seo),
        attributes: data.dec(_f$attributes));
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
    implements BaseModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AttributeTemplate,
          AttributeTemplateCopyWith<$R, AttributeTemplate, AttributeTemplate>>
      get attributes;
  @override
  $R call(
      {String? id,
      String? name,
      String? parentFolderId,
      int? order,
      String? pictureFileId,
      String? seo,
      List<AttributeTemplate>? attributes});
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
  ListCopyWith<$R, AttributeTemplate,
          AttributeTemplateCopyWith<$R, AttributeTemplate, AttributeTemplate>>
      get attributes => ListCopyWith($value.attributes,
          (v, t) => v.copyWith.$chain(t), (v) => call(attributes: v));
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? parentFolderId = $none,
          Object? order = $none,
          Object? pictureFileId = $none,
          Object? seo = $none,
          List<AttributeTemplate>? attributes}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (parentFolderId != $none) #parentFolderId: parentFolderId,
        if (order != $none) #order: order,
        if (pictureFileId != $none) #pictureFileId: pictureFileId,
        if (seo != $none) #seo: seo,
        if (attributes != null) #attributes: attributes
      }));
  @override
  CatalogFolder $make(CopyWithData data) => CatalogFolder(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      parentFolderId: data.get(#parentFolderId, or: $value.parentFolderId),
      order: data.get(#order, or: $value.order),
      pictureFileId: data.get(#pictureFileId, or: $value.pictureFileId),
      seo: data.get(#seo, or: $value.seo),
      attributes: data.get(#attributes, or: $value.attributes));

  @override
  CatalogFolderCopyWith<$R2, CatalogFolder, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CatalogFolderCopyWithImpl($value, $cast, t);
}
