import 'dart:typed_data';
import 'package:clubpro/api/api_user.dart';
import 'package:clubpro/models/base_model.dart';
import 'package:clubpro/models/business_user_account.dart';
import 'package:clubpro/models/pro_user_account.dart';
import 'package:clubpro/models/uint8list_mapper.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_account.mapper.dart';

// @MappableClass(discriminatorKey: 'type', includeSubClasses: [ProUserAccount, BusinessUserAccount])
@MappableClass(includeCustomMappers: [Uint8ListMapper], discriminatorKey: 'type', includeSubClasses: [ProUserAccount, BusinessUserAccount])
class UserAccount extends BaseModel with UserAccountMappable {
  final String login;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final String? middleName;
  final String? legalTitle;
  final String? legalAbbreviation;
  final String? legalInn;
  final String? legalOgrn;
  final String? legalAddress;

  final Uint8List? avatar;

  UserAccount({
    super.id,
    required this.login,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.email,
    this.legalTitle,
    this.legalAbbreviation,
    this.legalAddress,
    this.legalInn,
    this.legalOgrn,
    this.avatar,
  });

  static final fromJson = UserAccountMapper.fromJson;
  static final fromMap = UserAccountMapper.fromMap;

  @override
  void save() async {
    await ApiUser.createUser(this);
  }

  Future<Map<String, dynamic>> register() async {
    return await ApiUser.registerUser(this);
  }

  Future<String?> sendSMSCode() async {
    return await ApiUser.sendSMSCode(this);
  }

  Future<Map<String, dynamic>> checkSMSCode(String code) async {
    return await ApiUser.checkSMSCode(this, code);
  }
}
