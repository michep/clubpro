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
      publicID: container.$get(map, 'publicID'),
      proType: container.$get(map, 'proType'),
      id: container.$get(map, '_id'),
      login: container.$get(map, 'login'),
      firstName: container.$get(map, 'firstName'),
      lastName: container.$get(map, 'lastName'),
      middleName: container.$getOpt(map, 'middleName'),
      phone: container.$get(map, 'phone'),
      email: container.$get(map, 'email'),
      legalTitle: container.$getOpt(map, 'legalTitle'),
      legalAbbreviation: container.$getOpt(map, 'legalAbbreviation'),
      legalInn: container.$getOpt(map, 'legalInn'),
      legalOgrn: container.$getOpt(map, 'legalOgrn'),
      legalAddress: container.$getOpt(map, 'legalAddress'),
      avatar: container.$getOpt(map, 'avatar'));

  @override
  Function get encoder => encode;
  dynamic encode(ProUserAccount v) => toMap(v);
  Map<String, dynamic> toMap(ProUserAccount p) => {
        'publicID': container.$enc(p.publicID, 'publicID'),
        'proType': container.$enc(p.proType, 'proType'),
        '_id': container.$enc(p.id, 'id'),
        'login': container.$enc(p.login, 'login'),
        'firstName': container.$enc(p.firstName, 'firstName'),
        'lastName': container.$enc(p.lastName, 'lastName'),
        'middleName': container.$enc(p.middleName, 'middleName'),
        'phone': container.$enc(p.phone, 'phone'),
        'email': container.$enc(p.email, 'email'),
        'legalTitle': container.$enc(p.legalTitle, 'legalTitle'),
        'legalAbbreviation':
            container.$enc(p.legalAbbreviation, 'legalAbbreviation'),
        'legalInn': container.$enc(p.legalInn, 'legalInn'),
        'legalOgrn': container.$enc(p.legalOgrn, 'legalOgrn'),
        'legalAddress': container.$enc(p.legalAddress, 'legalAddress'),
        'avatar': container.$enc(p.avatar, 'avatar'),
        'type': 'ProUserAccount'
      };

  @override
  String stringify(ProUserAccount self) =>
      'ProUserAccount(id: ${container.asString(self.id)}, login: ${container.asString(self.login)}, phone: ${container.asString(self.phone)}, email: ${container.asString(self.email)}, firstName: ${container.asString(self.firstName)}, lastName: ${container.asString(self.lastName)}, middleName: ${container.asString(self.middleName)}, legalTitle: ${container.asString(self.legalTitle)}, legalAbbreviation: ${container.asString(self.legalAbbreviation)}, legalInn: ${container.asString(self.legalInn)}, legalOgrn: ${container.asString(self.legalOgrn)}, legalAddress: ${container.asString(self.legalAddress)}, avatar: ${container.asString(self.avatar)}, publicID: ${container.asString(self.publicID)}, proType: ${container.asString(self.proType)})';
  @override
  int hash(ProUserAccount self) =>
      container.hash(self.id) ^
      container.hash(self.login) ^
      container.hash(self.phone) ^
      container.hash(self.email) ^
      container.hash(self.firstName) ^
      container.hash(self.lastName) ^
      container.hash(self.middleName) ^
      container.hash(self.legalTitle) ^
      container.hash(self.legalAbbreviation) ^
      container.hash(self.legalInn) ^
      container.hash(self.legalOgrn) ^
      container.hash(self.legalAddress) ^
      container.hash(self.avatar) ^
      container.hash(self.publicID) ^
      container.hash(self.proType);
  @override
  bool equals(ProUserAccount self, ProUserAccount other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.login, other.login) &&
      container.isEqual(self.phone, other.phone) &&
      container.isEqual(self.email, other.email) &&
      container.isEqual(self.firstName, other.firstName) &&
      container.isEqual(self.lastName, other.lastName) &&
      container.isEqual(self.middleName, other.middleName) &&
      container.isEqual(self.legalTitle, other.legalTitle) &&
      container.isEqual(self.legalAbbreviation, other.legalAbbreviation) &&
      container.isEqual(self.legalInn, other.legalInn) &&
      container.isEqual(self.legalOgrn, other.legalOgrn) &&
      container.isEqual(self.legalAddress, other.legalAddress) &&
      container.isEqual(self.avatar, other.avatar) &&
      container.isEqual(self.publicID, other.publicID) &&
      container.isEqual(self.proType, other.proType);
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
      {String? publicID,
      ProUserAccountType? proType,
      String? id,
      String? login,
      String? firstName,
      String? lastName,
      String? middleName,
      String? phone,
      String? email,
      String? legalTitle,
      String? legalAbbreviation,
      String? legalInn,
      String? legalOgrn,
      String? legalAddress,
      Uint8List? avatar});
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
          {String? publicID,
          ProUserAccountType? proType,
          String? id,
          String? login,
          String? firstName,
          String? lastName,
          Object? middleName = $none,
          String? phone,
          String? email,
          Object? legalTitle = $none,
          Object? legalAbbreviation = $none,
          Object? legalInn = $none,
          Object? legalOgrn = $none,
          Object? legalAddress = $none,
          Object? avatar = $none}) =>
      $then(ProUserAccount(
          publicID: publicID ?? $value.publicID,
          proType: proType ?? $value.proType,
          id: id ?? $value.id,
          login: login ?? $value.login,
          firstName: firstName ?? $value.firstName,
          lastName: lastName ?? $value.lastName,
          middleName: or(middleName, $value.middleName),
          phone: phone ?? $value.phone,
          email: email ?? $value.email,
          legalTitle: or(legalTitle, $value.legalTitle),
          legalAbbreviation: or(legalAbbreviation, $value.legalAbbreviation),
          legalInn: or(legalInn, $value.legalInn),
          legalOgrn: or(legalOgrn, $value.legalOgrn),
          legalAddress: or(legalAddress, $value.legalAddress),
          avatar: or(avatar, $value.avatar)));
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
