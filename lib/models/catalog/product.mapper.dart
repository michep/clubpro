// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'product.dart';

class ProductMapper extends SubClassMapperBase<Product> {
  ProductMapper._();

  static ProductMapper? _instance;
  static ProductMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductMapper._());
      CatalogElementMapper.ensureInitialized().addSubMapper(_instance!);
      FileSetMapper.ensureInitialized();
      AttributeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Product';

  static String? _$id(Product v) => v.id;
  static const Field<Product, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static DateTime? _$created(Product v) => v.created;
  static const Field<Product, DateTime> _f$created =
      Field('created', _$created, opt: true);
  static String? _$createdBy(Product v) => v.createdBy;
  static const Field<Product, String> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by', opt: true);
  static DateTime? _$modified(Product v) => v.modified;
  static const Field<Product, DateTime> _f$modified =
      Field('modified', _$modified, opt: true);
  static String? _$modifiedBy(Product v) => v.modifiedBy;
  static const Field<Product, String> _f$modifiedBy =
      Field('modifiedBy', _$modifiedBy, key: 'modified_by', opt: true);
  static String? _$name(Product v) => v.name;
  static const Field<Product, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$parentFolderId(Product v) => v.parentFolderId;
  static const Field<Product, String> _f$parentFolderId = Field(
      'parentFolderId', _$parentFolderId,
      key: 'parentfolder_id', opt: true);
  static String? _$altName(Product v) => v.altName;
  static const Field<Product, String> _f$altName =
      Field('altName', _$altName, key: 'alt_name', opt: true);
  static String? _$videoLink(Product v) => v.videoLink;
  static const Field<Product, String> _f$videoLink =
      Field('videoLink', _$videoLink, key: 'video_link', opt: true);
  static String? _$vendorCode(Product v) => v.vendorCode;
  static const Field<Product, String> _f$vendorCode =
      Field('vendorCode', _$vendorCode, key: 'vendor_code', opt: true);
  static String? _$description(Product v) => v.description;
  static const Field<Product, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$tags(Product v) => v.tags;
  static const Field<Product, String> _f$tags =
      Field('tags', _$tags, opt: true);
  static FileSet _$pictures(Product v) => v.pictures;
  static const Field<Product, FileSet> _f$pictures =
      Field('pictures', _$pictures, opt: true);
  static List<String> _$secondaryFolderIds(Product v) => v.secondaryFolderIds;
  static const Field<Product, List<String>> _f$secondaryFolderIds = Field(
      'secondaryFolderIds', _$secondaryFolderIds,
      key: 'secondaryfolder_ids', opt: true);
  static List<Attribute<dynamic>> _$attributes(Product v) => v.attributes;
  static const Field<Product, List<Attribute<dynamic>>> _f$attributes =
      Field('attributes', _$attributes, opt: true);

  @override
  final Map<Symbol, Field<Product, dynamic>> fields = const {
    #id: _f$id,
    #created: _f$created,
    #createdBy: _f$createdBy,
    #modified: _f$modified,
    #modifiedBy: _f$modifiedBy,
    #name: _f$name,
    #parentFolderId: _f$parentFolderId,
    #altName: _f$altName,
    #videoLink: _f$videoLink,
    #vendorCode: _f$vendorCode,
    #description: _f$description,
    #tags: _f$tags,
    #pictures: _f$pictures,
    #secondaryFolderIds: _f$secondaryFolderIds,
    #attributes: _f$attributes,
  };

  @override
  final String discriminatorKey = '_elementType';
  @override
  final dynamic discriminatorValue = 'Product';
  @override
  late final ClassMapperBase superMapper =
      CatalogElementMapper.ensureInitialized();

  static Product _instantiate(DecodingData data) {
    return Product(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        createdBy: data.dec(_f$createdBy),
        modified: data.dec(_f$modified),
        modifiedBy: data.dec(_f$modifiedBy),
        name: data.dec(_f$name),
        parentFolderId: data.dec(_f$parentFolderId),
        altName: data.dec(_f$altName),
        videoLink: data.dec(_f$videoLink),
        vendorCode: data.dec(_f$vendorCode),
        description: data.dec(_f$description),
        tags: data.dec(_f$tags),
        pictures: data.dec(_f$pictures),
        secondaryFolderIds: data.dec(_f$secondaryFolderIds),
        attributes: data.dec(_f$attributes));
  }

  @override
  final Function instantiate = _instantiate;

  static Product fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Product>(map));
  }

  static Product fromJson(String json) {
    return _guard((c) => c.fromJson<Product>(json));
  }
}

