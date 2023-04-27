import 'dart:typed_data';
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
  final String phone;
  final String email;
  final String firstName;
  final String lastName;
  final String middleName;
  final String legalTitle;
  final String legalAbbreviation;
  final String legalInn;
  final String legalOgrn;
  final String legalAddress;

  final Uint8List? avatar;

  UserAccount({
    required super.id,
    required super.createDate,
    required this.login,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phone,
    required this.email,
    required this.legalTitle,
    required this.legalAbbreviation,
    required this.legalAddress,
    required this.legalInn,
    required this.legalOgrn,
    this.avatar,
  });

  UserAccount.required({
    required String id,
    required DateTime createDate,
    required String login,
    required String password,
    required String firstName,
    required String lastName,
  }) : this(
          id: id,
          createDate: createDate,
          login: login,
          password: password,
          firstName: firstName,
          lastName: lastName,
          middleName: '',
          phone: '',
          email: '',
          legalTitle: '',
          legalAbbreviation: '',
          legalAddress: '',
          legalInn: '',
          legalOgrn: '',
        );
}
