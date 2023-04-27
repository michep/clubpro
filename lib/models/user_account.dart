import 'dart:convert';
import 'dart:typed_data';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:clubpro/models/pro_user_account.dart';
import 'package:clubpro/models/business_user_account.dart';
import 'package:clubpro/models/base_model.dart';

part 'user_account.mapper.dart';

// @MappableClass(generateMethods: GenerateMethods.all & ~GenerateMethods.copy)
@MappableClass(discriminatorKey: 'type', includeSubClasses: [ProUserAccount, BusinessUserAccount])
class UserAccount extends BaseModel with UserAccountMappable {
  final String login;
  final String password;
  final String phone;
  final String email;
  final String firstName;
  final String lastName;
  final String middleName;
  final String title;
  final String abbreviation;
  final String inn;
  final String ogrn;
  final String legalAddress;

  final Uint8List? avatar;

  UserAccount({
    required id,
    DateTime? createDate,
    required this.login,
    required this.password,
    required this.phone,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.middleName = '',
    this.title = '',
    this.abbreviation = '',
    this.inn = '',
    this.ogrn = '',
    this.legalAddress = '',
    this.avatar,
  }) : super(id: id, createDate: createDate ?? DateTime.now());

  @override
  final fromMap = UserAccountMapper.fromMap;

  @override
  final fromJson = UserAccountMapper.fromJson;

  static String base64toJson(Uint8List? value) {
    if (value == null) return '';
    return base64Encode(value.toList());
  }

  static Uint8List? base64fromJson(String value) {
    if (value.isEmpty) return null;
    return base64Decode(value);
  }
}
