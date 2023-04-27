// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'pro_user_account.dart';

class ProUserAccountMapper extends MapperBase<ProUserAccount> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {ProUserAccountMapper()},
      ))
        ..linkAll(
            {UserAccountMapper.container, ProUserAccountTypeMapper.container}));

  @override
  ProUserAccountMapperElement createElement(MapperContainer container) {
    return ProUserAccountMapperElement._(this, container);
  }

  @override
  String get id => 'ProUserAccount';

  static final fromMap = container.fromMap<ProUserAccount>;
  static final fromJson = container.fromJson<ProUserAccount>;
}

class ProUserAccountMapperElement extends MapperElementBase<ProUserAccount> {
  ProUserAccountMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ProUserAccount decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ProUserAccount fromMap(Map<String, dynamic> map) => ProUserAccount(
      id: container.$get(map, 'id'),
      createDate: container.$getOpt(map, 'createDate'),
      login: container.$get(map, 'login'),
      password: container.$get(map, 'password'),
      phone: container.$get(map, 'phone'),
      email: container.$get(map, 'email'),
      firstName: container.$get(map, 'firstName'),
      lastName: container.$get(map, 'lastName'),
      middleName: container.$getOpt(map, 'middleName') ?? '',
      title: container.$getOpt(map, 'title') ?? '',
      abbreviation: container.$getOpt(map, 'abbreviation') ?? '',
      inn: container.$getOpt(map, 'inn') ?? '',
      ogrn: container.$getOpt(map, 'ogrn') ?? '',
      legalAddress: container.$getOpt(map, 'legalAddress') ?? '',
      avatar: container.$getOpt(map, 'avatar'),
      publicID: container.$get(map, 'publicID'),
      proType: container.$get(map, 'proType'));

  @override
  Function get encoder => encode;
  dynamic encode(ProUserAccount v) => toMap(v);
  Map<String, dynamic> toMap(ProUserAccount p) => {
        'id': container.$enc(p.id, 'id'),
        'createDate': container.$enc(p.createDate, 'createDate'),
        'login': container.$enc(p.login, 'login'),
        'password': container.$enc(p.password, 'password'),
        'phone': container.$enc(p.phone, 'phone'),
        'email': container.$enc(p.email, 'email'),
        'firstName': container.$enc(p.firstName, 'firstName'),
        'lastName': container.$enc(p.lastName, 'lastName'),
        'middleName': container.$enc(p.middleName, 'middleName'),
        'title': container.$enc(p.title, 'title'),
        'abbreviation': container.$enc(p.abbreviation, 'abbreviation'),
        'inn': container.$enc(p.inn, 'inn'),
        'ogrn': container.$enc(p.ogrn, 'ogrn'),
        'legalAddress': container.$enc(p.legalAddress, 'legalAddress'),
        'avatar': container.$enc(p.avatar, 'avatar'),
        'publicID': container.$enc(p.publicID, 'publicID'),
        'proType': container.$enc(p.proType, 'proType'),
        'type': 'ProUserAccount'
      };

  @override
  String stringify(ProUserAccount self) =>
      'ProUserAccount(id: ${container.asString(self.id)}, createDate: ${container.asString(self.createDate)}, fromMap: ${container.asString(self.fromMap)}, fromJson: ${container.asString(self.fromJson)}, login: ${container.asString(self.login)}, password: ${container.asString(self.password)}, phone: ${container.asString(self.phone)}, email: ${container.asString(self.email)}, firstName: ${container.asString(self.firstName)}, lastName: ${container.asString(self.lastName)}, middleName: ${container.asString(self.middleName)}, title: ${container.asString(self.title)}, abbreviation: ${container.asString(self.abbreviation)}, inn: ${container.asString(self.inn)}, ogrn: ${container.asString(self.ogrn)}, legalAddress: ${container.asString(self.legalAddress)}, avatar: ${container.asString(self.avatar)}, fromMap: ${container.asString(self.fromMap)}, fromJson: ${container.asString(self.fromJson)}, publicID: ${container.asString(self.publicID)}, proType: ${container.asString(self.proType)}, fromMap: ${container.asString(self.fromMap)}, fromJson: ${container.asString(self.fromJson)})';
  @override
  int hash(ProUserAccount self) =>
      container.hash(self.id) ^
      container.hash(self.createDate) ^
      container.hash(self.fromMap) ^
      container.hash(self.fromJson) ^
      container.hash(self.login) ^
      container.hash(self.password) ^
      container.hash(self.phone) ^
      container.hash(self.email) ^
      container.hash(self.firstName) ^
      container.hash(self.lastName) ^
      container.hash(self.middleName) ^
      container.hash(self.title) ^
      container.hash(self.abbreviation) ^
      container.hash(self.inn) ^
      container.hash(self.ogrn) ^
      container.hash(self.legalAddress) ^
      container.hash(self.avatar) ^
      container.hash(self.fromMap) ^
      container.hash(self.fromJson) ^
      container.hash(self.publicID) ^
      container.hash(self.proType) ^
      container.hash(self.fromMap) ^
      container.hash(self.fromJson);
  @override
  bool equals(ProUserAccount self, ProUserAccount other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.createDate, other.createDate) &&
      container.isEqual(self.fromMap, other.fromMap) &&
      container.isEqual(self.fromJson, other.fromJson) &&
      container.isEqual(self.login, other.login) &&
      container.isEqual(self.password, other.password) &&
      container.isEqual(self.phone, other.phone) &&
      container.isEqual(self.email, other.email) &&
      container.isEqual(self.firstName, other.firstName) &&
      container.isEqual(self.lastName, other.lastName) &&
      container.isEqual(self.middleName, other.middleName) &&
      container.isEqual(self.title, other.title) &&
      container.isEqual(self.abbreviation, other.abbreviation) &&
      container.isEqual(self.inn, other.inn) &&
      container.isEqual(self.ogrn, other.ogrn) &&
      container.isEqual(self.legalAddress, other.legalAddress) &&
      container.isEqual(self.avatar, other.avatar) &&
      container.isEqual(self.fromMap, other.fromMap) &&
      container.isEqual(self.fromJson, other.fromJson) &&
      container.isEqual(self.publicID, other.publicID) &&
      container.isEqual(self.proType, other.proType) &&
      container.isEqual(self.fromMap, other.fromMap) &&
      container.isEqual(self.fromJson, other.fromJson);
}