mixin ProductMappable {
  String toJson() {
    return ProductMapper._guard((c) => c.toJson(this as Product));
  }

  Map<String, dynamic> toMap() {
    return ProductMapper._guard((c) => c.toMap(this as Product));
  }

  ProductCopyWith<Product, Product, Product> get copyWith =>
      _ProductCopyWithImpl(this as Product, $identity, $identity);
  @override
  String toString() {
    return ProductMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProductMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ProductMapper._guard((c) => c.hash(this));
  }
}

extension ProductValueCopy<$R, $Out> on ObjectCopyWith<$R, Product, $Out> {
  ProductCopyWith<$R, Product, $Out> get $asProduct =>
      $base.as((v, t, t2) => _ProductCopyWithImpl(v, t, t2));
}

abstract class ProductCopyWith<$R, $In extends Product, $Out>
    implements CatalogElementCopyWith<$R, $In, $Out> {
  FileSetCopyWith<$R, FileSet, FileSet> get pictures;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get secondaryFolderIds;
  ListCopyWith<
      $R,
      Attribute<dynamic>,
      AttributeCopyWith<$R, Attribute<dynamic>, Attribute<dynamic>,
          dynamic>> get attributes;
  @override
  $R call(
      {String? id,
      DateTime? created,
      String? createdBy,
      DateTime? modified,
      String? modifiedBy,
      String? name,
      String? parentFolderId,
      String? altName,
      String? videoLink,
      String? vendorCode,
      String? description,
      String? tags,
      FileSet? pictures,
      List<String>? secondaryFolderIds,
      List<Attribute<dynamic>>? attributes});
  ProductCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Product, $Out>
    implements ProductCopyWith<$R, Product, $Out> {
  _ProductCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Product> $mapper =
      ProductMapper.ensureInitialized();
  @override
  FileSetCopyWith<$R, FileSet, FileSet> get pictures =>
      ($value.pictures as FileSet).copyWith.$chain((v) => call(pictures: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get secondaryFolderIds => ListCopyWith(
          $value.secondaryFolderIds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(secondaryFolderIds: v));
  @override
  ListCopyWith<
      $R,
      Attribute<dynamic>,
      AttributeCopyWith<$R, Attribute<dynamic>, Attribute<dynamic>,
          dynamic>> get attributes => ListCopyWith($value.attributes,
      (v, t) => v.copyWith.$chain(t), (v) => call(attributes: v));
  @override
  $R call(
          {Object? id = $none,
          Object? created = $none,
          Object? createdBy = $none,
          Object? modified = $none,
          Object? modifiedBy = $none,
          Object? name = $none,
          Object? parentFolderId = $none,
          Object? altName = $none,
          Object? videoLink = $none,
          Object? vendorCode = $none,
          Object? description = $none,
          Object? tags = $none,
          Object? pictures = $none,
          Object? secondaryFolderIds = $none,
          Object? attributes = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (created != $none) #created: created,
        if (createdBy != $none) #createdBy: createdBy,
        if (modified != $none) #modified: modified,
        if (modifiedBy != $none) #modifiedBy: modifiedBy,
        if (name != $none) #name: name,
        if (parentFolderId != $none) #parentFolderId: parentFolderId,
        if (altName != $none) #altName: altName,
        if (videoLink != $none) #videoLink: videoLink,
        if (vendorCode != $none) #vendorCode: vendorCode,
        if (description != $none) #description: description,
        if (tags != $none) #tags: tags,
        if (pictures != $none) #pictures: pictures,
        if (secondaryFolderIds != $none)
          #secondaryFolderIds: secondaryFolderIds,
        if (attributes != $none) #attributes: attributes
      }));
  @override
  Product $make(CopyWithData data) => Product(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      modified: data.get(#modified, or: $value.modified),
      modifiedBy: data.get(#modifiedBy, or: $value.modifiedBy),
      name: data.get(#name, or: $value.name),
      parentFolderId: data.get(#parentFolderId, or: $value.parentFolderId),
      altName: data.get(#altName, or: $value.altName),
      videoLink: data.get(#videoLink, or: $value.videoLink),
      vendorCode: data.get(#vendorCode, or: $value.vendorCode),
      description: data.get(#description, or: $value.description),
      tags: data.get(#tags, or: $value.tags),
      pictures: data.get(#pictures, or: $value.pictures),
      secondaryFolderIds:
          data.get(#secondaryFolderIds, or: $value.secondaryFolderIds),
      attributes: data.get(#attributes, or: $value.attributes));

  @override
  ProductCopyWith<$R2, Product, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProductCopyWithImpl($value, $cast, t);
}
