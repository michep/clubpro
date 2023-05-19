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
      BaseModelMapper.ensureInitialized().addSubMapper(_instance!);
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
  static String? _$name(Product v) => v.name;
  static const Field<Product, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$altName(Product v) => v.altName;
  static const Field<Product, String> _f$altName =
      Field('altName', _$altName, key: 'alt_name', opt: true);
  static String? _$primaryFolderId(Product v) => v.primaryFolderId;
  static const Field<Product, String> _f$primaryFolderId = Field(
      'primaryFolderId', _$primaryFolderId,
      key: 'parentfolder_id', opt: true);
  static List<String>? _$secondaryFolderIds(Product v) => v.secondaryFolderIds;
  static const Field<Product, List<String>> _f$secondaryFolderIds = Field(
      'secondaryFolderIds', _$secondaryFolderIds,
      key: 'secondaryfolder_ids', opt: true);
  static String? _$pictureFileId(Product v) => v.pictureFileId;
  static const Field<Product, String> _f$pictureFileId = Field(
      'pictureFileId', _$pictureFileId,
      key: 'picture_file_id', opt: true);
  static String? _$videoLink(Product v) => v.videoLink;
  static const Field<Product, String> _f$videoLink =
      Field('videoLink', _$videoLink, key: 'video_link', opt: true);
  static String? _$vendorCode(Product v) => v.vendorCode;
  static const Field<Product, String> _f$vendorCode =
      Field('vendorCode', _$vendorCode, key: 'vendor_code', opt: true);
  static String? _$description(Product v) => v.description;
  static const Field<Product, String> _f$description =
      Field('description', _$description, opt: true);

  @override
  final Map<Symbol, Field<Product, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #altName: _f$altName,
    #primaryFolderId: _f$primaryFolderId,
    #secondaryFolderIds: _f$secondaryFolderIds,
    #pictureFileId: _f$pictureFileId,
    #videoLink: _f$videoLink,
    #vendorCode: _f$vendorCode,
    #description: _f$description,
  };

  @override
  final String discriminatorKey = '_baseType';
  @override
  final dynamic discriminatorValue = 'Product';
  @override
  late final ClassMapperBase superMapper = BaseModelMapper.ensureInitialized();

  static Product _instantiate(DecodingData data) {
    return Product(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        altName: data.dec(_f$altName),
        primaryFolderId: data.dec(_f$primaryFolderId),
        secondaryFolderIds: data.dec(_f$secondaryFolderIds),
        pictureFileId: data.dec(_f$pictureFileId),
        videoLink: data.dec(_f$videoLink),
        vendorCode: data.dec(_f$vendorCode),
        description: data.dec(_f$description));
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
    implements BaseModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get secondaryFolderIds;
  @override
  $R call(
      {String? id,
      String? name,
      String? altName,
      String? primaryFolderId,
      List<String>? secondaryFolderIds,
      String? pictureFileId,
      String? videoLink,
      String? vendorCode,
      String? description});
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get secondaryFolderIds => $value.secondaryFolderIds != null
          ? ListCopyWith(
              $value.secondaryFolderIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(secondaryFolderIds: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? altName = $none,
          Object? primaryFolderId = $none,
          Object? secondaryFolderIds = $none,
          Object? pictureFileId = $none,
          Object? videoLink = $none,
          Object? vendorCode = $none,
          Object? description = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (altName != $none) #altName: altName,
        if (primaryFolderId != $none) #primaryFolderId: primaryFolderId,
        if (secondaryFolderIds != $none)
          #secondaryFolderIds: secondaryFolderIds,
        if (pictureFileId != $none) #pictureFileId: pictureFileId,
        if (videoLink != $none) #videoLink: videoLink,
        if (vendorCode != $none) #vendorCode: vendorCode,
        if (description != $none) #description: description
      }));
  @override
  Product $make(CopyWithData data) => Product(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      altName: data.get(#altName, or: $value.altName),
      primaryFolderId: data.get(#primaryFolderId, or: $value.primaryFolderId),
      secondaryFolderIds:
          data.get(#secondaryFolderIds, or: $value.secondaryFolderIds),
      pictureFileId: data.get(#pictureFileId, or: $value.pictureFileId),
      videoLink: data.get(#videoLink, or: $value.videoLink),
      vendorCode: data.get(#vendorCode, or: $value.vendorCode),
      description: data.get(#description, or: $value.description));

  @override
  ProductCopyWith<$R2, Product, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProductCopyWithImpl($value, $cast, t);
}