mixin ProUserAccountMappable {
  String toJson() =>
      ProUserAccountMapper.container.toJson(this as ProUserAccount);
  Map<String, dynamic> toMap() =>
      ProUserAccountMapper.container.toMap(this as ProUserAccount);
  ProUserAccountCopyWith<ProUserAccount, ProUserAccount, ProUserAccount>
      get copyWith => _ProUserAccountCopyWithImpl(
          this as ProUserAccount, $identity, $identity);
  @override
  String toString() => ProUserAccountMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ProUserAccountMapper.container.isEqual(this, other));
  @override
  int get hashCode => ProUserAccountMapper.container.hash(this);
}

extension ProUserAccountValueCopy<$R, $Out extends BaseModel>
    on ObjectCopyWith<$R, ProUserAccount, $Out> {
  ProUserAccountCopyWith<$R, ProUserAccount, $Out> get asProUserAccount =>
      base.as((v, t, t2) => _ProUserAccountCopyWithImpl(v, t, t2));
}

typedef ProUserAccountCopyWithBound = BaseModel;

abstract class ProUserAccountCopyWith<$R, $In extends ProUserAccount,
    $Out extends BaseModel> implements UserAccountCopyWith<$R, $In, $Out> {
  ProUserAccountCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends BaseModel>(
      Then<ProUserAccount, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call(
      {String? id,
      DateTime? createDate,
      String? login,
      String? password,
      String? phone,
      String? email,
      String? firstName,
      String? lastName,
      String? middleName,
      String? title,
      String? abbreviation,
      String? inn,
      String? ogrn,
      String? legalAddress,
      Uint8List? avatar,
      String? publicID,
      ProUserAccountType? proType});
}

class _ProUserAccountCopyWithImpl<$R, $Out extends BaseModel>
    extends CopyWithBase<$R, ProUserAccount, $Out>
    implements ProUserAccountCopyWith<$R, ProUserAccount, $Out> {
  _ProUserAccountCopyWithImpl(super.value, super.then, super.then2);
  @override
  ProUserAccountCopyWith<$R2, ProUserAccount, $Out2>
      chain<$R2, $Out2 extends BaseModel>(
              Then<ProUserAccount, $Out2> t, Then<$Out2, $R2> t2) =>
          _ProUserAccountCopyWithImpl($value, t, t2);

  @override
  $R call(
          {String? id,
          Object? createDate = $none,
          String? login,
          String? password,
          String? phone,
          String? email,
          String? firstName,
          String? lastName,
          String? middleName,
          String? title,
          String? abbreviation,
          String? inn,
          String? ogrn,
          String? legalAddress,
          Object? avatar = $none,
          String? publicID,
          ProUserAccountType? proType}) =>
      $then(ProUserAccount(
          id: id ?? $value.id,
          createDate: or(createDate, $value.createDate),
          login: login ?? $value.login,
          password: password ?? $value.password,
          phone: phone ?? $value.phone,
          email: email ?? $value.email,
          firstName: firstName ?? $value.firstName,
          lastName: lastName ?? $value.lastName,
          middleName: middleName ?? $value.middleName,
          title: title ?? $value.title,
          abbreviation: abbreviation ?? $value.abbreviation,
          inn: inn ?? $value.inn,
          ogrn: ogrn ?? $value.ogrn,
          legalAddress: legalAddress ?? $value.legalAddress,
          avatar: or(avatar, $value.avatar),
          publicID: publicID ?? $value.publicID,
          proType: proType ?? $value.proType));
}

class ProUserAccountTypeMapper extends EnumMapper<ProUserAccountType> {
  static MapperContainer container = MapperContainer(
    mappers: {ProUserAccountTypeMapper()},
  );

  static final fromValue = container.fromValue<ProUserAccountType>;

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
  String toValue() =>
      ProUserAccountTypeMapper.container.toValue(this) as String;
}
