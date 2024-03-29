import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/models/fileset.dart';
import 'package:clubpro/models/user_account/admin_user_account.dart';
import 'package:clubpro/models/base_model.dart';
import 'package:clubpro/models/user_account/business_user_account.dart';
import 'package:clubpro/models/user_account/pro_user_account.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_account.mapper.dart';

@MappableClass(discriminatorKey: '_accountType', includeSubClasses: [ProUserAccount, BusinessUserAccount, AdminUserAccount])
class UserAccount extends BaseModel with UserAccountMappable {
  final String? login;
  final String? password;
  final String? email;
  @MappableField(key: 'firstname')
  final String? firstName;
  @MappableField(key: 'lastname')
  final String? lastName;
  @MappableField(key: 'middlename')
  final String? middleName;
  @MappableField(key: 'legal_title')
  final String? legalTitle;
  @MappableField(key: 'legal_abbreviation')
  final String? legalAbbreviation;
  @MappableField(key: 'legal_inn')
  final String? legalInn;
  @MappableField(key: 'legal_ogrn')
  final String? legalOgrn;
  @MappableField(key: 'legal_address')
  final String? legalAddress;
  late final FileSet avatar;

  UserAccount({
    super.id,
    super.created,
    super.createdBy,
    super.modified,
    super.modifiedBy,
    this.login,
    this.password,
    this.firstName,
    this.lastName,
    this.middleName,
    this.email,
    this.legalTitle,
    this.legalAbbreviation,
    this.legalAddress,
    this.legalInn,
    this.legalOgrn,
    FileSet? avatar,
  }) {
    this.avatar = avatar ?? FileSet();
  }

  static const fromJson = UserAccountMapper.fromJson;
  static const fromMap = UserAccountMapper.fromMap;

  String get fullname {
    var res = '';
    if (lastName != null) res = lastName!;
    if (firstName != null) res = '$res $firstName';
    if (middleName != null) res = '$res $middleName';
    return res;
  }

  @override
  Future<UserAccount> save() async {
    super.save();
    await avatar.save();
    var newid = await ApiUser.saveUser(this);
    id ??= newid;
    return this;
  }

  Future<Map<String, dynamic>> register() async {
    return await ApiUser.registerUser(this);
  }

  Future<Map<String, dynamic>> registerContinue() async {
    return await ApiUser.registerUserContinue(this);
  }

  Future<Map<String, dynamic>> sendSMSCode() async {
    return await ApiUser.sendSMSCode(this);
  }

  Future<Map<String, dynamic>> checkSMSCode(String code) async {
    return await ApiUser.checkSMSCode(this, code);
  }

  Future<Map<String, dynamic>> resetPassword(String code) async {
    return await ApiUser.resetPassword(this, code);
  }

  // Uint8List? _avatarData;
  // Future<Uint8List?> avatar({bool forceRefresh = false}) async {
  //   if (avatarFileId == null) return null;
  //   if (_avatarData != null) return _avatarData;
  //   _avatarData = await ApiFilestore.getFile(avatarFileId!);
  //   return _avatarData;
  // }

  static List<UserAccount>? _usersList;
  static Future<List<UserAccount>> getUsers({bool forceRefresh = false}) async {
    if (_usersList == null || forceRefresh) _usersList = await ApiUser.getUsersList();
    return _usersList!;
  }
}
