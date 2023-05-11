// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_account.dart';

class UserAccountMapper extends SubClassMapperBase<UserAccount> {
  UserAccountMapper._();

  static UserAccountMapper? _instance;
  static UserAccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAccountMapper._());
      BaseModelMapper.ensureInitialized().addSubMapper(_instance!);
      MapperContainer.globals.use(Uint8ListMapper());
      ProUserAccountMapper.ensureInitialized();
      BusinessUserAccountMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UserAccount';

  static String? _$id(UserAccount v) => v.id;
  static const Field<UserAccount, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$login(UserAccount v) => v.login;
  static const Field<UserAccount, String> _f$login =
      Field('login', _$login, opt: true);
  static String? _$password(UserAccount v) => v.password;
  static const Field<UserAccount, String> _f$password =
      Field('password', _$password, opt: true);
  static String? _$firstName(UserAccount v) => v.firstName;
  static const Field<UserAccount, String> _f$firstName =
      Field('firstName', _$firstName, opt: true);
  static String? _$lastName(UserAccount v) => v.lastName;
  static const Field<UserAccount, String> _f$lastName =
      Field('lastName', _$lastName, opt: true);
  static String? _$middleName(UserAccount v) => v.middleName;
  static const Field<UserAccount, String> _f$middleName =
      Field('middleName', _$middleName, opt: true);
  static String? _$email(UserAccount v) => v.email;
  static const Field<UserAccount, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$legalTitle(UserAccount v) => v.legalTitle;
  static const Field<UserAccount, String> _f$legalTitle =
      Field('legalTitle', _$legalTitle, opt: true);
  static String? _$legalAbbreviation(UserAccount v) => v.legalAbbreviation;
  static const Field<UserAccount, String> _f$legalAbbreviation =
      Field('legalAbbreviation', _$legalAbbreviation, opt: true);
  static String? _$legalAddress(UserAccount v) => v.legalAddress;
  static const Field<UserAccount, String> _f$legalAddress =
      Field('legalAddress', _$legalAddress, opt: true);
  static String? _$legalInn(UserAccount v) => v.legalInn;
  static const Field<UserAccount, String> _f$legalInn =
      Field('legalInn', _$legalInn, opt: true);
  static String? _$legalOgrn(UserAccount v) => v.legalOgrn;
  static const Field<UserAccount, String> _f$legalOgrn =
      Field('legalOgrn', _$legalOgrn, opt: true);
  static Uint8List? _$avatar(UserAccount v) => v.avatar;
  static const Field<UserAccount, Uint8List> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final Map<Symbol, Field<UserAccount, dynamic>> fields = const {
    #id: _f$id,
    #login: _f$login,
    #password: _f$password,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #middleName: _f$middleName,
    #email: _f$email,
    #legalTitle: _f$legalTitle,
    #legalAbbreviation: _f$legalAbbreviation,
    #legalAddress: _f$legalAddress,
    #legalInn: _f$legalInn,
    #legalOgrn: _f$legalOgrn,
    #avatar: _f$avatar,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'UserAccount';
  @override
  late final ClassMapperBase superMapper = BaseModelMapper.ensureInitialized();

  static UserAccount _instantiate(DecodingData data) {
    return UserAccount(
        id: data.dec(_f$id),
        login: data.dec(_f$login),
        password: data.dec(_f$password),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        middleName: data.dec(_f$middleName),
        email: data.dec(_f$email),
        legalTitle: data.dec(_f$legalTitle),
        legalAbbreviation: data.dec(_f$legalAbbreviation),
        legalAddress: data.dec(_f$legalAddress),
        legalInn: data.dec(_f$legalInn),
        legalOgrn: data.dec(_f$legalOgrn),
        avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static UserAccount fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UserAccount>(map));
  }

  static UserAccount fromJson(String json) {
    return _guard((c) => c.fromJson<UserAccount>(json));
  }
}

mixin UserAccountMappable {
  String toJson() {
    return UserAccountMapper._guard((c) => c.toJson(this as UserAccount));
  }

  Map<String, dynamic> toMap() {
    return UserAccountMapper._guard((c) => c.toMap(this as UserAccount));
  }

  UserAccountCopyWith<UserAccount, UserAccount, UserAccount> get copyWith =>
      _UserAccountCopyWithImpl(this as UserAccount, $identity, $identity);
  @override
  String toString() {
    return UserAccountMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserAccountMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return UserAccountMapper._guard((c) => c.hash(this));
  }
}

extension UserAccountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserAccount, $Out> {
  UserAccountCopyWith<$R, UserAccount, $Out> get $asUserAccount =>
      $base.as((v, t, t2) => _UserAccountCopyWithImpl(v, t, t2));
}

abstract class UserAccountCopyWith<$R, $In extends UserAccount, $Out>
    implements BaseModelCopyWith<$R, $In, $Out> {
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
  UserAccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserAccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserAccount, $Out>
    implements UserAccountCopyWith<$R, UserAccount, $Out> {
  _UserAccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserAccount> $mapper =
      UserAccountMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? login = $none,
          Object? password = $none,
          Object? firstName = $none,
          Object? lastName = $none,
          Object? middleName = $none,
          Object? email = $none,
          Object? legalTitle = $none,
          Object? legalAbbreviation = $none,
          Object? legalAddress = $none,
          Object? legalInn = $none,
          Object? legalOgrn = $none,
          Object? avatar = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (login != $none) #login: login,
        if (password != $none) #password: password,
        if (firstName != $none) #firstName: firstName,
        if (lastName != $none) #lastName: lastName,
        if (middleName != $none) #middleName: middleName,
        if (email != $none) #email: email,
        if (legalTitle != $none) #legalTitle: legalTitle,
        if (legalAbbreviation != $none) #legalAbbreviation: legalAbbreviation,
        if (legalAddress != $none) #legalAddress: legalAddress,
        if (legalInn != $none) #legalInn: legalInn,
        if (legalOgrn != $none) #legalOgrn: legalOgrn,
        if (avatar != $none) #avatar: avatar
      }));
  @override
  UserAccount $make(CopyWithData data) => UserAccount(
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
      legalAddress: data.get(#legalAddress, or: $value.legalAddress),
      legalInn: data.get(#legalInn, or: $value.legalInn),
      legalOgrn: data.get(#legalOgrn, or: $value.legalOgrn),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  UserAccountCopyWith<$R2, UserAccount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserAccountCopyWithImpl($value, $cast, t);
}
