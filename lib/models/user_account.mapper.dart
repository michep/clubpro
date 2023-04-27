// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_account.dart';

class UserAccountMapper extends MapperBase<UserAccount> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {UserAccountMapper()},
      ))
        ..linkAll({
          BaseModelMapper.container,
          ProUserAccountMapper.container,
          BusinessUserAccountMapper.container,
        }));

  @override
  UserAccountMapperElement createElement(MapperContainer container) {
    return UserAccountMapperElement._(this, container);
  }

  @override
  String get id => 'UserAccount';

  static final fromMap = container.fromMap<UserAccount>;
  static final fromJson = container.fromJson<UserAccount>;
}

class UserAccountMapperElement extends MapperElementBase<UserAccount> {
  UserAccountMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  UserAccount decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
        switch (map['type']) {
          case 'BusinessUserAccount':
            return BusinessUserAccountMapper()
                .createElement(container)
                .decode(map);
          case 'ProUserAccount':
            return ProUserAccountMapper().createElement(container).decode(map);
          default:
            return fromMap(map);
        }
      });
  UserAccount fromMap(Map<String, dynamic> map) => UserAccount(
      id: container.$getOpt(map, 'id'),
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
      avatar: container.$getOpt(map, 'avatar'));

  @override
  Function get encoder => encode;
  dynamic encode(UserAccount v) => toMap(v);
  Map<String, dynamic> toMap(UserAccount u) => {
        'id': container.$enc(u.id, 'id'),
        'createDate': container.$enc(u.createDate, 'createDate'),
        'login': container.$enc(u.login, 'login'),
        'password': container.$enc(u.password, 'password'),
        'phone': container.$enc(u.phone, 'phone'),
        'email': container.$enc(u.email, 'email'),
        'firstName': container.$enc(u.firstName, 'firstName'),
        'lastName': container.$enc(u.lastName, 'lastName'),
        'middleName': container.$enc(u.middleName, 'middleName'),
        'title': container.$enc(u.title, 'title'),
        'abbreviation': container.$enc(u.abbreviation, 'abbreviation'),
        'inn': container.$enc(u.inn, 'inn'),
        'ogrn': container.$enc(u.ogrn, 'ogrn'),
        'legalAddress': container.$enc(u.legalAddress, 'legalAddress'),
        'avatar': container.$enc(u.avatar, 'avatar')
      };

  @override
  String stringify(UserAccount self) =>
      'UserAccount(id: ${container.asString(self.id)}, createDate: ${container.asString(self.createDate)}, fromMap: ${container.asString(self.fromMap)}, fromJson: ${container.asString(self.fromJson)}, login: ${container.asString(self.login)}, password: ${container.asString(self.password)}, phone: ${container.asString(self.phone)}, email: ${container.asString(self.email)}, firstName: ${container.asString(self.firstName)}, lastName: ${container.asString(self.lastName)}, middleName: ${container.asString(self.middleName)}, title: ${container.asString(self.title)}, abbreviation: ${container.asString(self.abbreviation)}, inn: ${container.asString(self.inn)}, ogrn: ${container.asString(self.ogrn)}, legalAddress: ${container.asString(self.legalAddress)}, avatar: ${container.asString(self.avatar)}, fromMap: ${container.asString(self.fromMap)}, fromJson: ${container.asString(self.fromJson)})';
  @override
  int hash(UserAccount self) =>
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
      container.hash(self.fromJson);
  @override
  bool equals(UserAccount self, UserAccount other) =>
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
      container.isEqual(self.fromJson, other.fromJson);
}

mixin UserAccountMappable {
  String toJson() => UserAccountMapper.container.toJson(this as UserAccount);
  Map<String, dynamic> toMap() =>
      UserAccountMapper.container.toMap(this as UserAccount);
  UserAccountCopyWith<UserAccount, UserAccount, UserAccount> get copyWith =>
      _UserAccountCopyWithImpl(this as UserAccount, $identity, $identity);
  @override
  String toString() => UserAccountMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          UserAccountMapper.container.isEqual(this, other));
  @override
  int get hashCode => UserAccountMapper.container.hash(this);
}

extension UserAccountValueCopy<$R, $Out extends BaseModel>
    on ObjectCopyWith<$R, UserAccount, $Out> {
  UserAccountCopyWith<$R, UserAccount, $Out> get asUserAccount =>
      base.as((v, t, t2) => _UserAccountCopyWithImpl(v, t, t2));
}

typedef UserAccountCopyWithBound = BaseModel;

abstract class UserAccountCopyWith<$R, $In extends UserAccount,
    $Out extends BaseModel> implements BaseModelCopyWith<$R, $In, $Out> {
  UserAccountCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends BaseModel>(
      Then<UserAccount, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call(
      {dynamic id,
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
      Uint8List? avatar});
}

class _UserAccountCopyWithImpl<$R, $Out extends BaseModel>
    extends CopyWithBase<$R, UserAccount, $Out>
    implements UserAccountCopyWith<$R, UserAccount, $Out> {
  _UserAccountCopyWithImpl(super.value, super.then, super.then2);
  @override
  UserAccountCopyWith<$R2, UserAccount, $Out2>
      chain<$R2, $Out2 extends BaseModel>(
              Then<UserAccount, $Out2> t, Then<$Out2, $R2> t2) =>
          _UserAccountCopyWithImpl($value, t, t2);

  @override
  $R call(
          {Object? id = $none,
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
          Object? avatar = $none}) =>
      $then(UserAccount(
          id: or(id, $value.id),
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
          avatar: or(avatar, $value.avatar)));
}
