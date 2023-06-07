// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'pro_user_account.dart';

class ProUserAccountTypeMapper extends EnumMapper<ProUserAccountType> {
  ProUserAccountTypeMapper._();

  static ProUserAccountTypeMapper? _instance;
  static ProUserAccountTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProUserAccountTypeMapper._());
    }
    return _instance!;
  }

  static ProUserAccountType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProUserAccountType decode(dynamic value) {
    switch (value) {
      case 'foreman':
        return ProUserAccountType.foreman;
      case 'builder':
        return ProUserAccountType.builder;
      case 'architect':
        return ProUserAccountType.architect;
      case 'projector':
        return ProUserAccountType.projector;
      case 'designer':
        return ProUserAccountType.designer;
      case 'seller':
        return ProUserAccountType.seller;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ProUserAccountType self) {
    switch (self) {
      case ProUserAccountType.foreman:
        return 'foreman';
      case ProUserAccountType.builder:
        return 'builder';
      case ProUserAccountType.architect:
        return 'architect';
      case ProUserAccountType.projector:
        return 'projector';
      case ProUserAccountType.designer:
        return 'designer';
      case ProUserAccountType.seller:
        return 'seller';
    }
  }
}

extension ProUserAccountTypeMapperExtension on ProUserAccountType {
  String toValue() {
    ProUserAccountTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ProUserAccountMapper extends SubClassMapperBase<ProUserAccount> {
  ProUserAccountMapper._();

  static ProUserAccountMapper? _instance;
  static ProUserAccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProUserAccountMapper._());
      UserAccountMapper.ensureInitialized().addSubMapper(_instance!);
      ProUserAccountTypeMapper.ensureInitialized();
      FileSetMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ProUserAccount';

  static String? _$publicIdentity(ProUserAccount v) => v.publicIdentity;
  static const Field<ProUserAccount, String> _f$publicIdentity = Field(
      'publicIdentity', _$publicIdentity,
      key: 'public_identity', opt: true);
  static ProUserAccountType? _$proType(ProUserAccount v) => v.proType;
  static const Field<ProUserAccount, ProUserAccountType> _f$proType =
      Field('proType', _$proType, key: 'pro_type', opt: true);
  static String? _$id(ProUserAccount v) => v.id;
  static const Field<ProUserAccount, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static DateTime? _$created(ProUserAccount v) => v.created;
  static const Field<ProUserAccount, DateTime> _f$created =
      Field('created', _$created, opt: true);
  static String? _$createdBy(ProUserAccount v) => v.createdBy;
  static const Field<ProUserAccount, String> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by', opt: true);
  static DateTime? _$modified(ProUserAccount v) => v.modified;
  static const Field<ProUserAccount, DateTime> _f$modified =
      Field('modified', _$modified, opt: true);
  static String? _$modifiedBy(ProUserAccount v) => v.modifiedBy;
  static const Field<ProUserAccount, String> _f$modifiedBy =
      Field('modifiedBy', _$modifiedBy, key: 'modified_by', opt: true);
  static String? _$login(ProUserAccount v) => v.login;
  static const Field<ProUserAccount, String> _f$login =
      Field('login', _$login, opt: true);
  static String? _$password(ProUserAccount v) => v.password;
  static const Field<ProUserAccount, String> _f$password =
      Field('password', _$password, opt: true);
  static String? _$firstName(ProUserAccount v) => v.firstName;
  static const Field<ProUserAccount, String> _f$firstName =
      Field('firstName', _$firstName, key: 'firstname', opt: true);
  static String? _$lastName(ProUserAccount v) => v.lastName;
  static const Field<ProUserAccount, String> _f$lastName =
      Field('lastName', _$lastName, key: 'lastname', opt: true);
  static String? _$middleName(ProUserAccount v) => v.middleName;
  static const Field<ProUserAccount, String> _f$middleName =
      Field('middleName', _$middleName, key: 'middlename', opt: true);
  static String? _$email(ProUserAccount v) => v.email;
  static const Field<ProUserAccount, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$legalTitle(ProUserAccount v) => v.legalTitle;
  static const Field<ProUserAccount, String> _f$legalTitle =
      Field('legalTitle', _$legalTitle, key: 'legal_title', opt: true);
  static String? _$legalAbbreviation(ProUserAccount v) => v.legalAbbreviation;
  static const Field<ProUserAccount, String> _f$legalAbbreviation = Field(
      'legalAbbreviation', _$legalAbbreviation,
      key: 'legal_abbreviation', opt: true);
  static String? _$legalInn(ProUserAccount v) => v.legalInn;
  static const Field<ProUserAccount, String> _f$legalInn =
      Field('legalInn', _$legalInn, key: 'legal_inn', opt: true);
  static String? _$legalOgrn(ProUserAccount v) => v.legalOgrn;
  static const Field<ProUserAccount, String> _f$legalOgrn =
      Field('legalOgrn', _$legalOgrn, key: 'legal_ogrn', opt: true);
  static String? _$legalAddress(ProUserAccount v) => v.legalAddress;
  static const Field<ProUserAccount, String> _f$legalAddress =
      Field('legalAddress', _$legalAddress, key: 'legal_address', opt: true);
  static FileSet _$avatar(ProUserAccount v) => v.avatar;
  static const Field<ProUserAccount, FileSet> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final Map<Symbol, Field<ProUserAccount, dynamic>> fields = const {
    #publicIdentity: _f$publicIdentity,
    #proType: _f$proType,
    #id: _f$id,
    #created: _f$created,
    #createdBy: _f$createdBy,
    #modified: _f$modified,
    #modifiedBy: _f$modifiedBy,
    #login: _f$login,
    #password: _f$password,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #middleName: _f$middleName,
    #email: _f$email,
    #legalTitle: _f$legalTitle,
    #legalAbbreviation: _f$legalAbbreviation,
    #legalInn: _f$legalInn,
    #legalOgrn: _f$legalOgrn,
    #legalAddress: _f$legalAddress,
    #avatar: _f$avatar,
  };

  @override
  final String discriminatorKey = '_accountType';
  @override
  final dynamic discriminatorValue = 'ProUserAccount';
  @override
  late final ClassMapperBase superMapper =
      UserAccountMapper.ensureInitialized();

  static ProUserAccount _instantiate(DecodingData data) {
    return ProUserAccount(
        publicIdentity: data.dec(_f$publicIdentity),
        proType: data.dec(_f$proType),
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        createdBy: data.dec(_f$createdBy),
        modified: data.dec(_f$modified),
        modifiedBy: data.dec(_f$modifiedBy),
        login: data.dec(_f$login),
        password: data.dec(_f$password),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        middleName: data.dec(_f$middleName),
        email: data.dec(_f$email),
        legalTitle: data.dec(_f$legalTitle),
        legalAbbreviation: data.dec(_f$legalAbbreviation),
        legalInn: data.dec(_f$legalInn),
        legalOgrn: data.dec(_f$legalOgrn),
        legalAddress: data.dec(_f$legalAddress),
        avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static ProUserAccount fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ProUserAccount>(map));
  }

  static ProUserAccount fromJson(String json) {
    return _guard((c) => c.fromJson<ProUserAccount>(json));
  }
}

mixin ProUserAccountMappable {
  String toJson() {
    return ProUserAccountMapper._guard((c) => c.toJson(this as ProUserAccount));
  }

  Map<String, dynamic> toMap() {
    return ProUserAccountMapper._guard((c) => c.toMap(this as ProUserAccount));
  }

  ProUserAccountCopyWith<ProUserAccount, ProUserAccount, ProUserAccount>
      get copyWith => _ProUserAccountCopyWithImpl(
          this as ProUserAccount, $identity, $identity);
  @override
  String toString() {
    return ProUserAccountMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProUserAccountMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ProUserAccountMapper._guard((c) => c.hash(this));
  }
}

extension ProUserAccountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProUserAccount, $Out> {
  ProUserAccountCopyWith<$R, ProUserAccount, $Out> get $asProUserAccount =>
      $base.as((v, t, t2) => _ProUserAccountCopyWithImpl(v, t, t2));
}

abstract class ProUserAccountCopyWith<$R, $In extends ProUserAccount, $Out>
    implements UserAccountCopyWith<$R, $In, $Out> {
  @override
  FileSetCopyWith<$R, FileSet, FileSet> get avatar;
  @override
  $R call(
      {String? publicIdentity,
      ProUserAccountType? proType,
      String? id,
      DateTime? created,
      String? createdBy,
      DateTime? modified,
      String? modifiedBy,
      String? login,
      String? password,
      String? firstName,
      String? lastName,
      String? middleName,
      String? email,
      String? legalTitle,
      String? legalAbbreviation,
      String? legalInn,
      String? legalOgrn,
      String? legalAddress,
      FileSet? avatar});
  ProUserAccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProUserAccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProUserAccount, $Out>
    implements ProUserAccountCopyWith<$R, ProUserAccount, $Out> {
  _ProUserAccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProUserAccount> $mapper =
      ProUserAccountMapper.ensureInitialized();
  @override
  FileSetCopyWith<$R, FileSet, FileSet> get avatar =>
      ($value.avatar as FileSet).copyWith.$chain((v) => call(avatar: v));
  @override
  $R call(
          {Object? publicIdentity = $none,
          Object? proType = $none,
          Object? id = $none,
          Object? created = $none,
          Object? createdBy = $none,
          Object? modified = $none,
          Object? modifiedBy = $none,
          Object? login = $none,
          Object? password = $none,
          Object? firstName = $none,
          Object? lastName = $none,
          Object? middleName = $none,
          Object? email = $none,
          Object? legalTitle = $none,
          Object? legalAbbreviation = $none,
          Object? legalInn = $none,
          Object? legalOgrn = $none,
          Object? legalAddress = $none,
          Object? avatar = $none}) =>
      $apply(FieldCopyWithData({
        if (publicIdentity != $none) #publicIdentity: publicIdentity,
        if (proType != $none) #proType: proType,
        if (id != $none) #id: id,
        if (created != $none) #created: created,
        if (createdBy != $none) #createdBy: createdBy,
        if (modified != $none) #modified: modified,
        if (modifiedBy != $none) #modifiedBy: modifiedBy,
        if (login != $none) #login: login,
        if (password != $none) #password: password,
        if (firstName != $none) #firstName: firstName,
        if (lastName != $none) #lastName: lastName,
        if (middleName != $none) #middleName: middleName,
        if (email != $none) #email: email,
        if (legalTitle != $none) #legalTitle: legalTitle,
        if (legalAbbreviation != $none) #legalAbbreviation: legalAbbreviation,
        if (legalInn != $none) #legalInn: legalInn,
        if (legalOgrn != $none) #legalOgrn: legalOgrn,
        if (legalAddress != $none) #legalAddress: legalAddress,
        if (avatar != $none) #avatar: avatar
      }));
  @override
  ProUserAccount $make(CopyWithData data) => ProUserAccount(
      publicIdentity: data.get(#publicIdentity, or: $value.publicIdentity),
      proType: data.get(#proType, or: $value.proType),
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      modified: data.get(#modified, or: $value.modified),
      modifiedBy: data.get(#modifiedBy, or: $value.modifiedBy),
      login: data.get(#login, or: $value.login),
      password: data.get(#password, or: $value.password),
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName),
      middleName: data.get(#middleName, or: $value.middleName),
      email: data.get(#email, or: $value.email),
      legalTitle: data.get(#legalTitle, or: $value.legalTitle),
      legalAbbreviation:
          data.get(#legalAbbreviation, or: $value.legalAbbreviation),
      legalInn: data.get(#legalInn, or: $value.legalInn),
      legalOgrn: data.get(#legalOgrn, or: $value.legalOgrn),
      legalAddress: data.get(#legalAddress, or: $value.legalAddress),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  ProUserAccountCopyWith<$R2, ProUserAccount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProUserAccountCopyWithImpl($value, $cast, t);
}
