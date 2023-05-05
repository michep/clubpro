// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_account.dart';

class UserAccountMapper extends MapperBase<UserAccount> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {UserAccountMapper(), Uint8ListMapper()},
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
      id: container.$getOpt(map, '_id'),
      login: container.$get(map, 'login'),
      password: container.$get(map, 'password'),
      firstName: container.$get(map, 'firstName'),
      lastName: container.$get(map, 'lastName'),
      middleName: container.$getOpt(map, 'middleName'),
      email: container.$get(map, 'email'),
      legalTitle: container.$getOpt(map, 'legalTitle'),
      legalAbbreviation: container.$getOpt(map, 'legalAbbreviation'),
      legalAddress: container.$getOpt(map, 'legalAddress'),
      legalInn: container.$getOpt(map, 'legalInn'),
      legalOgrn: container.$getOpt(map, 'legalOgrn'),
      avatar: container.$getOpt(map, 'avatar'));

  @override
  Function get encoder => encode;
  dynamic encode(UserAccount v) => toMap(v);
  Map<String, dynamic> toMap(UserAccount u) => {
        '_id': container.$enc(u.id, 'id'),
        'login': container.$enc(u.login, 'login'),
        'password': container.$enc(u.password, 'password'),
        'firstName': container.$enc(u.firstName, 'firstName'),
        'lastName': container.$enc(u.lastName, 'lastName'),
        'middleName': container.$enc(u.middleName, 'middleName'),
        'email': container.$enc(u.email, 'email'),
        'legalTitle': container.$enc(u.legalTitle, 'legalTitle'),
        'legalAbbreviation':
            container.$enc(u.legalAbbreviation, 'legalAbbreviation'),
        'legalAddress': container.$enc(u.legalAddress, 'legalAddress'),
        'legalInn': container.$enc(u.legalInn, 'legalInn'),
        'legalOgrn': container.$enc(u.legalOgrn, 'legalOgrn'),
        'avatar': container.$enc(u.avatar, 'avatar')
      };

  @override
  String stringify(UserAccount self) =>
      'UserAccount(id: ${container.asString(self.id)}, login: ${container.asString(self.login)}, password: ${container.asString(self.password)}, email: ${container.asString(self.email)}, firstName: ${container.asString(self.firstName)}, lastName: ${container.asString(self.lastName)}, middleName: ${container.asString(self.middleName)}, legalTitle: ${container.asString(self.legalTitle)}, legalAbbreviation: ${container.asString(self.legalAbbreviation)}, legalInn: ${container.asString(self.legalInn)}, legalOgrn: ${container.asString(self.legalOgrn)}, legalAddress: ${container.asString(self.legalAddress)}, avatar: ${container.asString(self.avatar)})';
  @override
  int hash(UserAccount self) =>
      container.hash(self.id) ^
      container.hash(self.login) ^
      container.hash(self.password) ^
      container.hash(self.email) ^
      container.hash(self.firstName) ^
      container.hash(self.lastName) ^
      container.hash(self.middleName) ^
      container.hash(self.legalTitle) ^
      container.hash(self.legalAbbreviation) ^
      container.hash(self.legalInn) ^
      container.hash(self.legalOgrn) ^
      container.hash(self.legalAddress) ^
      container.hash(self.avatar);
  @override
  bool equals(UserAccount self, UserAccount other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.login, other.login) &&
      container.isEqual(self.password, other.password) &&
      container.isEqual(self.email, other.email) &&
      container.isEqual(self.firstName, other.firstName) &&
      container.isEqual(self.lastName, other.lastName) &&
      container.isEqual(self.middleName, other.middleName) &&
      container.isEqual(self.legalTitle, other.legalTitle) &&
      container.isEqual(self.legalAbbreviation, other.legalAbbreviation) &&
      container.isEqual(self.legalInn, other.legalInn) &&
      container.isEqual(self.legalOgrn, other.legalOgrn) &&
      container.isEqual(self.legalAddress, other.legalAddress) &&
      container.isEqual(self.avatar, other.avatar);
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
      {String? id,
      String? login,
      String? password,
      String? firstName,
      String? lastName,
      String? middleName,
      String? email,
      String? legalTitle,
      String? legalAbbreviation,
      String? legalAddress,
      String? legalInn,
      String? legalOgrn,
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
          String? login,
          String? password,
          String? firstName,
          String? lastName,
          Object? middleName = $none,
          String? email,
          Object? legalTitle = $none,
          Object? legalAbbreviation = $none,
          Object? legalAddress = $none,
          Object? legalInn = $none,
          Object? legalOgrn = $none,
          Object? avatar = $none}) =>
      $then(UserAccount(
          id: or(id, $value.id),
          login: login ?? $value.login,
          password: password ?? $value.password,
          firstName: firstName ?? $value.firstName,
          lastName: lastName ?? $value.lastName,
          middleName: or(middleName, $value.middleName),
          email: email ?? $value.email,
          legalTitle: or(legalTitle, $value.legalTitle),
          legalAbbreviation: or(legalAbbreviation, $value.legalAbbreviation),
          legalAddress: or(legalAddress, $value.legalAddress),
          legalInn: or(legalInn, $value.legalInn),
          legalOgrn: or(legalOgrn, $value.legalOgrn),
          avatar: or(avatar, $value.avatar)));
}
