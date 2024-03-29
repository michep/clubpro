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
      ProUserAccountMapper.ensureInitialized();
      BusinessUserAccountMapper.ensureInitialized();
      AdminUserAccountMapper.ensureInitialized();
      FileSetMapper.ensureInitialized();
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
  static DateTime? _$created(UserAccount v) => v.created;
  static const Field<UserAccount, DateTime> _f$created =
      Field('created', _$created, opt: true);
  static String? _$createdBy(UserAccount v) => v.createdBy;
  static const Field<UserAccount, String> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by', opt: true);
  static DateTime? _$modified(UserAccount v) => v.modified;
  static const Field<UserAccount, DateTime> _f$modified =
      Field('modified', _$modified, opt: true);
  static String? _$modifiedBy(UserAccount v) => v.modifiedBy;
  static const Field<UserAccount, String> _f$modifiedBy =
      Field('modifiedBy', _$modifiedBy, key: 'modified_by', opt: true);
  static String? _$login(UserAccount v) => v.login;
  static const Field<UserAccount, String> _f$login =
      Field('login', _$login, opt: true);
  static String? _$password(UserAccount v) => v.password;
  static const Field<UserAccount, String> _f$password =
      Field('password', _$password, opt: true);
  static String? _$firstName(UserAccount v) => v.firstName;
  static const Field<UserAccount, String> _f$firstName =
      Field('firstName', _$firstName, key: 'firstname', opt: true);
  static String? _$lastName(UserAccount v) => v.lastName;
  static const Field<UserAccount, String> _f$lastName =
      Field('lastName', _$lastName, key: 'lastname', opt: true);
  static String? _$middleName(UserAccount v) => v.middleName;
  static const Field<UserAccount, String> _f$middleName =
      Field('middleName', _$middleName, key: 'middlename', opt: true);
  static String? _$email(UserAccount v) => v.email;
  static const Field<UserAccount, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$legalTitle(UserAccount v) => v.legalTitle;
  static const Field<UserAccount, String> _f$legalTitle =
      Field('legalTitle', _$legalTitle, key: 'legal_title', opt: true);
  static String? _$legalAbbreviation(UserAccount v) => v.legalAbbreviation;
  static const Field<UserAccount, String> _f$legalAbbreviation = Field(
      'legalAbbreviation', _$legalAbbreviation,
      key: 'legal_abbreviation', opt: true);
  static String? _$legalAddress(UserAccount v) => v.legalAddress;
  static const Field<UserAccount, String> _f$legalAddress =
      Field('legalAddress', _$legalAddress, key: 'legal_address', opt: true);
  static String? _$legalInn(UserAccount v) => v.legalInn;
  static const Field<UserAccount, String> _f$legalInn =
      Field('legalInn', _$legalInn, key: 'legal_inn', opt: true);
  static String? _$legalOgrn(UserAccount v) => v.legalOgrn;
  static const Field<UserAccount, String> _f$legalOgrn =
      Field('legalOgrn', _$legalOgrn, key: 'legal_ogrn', opt: true);
  static FileSet _$avatar(UserAccount v) => v.avatar;
  static const Field<UserAccount, FileSet> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final Map<Symbol, Field<UserAccount, dynamic>> fields = const {
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
    #legalAddress: _f$legalAddress,
    #legalInn: _f$legalInn,
    #legalOgrn: _f$legalOgrn,
    #avatar: _f$avatar,
  };

  @override
  final String discriminatorKey = '_baseType';
  @override
  final dynamic discriminatorValue = 'UserAccount';
  @override
  late final ClassMapperBase superMapper = BaseModelMapper.ensureInitialized();

  static UserAccount _instantiate(DecodingData data) {
    return UserAccount(
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
  FileSetCopyWith<$R, FileSet, FileSet> get avatar;
  @override
  $R call(
      {String? id,
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
      String? legalAddress,
      String? legalInn,
      String? legalOgrn,
      FileSet? avatar});
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
  FileSetCopyWith<$R, FileSet, FileSet> get avatar =>
      ($value.avatar as FileSet).copyWith.$chain((v) => call(avatar: v));
  @override
  $R call(
          {Object? id = $none,
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
          Object? legalAddress = $none,
          Object? legalInn = $none,
          Object? legalOgrn = $none,
          Object? avatar = $none}) =>
      $apply(FieldCopyWithData({
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
        if (legalAddress != $none) #legalAddress: legalAddress,
        if (legalInn != $none) #legalInn: legalInn,
        if (legalOgrn != $none) #legalOgrn: legalOgrn,
        if (avatar != $none) #avatar: avatar
      }));
  @override
  UserAccount $make(CopyWithData data) => UserAccount(
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
      legalAddress: data.get(#legalAddress, or: $value.legalAddress),
      legalInn: data.get(#legalInn, or: $value.legalInn),
      legalOgrn: data.get(#legalOgrn, or: $value.legalOgrn),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  UserAccountCopyWith<$R2, UserAccount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserAccountCopyWithImpl($value, $cast, t);
}
