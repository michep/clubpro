import 'dart:typed_data';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/models/base_model.dart';

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

// @MappableClass(generateMethods: GenerateMethods.all & ~GenerateMethods.copy)
@MappableClass()
class BusinessUserAccount extends UserAccount with BusinessUserAccountMappable {
  final BusinessUserAccountType businessType;

  BusinessUserAccount({
    required String id,
    DateTime? createDate,
    required String login,
    required String password,
    required String phone,
    required String email,
    required String firstName,
    required String lastName,
    String middleName = '',
    String title = '',
    String abbreviation = '',
    String inn = '',
    String ogrn = '',
    String legalAddress = '',
    Uint8List? avatar,
    required this.businessType,
  }) : super(
          id: id,
          createDate: createDate,
          login: login,
          password: password,
          phone: phone,
          email: email,
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
          title: title,
          abbreviation: abbreviation,
          inn: inn,
          ogrn: ogrn,
          legalAddress: legalAddress,
          avatar: avatar,
        );

  @override
  final fromMap = BusinessUserAccountMapper.fromMap;

  @override
  final fromJson = BusinessUserAccountMapper.fromJson;
}
