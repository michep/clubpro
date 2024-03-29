import 'package:clubpro/models/fileset.dart';
import 'package:clubpro/models/user_account/user_account.dart';
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
  @MappableField(key: 'business_type')
  final BusinessUserAccountType? businessType;

  BusinessUserAccount({
    this.businessType,
    super.id,
    super.created,
    super.createdBy,
    super.modified,
    super.modifiedBy,
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

  static const fromJson = BusinessUserAccountMapper.fromJson;
  static const fromMap = BusinessUserAccountMapper.fromMap;
}
