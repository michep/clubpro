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
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ProUserAccount';

  static String? _$publicID(ProUserAccount v) => v.publicID;
  static const Field<ProUserAccount, String> _f$publicID =
      Field('publicID', _$publicID, opt: true);
  static ProUserAccountType? _$proType(ProUserAccount v) => v.proType;
  static const Field<ProUserAccount, ProUserAccountType> _f$proType =
      Field('proType', _$proType, opt: true);
  static String? _$id(ProUserAccount v) => v.id;
  static const Field<ProUserAccount, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$login(ProUserAccount v) => v.login;
  static const Field<ProUserAccount, String> _f$login =
      Field('login', _$login, opt: true);
  static String? _$password(ProUserAccount v) => v.password;
  static const Field<ProUserAccount, String> _f$password =
      Field('password', _$password, opt: true);
  static String? _$firstName(ProUserAccount v) => v.firstName;
  static const Field<ProUserAccount, String> _f$firstName =
      Field('firstName', _$firstName, opt: true);
  static String? _$lastName(ProUserAccount v) => v.lastName;
  static const Field<ProUserAccount, String> _f$lastName =
      Field('lastName', _$lastName, opt: true);
  static String? _$middleName(ProUserAccount v) => v.middleName;
  static const Field<ProUserAccount, String> _f$middleName =
      Field('middleName', _$middleName, opt: true);
  static String? _$email(ProUserAccount v) => v.email;
  static const Field<ProUserAccount, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$legalTitle(ProUserAccount v) => v.legalTitle;
  static const Field<ProUserAccount, String> _f$legalTitle =
      Field('legalTitle', _$legalTitle, opt: true);
  static String? _$legalAbbreviation(ProUserAccount v) => v.legalAbbreviation;
  static const Field<ProUserAccount, String> _f$legalAbbreviation =
      Field('legalAbbreviation', _$legalAbbreviation, opt: true);
  static String? _$legalInn(ProUserAccount v) => v.legalInn;
  static const Field<ProUserAccount, String> _f$legalInn =
      Field('legalInn', _$legalInn, opt: true);
  static String? _$legalOgrn(ProUserAccount v) => v.legalOgrn;
  static const Field<ProUserAccount, String> _f$legalOgrn =
      Field('legalOgrn', _$legalOgrn, opt: true);
  static String? _$legalAddress(ProUserAccount v) => v.legalAddress;
  static const Field<ProUserAccount, String> _f$legalAddress =
      Field('legalAddress', _$legalAddress, opt: true);
  static Uint8List? _$avatar(ProUserAccount v) => v.avatar;
  static const Field<ProUserAccount, Uint8List> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final Map<Symbol, Field<ProUserAccount, dynamic>> fields = const {
    #publicID: _f$publicID,
    #proType: _f$proType,
    #id: _f$id,
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
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ProUserAccount';
  @override
  late final ClassMapperBase superMapper =
      UserAccountMapper.ensureInitialized();

  static ProUserAccount _instantiate(DecodingData data) {
    return ProUserAccount(
        publicID: data.dec(_f$publicID),
        proType: data.dec(_f$proType),
        id: data.dec(_f$id),
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
  $R call(
      {String? publicID,
      ProUserAccountType? proType,
      String? id,
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
      Uint8List? avatar});
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
  $R call(
          {Object? publicID = $none,
          Object? proType = $none,
          Object? id = $none,
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
        if (publicID != $none) #publicID: publicID,
        if (proType != $none) #proType: proType,
        if (id != $none) #id: id,
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
      publicID: data.get(#publicID, or: $value.publicID),
      proType: data.get(#proType, or: $value.proType),
      id: data.get(#id, or: $value.id),
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
