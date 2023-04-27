// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'business_user_account.dart';

class BusinessUserAccountMapper extends MapperBase<BusinessUserAccount> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {BusinessUserAccountMapper()},
      ))
        ..linkAll({
          UserAccountMapper.container,
          BusinessUserAccountTypeMapper.container
        }));

  @override
  BusinessUserAccountMapperElement createElement(MapperContainer container) {
    return BusinessUserAccountMapperElement._(this, container);
  }

  @override
  String get id => 'BusinessUserAccount';

  static final fromMap = container.fromMap<BusinessUserAccount>;
  static final fromJson = container.fromJson<BusinessUserAccount>;
}

class BusinessUserAccountMapperElement
    extends MapperElementBase<BusinessUserAccount> {
  BusinessUserAccountMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  BusinessUserAccount decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  BusinessUserAccount fromMap(Map<String, dynamic> map) => BusinessUserAccount(
      businessType: container.$get(map, 'businessType'),
      id: container.$get(map, 'id'),
      createDate: container.$get(map, 'createDate'),
      login: container.$get(map, 'login'),
      password: container.$get(map, 'password'),
      firstName: container.$get(map, 'firstName'),
      lastName: container.$get(map, 'lastName'),
      middleName: container.$get(map, 'middleName'),
      phone: container.$get(map, 'phone'),
      email: container.$get(map, 'email'),
      legalTitle: container.$get(map, 'legalTitle'),
      legalAbbreviation: container.$get(map, 'legalAbbreviation'),
      legalInn: container.$get(map, 'legalInn'),
      legalOgrn: container.$get(map, 'legalOgrn'),
      legalAddress: container.$get(map, 'legalAddress'),
      avatar: container.$getOpt(map, 'avatar'));

  @override
  Function get encoder => encode;
  dynamic encode(BusinessUserAccount v) => toMap(v);
  Map<String, dynamic> toMap(BusinessUserAccount b) => {
        'businessType': container.$enc(b.businessType, 'businessType'),
        'id': container.$enc(b.id, 'id'),
        'createDate': container.$enc(b.createDate, 'createDate'),
        'login': container.$enc(b.login, 'login'),
        'password': container.$enc(b.password, 'password'),
        'firstName': container.$enc(b.firstName, 'firstName'),
        'lastName': container.$enc(b.lastName, 'lastName'),
        'middleName': container.$enc(b.middleName, 'middleName'),
        'phone': container.$enc(b.phone, 'phone'),
        'email': container.$enc(b.email, 'email'),
        'legalTitle': container.$enc(b.legalTitle, 'legalTitle'),
        'legalAbbreviation':
            container.$enc(b.legalAbbreviation, 'legalAbbreviation'),
        'legalInn': container.$enc(b.legalInn, 'legalInn'),
        'legalOgrn': container.$enc(b.legalOgrn, 'legalOgrn'),
        'legalAddress': container.$enc(b.legalAddress, 'legalAddress'),
        'avatar': container.$enc(b.avatar, 'avatar')
      };

  @override
  String stringify(BusinessUserAccount self) =>
      'BusinessUserAccount(id: ${container.asString(self.id)}, createDate: ${container.asString(self.createDate)}, login: ${container.asString(self.login)}, password: ${container.asString(self.password)}, phone: ${container.asString(self.phone)}, email: ${container.asString(self.email)}, firstName: ${container.asString(self.firstName)}, lastName: ${container.asString(self.lastName)}, middleName: ${container.asString(self.middleName)}, legalTitle: ${container.asString(self.legalTitle)}, legalAbbreviation: ${container.asString(self.legalAbbreviation)}, legalInn: ${container.asString(self.legalInn)}, legalOgrn: ${container.asString(self.legalOgrn)}, legalAddress: ${container.asString(self.legalAddress)}, avatar: ${container.asString(self.avatar)}, businessType: ${container.asString(self.businessType)})';
  @override
  int hash(BusinessUserAccount self) =>
      container.hash(self.id) ^
      container.hash(self.createDate) ^
      container.hash(self.login) ^
      container.hash(self.password) ^
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
      container.hash(self.businessType);
  @override
  bool equals(BusinessUserAccount self, BusinessUserAccount other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.createDate, other.createDate) &&
      container.isEqual(self.login, other.login) &&
      container.isEqual(self.password, other.password) &&
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
      container.isEqual(self.businessType, other.businessType);
}

