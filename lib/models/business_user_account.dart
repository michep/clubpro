import 'dart:typed_data';
import 'package:clubpro/models/base_model.dart';
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
  final BusinessUserAccountType? businessType;

  BusinessUserAccount({
    this.businessType,
    super.id,
    super.login,
    super.password,
    super.firstName,
    super.lastName,
    super.middleName,
    super.email,
    super.legalTitle,
    super.legalAbbreviation,
    super.legalInn,
    super.legalOgrn,
    super.legalAddress,
    super.avatar,
  });

  static final fromJson = BusinessUserAccountMapper.fromJson;
  static final fromMap = BusinessUserAccountMapper.fromMap;
}
