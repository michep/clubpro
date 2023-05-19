// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'business_user_account.dart';

class BusinessUserAccountTypeMapper
    extends EnumMapper<BusinessUserAccountType> {
  BusinessUserAccountTypeMapper._();

  static BusinessUserAccountTypeMapper? _instance;
  static BusinessUserAccountTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = BusinessUserAccountTypeMapper._());
    }
    return _instance!;
  }

  static BusinessUserAccountType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BusinessUserAccountType decode(dynamic value) {
    switch (value) {
      case 'manufacturer':
        return BusinessUserAccountType.manufacturer;
      case 'distributor':
        return BusinessUserAccountType.distributor;
      case 'chainstore':
        return BusinessUserAccountType.chainstore;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BusinessUserAccountType self) {
    switch (self) {
      case BusinessUserAccountType.manufacturer:
        return 'manufacturer';
      case BusinessUserAccountType.distributor:
        return 'distributor';
      case BusinessUserAccountType.chainstore:
        return 'chainstore';
    }
  }
}

extension BusinessUserAccountTypeMapperExtension on BusinessUserAccountType {
  String toValue() {
    BusinessUserAccountTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class BusinessUserAccountMapper
    extends SubClassMapperBase<BusinessUserAccount> {
  BusinessUserAccountMapper._();

  static BusinessUserAccountMapper? _instance;
  static BusinessUserAccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BusinessUserAccountMapper._());
      UserAccountMapper.ensureInitialized().addSubMapper(_instance!);
      BusinessUserAccountTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BusinessUserAccount';

  static BusinessUserAccountType? _$businessType(BusinessUserAccount v) =>
      v.businessType;
  static const Field<BusinessUserAccount, BusinessUserAccountType>
      _f$businessType =
      Field('businessType', _$businessType, key: 'business_type', opt: true);
  static String? _$id(BusinessUserAccount v) => v.id;
  static const Field<BusinessUserAccount, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$login(BusinessUserAccount v) => v.login;
  static const Field<BusinessUserAccount, String> _f$login =
      Field('login', _$login, opt: true);
  static String? _$password(BusinessUserAccount v) => v.password;
  static const Field<BusinessUserAccount, String> _f$password =
      Field('password', _$password, opt: true);
  static String? _$firstName(BusinessUserAccount v) => v.firstName;
  static const Field<BusinessUserAccount, String> _f$firstName =
      Field('firstName', _$firstName, key: 'firstname', opt: true);
  static String? _$lastName(BusinessUserAccount v) => v.lastName;
  static const Field<BusinessUserAccount, String> _f$lastName =
      Field('lastName', _$lastName, key: 'lastname', opt: true);
  static String? _$middleName(BusinessUserAccount v) => v.middleName;
  static const Field<BusinessUserAccount, String> _f$middleName =
      Field('middleName', _$middleName, key: 'middlename', opt: true);
  static String? _$email(BusinessUserAccount v) => v.email;
  static const Field<BusinessUserAccount, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$legalTitle(BusinessUserAccount v) => v.legalTitle;
  static const Field<BusinessUserAccount, String> _f$legalTitle =
      Field('legalTitle', _$legalTitle, key: 'legal_title', opt: true);
  static String? _$legalAbbreviation(BusinessUserAccount v) =>
      v.legalAbbreviation;
  static const Field<BusinessUserAccount, String> _f$legalAbbreviation = Field(
      'legalAbbreviation', _$legalAbbreviation,
      key: 'legal_abbreviation', opt: true);
  static String? _$legalInn(BusinessUserAccount v) => v.legalInn;
  static const Field<BusinessUserAccount, String> _f$legalInn =
      Field('legalInn', _$legalInn, key: 'legal_inn', opt: true);
  static String? _$legalOgrn(BusinessUserAccount v) => v.legalOgrn;
  static const Field<BusinessUserAccount, String> _f$legalOgrn =
      Field('legalOgrn', _$legalOgrn, key: 'legal_ogrn', opt: true);
  static String? _$legalAddress(BusinessUserAccount v) => v.legalAddress;
  static const Field<BusinessUserAccount, String> _f$legalAddress =
      Field('legalAddress', _$legalAddress, key: 'legal_address', opt: true);
  static String? _$avatarFileId(BusinessUserAccount v) => v.avatarFileId;
  static const Field<BusinessUserAccount, String> _f$avatarFileId =
      Field('avatarFileId', _$avatarFileId, key: 'avatar_file_id', opt: true);

  @override
  final Map<Symbol, Field<BusinessUserAccount, dynamic>> fields = const {
    #businessType: _f$businessType,
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
    #avatarFileId: _f$avatarFileId,
  };

  @override
  final String discriminatorKey = '_accountType';
  @override
  final dynamic discriminatorValue = 'BusinessUserAccount';
  @override
  late final ClassMapperBase superMapper =
      UserAccountMapper.ensureInitialized();

  static BusinessUserAccount _instantiate(DecodingData data) {
    return BusinessUserAccount(
        businessType: data.dec(_f$businessType),
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
        avatarFileId: data.dec(_f$avatarFileId));
  }

  @override
  final Function instantiate = _instantiate;

  static BusinessUserAccount fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BusinessUserAccount>(map));
  }

  static BusinessUserAccount fromJson(String json) {
    return _guard((c) => c.fromJson<BusinessUserAccount>(json));
  }
}

mixin BusinessUserAccountMappable {
  String toJson() {
    return BusinessUserAccountMapper._guard(
        (c) => c.toJson(this as BusinessUserAccount));
  }

  Map<String, dynamic> toMap() {
    return BusinessUserAccountMapper._guard(
        (c) => c.toMap(this as BusinessUserAccount));
  }

  BusinessUserAccountCopyWith<BusinessUserAccount, BusinessUserAccount,
          BusinessUserAccount>
      get copyWith => _BusinessUserAccountCopyWithImpl(
          this as BusinessUserAccount, $identity, $identity);
  @override
  String toString() {
    return BusinessUserAccountMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BusinessUserAccountMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BusinessUserAccountMapper._guard((c) => c.hash(this));
  }
}

extension BusinessUserAccountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BusinessUserAccount, $Out> {
  BusinessUserAccountCopyWith<$R, BusinessUserAccount, $Out>
      get $asBusinessUserAccount =>
          $base.as((v, t, t2) => _BusinessUserAccountCopyWithImpl(v, t, t2));
}

abstract class BusinessUserAccountCopyWith<$R, $In extends BusinessUserAccount,
    $Out> implements UserAccountCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {BusinessUserAccountType? businessType,
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
      String? avatarFileId});
  BusinessUserAccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BusinessUserAccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BusinessUserAccount, $Out>
    implements BusinessUserAccountCopyWith<$R, BusinessUserAccount, $Out> {
  _BusinessUserAccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BusinessUserAccount> $mapper =
      BusinessUserAccountMapper.ensureInitialized();
  @override
  $R call(
          {Object? businessType = $none,
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
          Object? avatarFileId = $none}) =>
      $apply(FieldCopyWithData({
        if (businessType != $none) #businessType: businessType,
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
        if (avatarFileId != $none) #avatarFileId: avatarFileId
      }));
  @override
  BusinessUserAccount $make(CopyWithData data) => BusinessUserAccount(
      businessType: data.get(#businessType, or: $value.businessType),
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
      avatarFileId: data.get(#avatarFileId, or: $value.avatarFileId));

  @override
  BusinessUserAccountCopyWith<$R2, BusinessUserAccount, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BusinessUserAccountCopyWithImpl($value, $cast, t);
}