mixin BusinessUserAccountMappable {
  String toJson() =>
      BusinessUserAccountMapper.container.toJson(this as BusinessUserAccount);
  Map<String, dynamic> toMap() =>
      BusinessUserAccountMapper.container.toMap(this as BusinessUserAccount);
  BusinessUserAccountCopyWith<BusinessUserAccount, BusinessUserAccount,
          BusinessUserAccount>
      get copyWith => _BusinessUserAccountCopyWithImpl(
          this as BusinessUserAccount, $identity, $identity);
  @override
  String toString() => BusinessUserAccountMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BusinessUserAccountMapper.container.isEqual(this, other));
  @override
  int get hashCode => BusinessUserAccountMapper.container.hash(this);
}

extension BusinessUserAccountValueCopy<$R, $Out extends BaseModel>
    on ObjectCopyWith<$R, BusinessUserAccount, $Out> {
  BusinessUserAccountCopyWith<$R, BusinessUserAccount, $Out>
      get asBusinessUserAccount =>
          base.as((v, t, t2) => _BusinessUserAccountCopyWithImpl(v, t, t2));
}

typedef BusinessUserAccountCopyWithBound = BaseModel;

abstract class BusinessUserAccountCopyWith<$R, $In extends BusinessUserAccount,
    $Out extends BaseModel> implements UserAccountCopyWith<$R, $In, $Out> {
  BusinessUserAccountCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends BaseModel>(
          Then<BusinessUserAccount, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call(
      {BusinessUserAccountType? businessType,
      String? id,
      DateTime? createDate,
      String? login,
      String? password,
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

class _BusinessUserAccountCopyWithImpl<$R, $Out extends BaseModel>
    extends CopyWithBase<$R, BusinessUserAccount, $Out>
    implements BusinessUserAccountCopyWith<$R, BusinessUserAccount, $Out> {
  _BusinessUserAccountCopyWithImpl(super.value, super.then, super.then2);
  @override
  BusinessUserAccountCopyWith<$R2, BusinessUserAccount, $Out2>
      chain<$R2, $Out2 extends BaseModel>(
              Then<BusinessUserAccount, $Out2> t, Then<$Out2, $R2> t2) =>
          _BusinessUserAccountCopyWithImpl($value, t, t2);

  @override
  $R call(
          {BusinessUserAccountType? businessType,
          String? id,
          DateTime? createDate,
          String? login,
          String? password,
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
          Object? avatar = $none}) =>
      $then(BusinessUserAccount(
          businessType: businessType ?? $value.businessType,
          id: id ?? $value.id,
          createDate: createDate ?? $value.createDate,
          login: login ?? $value.login,
          password: password ?? $value.password,
          firstName: firstName ?? $value.firstName,
          lastName: lastName ?? $value.lastName,
          middleName: middleName ?? $value.middleName,
          phone: phone ?? $value.phone,
          email: email ?? $value.email,
          legalTitle: legalTitle ?? $value.legalTitle,
          legalAbbreviation: legalAbbreviation ?? $value.legalAbbreviation,
          legalInn: legalInn ?? $value.legalInn,
          legalOgrn: legalOgrn ?? $value.legalOgrn,
          legalAddress: legalAddress ?? $value.legalAddress,
          avatar: or(avatar, $value.avatar)));
}

class BusinessUserAccountTypeMapper
    extends EnumMapper<BusinessUserAccountType> {
  static MapperContainer container = MapperContainer(
    mappers: {BusinessUserAccountTypeMapper()},
  );

  static final fromValue = container.fromValue<BusinessUserAccountType>;

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
  String toValue() =>
      BusinessUserAccountTypeMapper.container.toValue(this) as String;
}
