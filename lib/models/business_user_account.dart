import 'dart:typed_data';
import 'package:clubpro/models/base_model.dart';
import 'package:clubpro/models/uint8list_mapper.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'business_user_account.mapper.dart';

@MappableEnum(mode: ValuesMode.named)
enum BusinessUserAccountType {
  manufacturer(
    value: 'manufacturer',
    name: 'Производитель',
  ),
  distributor(
    value: 'distributor',
    name: 'Дистрибьютор',
  ),
  chainstore(
    value: 'chainstore',
    name: 'Сеть магазинов',
  );

  final String name;
  final String value;
  const BusinessUserAccountType({
    required this.name,
    required this.value,
  });
}

@MappableClass()
class BusinessUserAccount extends UserAccount with BusinessUserAccountMappable {
  final BusinessUserAccountType businessType;

  BusinessUserAccount({
    required this.businessType,
    required super.id,
    required super.createDate,
    required super.login,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.middleName,
    required super.phone,
    required super.email,
    required super.legalTitle,
    required super.legalAbbreviation,
    required super.legalInn,
    required super.legalOgrn,
    required super.legalAddress,
    super.avatar,
  });

  BusinessUserAccount.required({
    required String id,
    required DateTime createDate,
    required String login,
    required String password,
    required String firstName,
    required String lastName,
    required BusinessUserAccountType businessType,
  }) : this(
          id: id,
          createDate: createDate,
          login: login,
          password: password,
          firstName: firstName,
          lastName: lastName,
          businessType: businessType,
          middleName: '',
          phone: '',
          email: '',
          legalTitle: '',
          legalAbbreviation: '',
          legalAddress: '',
          legalInn: '',
          legalOgrn: '',
        );

  static final fromJson = BusinessUserAccountMapper.fromJson;
  static final fromMap = BusinessUserAccountMapper.fromMap;
}
