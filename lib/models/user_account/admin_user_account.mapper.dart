// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'admin_user_account.dart';

class AdminUserAccountMapper extends SubClassMapperBase<AdminUserAccount> {
  AdminUserAccountMapper._();

  static AdminUserAccountMapper? _instance;
  static AdminUserAccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdminUserAccountMapper._());
      UserAccountMapper.ensureInitialized().addSubMapper(_instance!);
      FileSetMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AdminUserAccount';

  static String? _$id(AdminUserAccount v) => v.id;
  static const Field<AdminUserAccount, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static DateTime? _$created(AdminUserAccount v) => v.created;
  static const Field<AdminUserAccount, DateTime> _f$created =
      Field('created', _$created, opt: true);
  static String? _$createdBy(AdminUserAccount v) => v.createdBy;
  static const Field<AdminUserAccount, String> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by', opt: true);
  static DateTime? _$modified(AdminUserAccount v) => v.modified;
  static const Field<AdminUserAccount, DateTime> _f$modified =
      Field('modified', _$modified, opt: true);
  static String? _$modifiedBy(AdminUserAccount v) => v.modifiedBy;
  static const Field<AdminUserAccount, String> _f$modifiedBy =
      Field('modifiedBy', _$modifiedBy, key: 'modified_by', opt: true);
  static String? _$login(AdminUserAccount v) => v.login;
  static const Field<AdminUserAccount, String> _f$login =
      Field('login', _$login, opt: true);
  static String? _$password(AdminUserAccount v) => v.password;
  static const Field<AdminUserAccount, String> _f$password =
      Field('password', _$password, opt: true);
  static String? _$firstName(AdminUserAccount v) => v.firstName;
  static const Field<AdminUserAccount, String> _f$firstName =
      Field('firstName', _$firstName, key: 'firstname', opt: true);
  static String? _$lastName(AdminUserAccount v) => v.lastName;
  static const Field<AdminUserAccount, String> _f$lastName =
      Field('lastName', _$lastName, key: 'lastname', opt: true);
  static String? _$middleName(AdminUserAccount v) => v.middleName;
  static const Field<AdminUserAccount, String> _f$middleName =
      Field('middleName', _$middleName, key: 'middlename', opt: true);
  static String? _$email(AdminUserAccount v) => v.email;
  static const Field<AdminUserAccount, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$legalTitle(AdminUserAccount v) => v.legalTitle;
  static const Field<AdminUserAccount, String> _f$legalTitle =
      Field('legalTitle', _$legalTitle, key: 'legal_title', opt: true);
  static String? _$legalAbbreviation(AdminUserAccount v) => v.legalAbbreviation;
  static const Field<AdminUserAccount, String> _f$legalAbbreviation = Field(
      'legalAbbreviation', _$legalAbbreviation,
      key: 'legal_abbreviation', opt: true);
  static String? _$legalInn(AdminUserAccount v) => v.legalInn;
  static const Field<AdminUserAccount, String> _f$legalInn =
      Field('legalInn', _$legalInn, key: 'legal_inn', opt: true);
  static String? _$legalOgrn(AdminUserAccount v) => v.legalOgrn;
  static const Field<AdminUserAccount, String> _f$legalOgrn =
      Field('legalOgrn', _$legalOgrn, key: 'legal_ogrn', opt: true);
  static String? _$legalAddress(AdminUserAccount v) => v.legalAddress;
  static const Field<AdminUserAccount, String> _f$legalAddress =
      Field('legalAddress', _$legalAddress, key: 'legal_address', opt: true);
  static FileSet _$avatar(AdminUserAccount v) => v.avatar;
  static const Field<AdminUserAccount, FileSet> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final Map<Symbol, Field<AdminUserAccount, dynamic>> fields = const {
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
  final dynamic discriminatorValue = 'AdminUserAccount';
  @override
  late final ClassMapperBase superMapper =
      UserAccountMapper.ensureInitialized();

  static AdminUserAccount _instantiate(DecodingData data) {
    return AdminUserAccount(
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

  static AdminUserAccount fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AdminUserAccount>(map));
  }

  static AdminUserAccount fromJson(String json) {
    return _guard((c) => c.fromJson<AdminUserAccount>(json));
  }
}

mixin AdminUserAccountMappable {
  String toJson() {
    return AdminUserAccountMapper._guard(
        (c) => c.toJson(this as AdminUserAccount));
  }

  Map<String, dynamic> toMap() {
    return AdminUserAccountMapper._guard(
        (c) => c.toMap(this as AdminUserAccount));
  }

  AdminUserAccountCopyWith<AdminUserAccount, AdminUserAccount, AdminUserAccount>
      get copyWith => _AdminUserAccountCopyWithImpl(
          this as AdminUserAccount, $identity, $identity);
  @override
  String toString() {
    return AdminUserAccountMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AdminUserAccountMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AdminUserAccountMapper._guard((c) => c.hash(this));
  }
}

extension AdminUserAccountValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdminUserAccount, $Out> {
  AdminUserAccountCopyWith<$R, AdminUserAccount, $Out>
      get $asAdminUserAccount =>
          $base.as((v, t, t2) => _AdminUserAccountCopyWithImpl(v, t, t2));
}

abstract class AdminUserAccountCopyWith<$R, $In extends AdminUserAccount, $Out>
    implements UserAccountCopyWith<$R, $In, $Out> {
  @override
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
      String? legalInn,
      String? legalOgrn,
      String? legalAddress,
      FileSet? avatar});
  AdminUserAccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdminUserAccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdminUserAccount, $Out>
    implements AdminUserAccountCopyWith<$R, AdminUserAccount, $Out> {
  _AdminUserAccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdminUserAccount> $mapper =
      AdminUserAccountMapper.ensureInitialized();
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
          Object? legalInn = $none,
          Object? legalOgrn = $none,
          Object? legalAddress = $none,
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
        if (legalInn != $none) #legalInn: legalInn,
        if (legalOgrn != $none) #legalOgrn: legalOgrn,
        if (legalAddress != $none) #legalAddress: legalAddress,
        if (avatar != $none) #avatar: avatar
      }));
  @override
  AdminUserAccount $make(CopyWithData data) => AdminUserAccount(
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
  AdminUserAccountCopyWith<$R2, AdminUserAccount, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdminUserAccountCopyWithImpl($value, $cast, t);
}
