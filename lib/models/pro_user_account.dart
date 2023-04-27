import 'dart:typed_data';
import 'package:clubpro/models/base_model.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'package:clubpro/models/user_account.dart';
import 'package:clubpro/models/base_model.dart';

part 'pro_user_account.mapper.dart';

@MappableEnum(mode: ValuesMode.named)
enum ProUserAccountType {
  foreman(
    name: 'Прораб',
  ),
  builder(
    name: 'Строитель',
  ),
  architect(
    name: 'Архитектор',
  ),
  projector(
    name: 'Проектировщик',
  ),
  designer(
    name: 'Дизайнер',
  ),
  seller(
    name: 'Продавец',
  );

  final String name;
  const ProUserAccountType({
    required this.name,
  });
}

// @MappableClass(generateMethods: GenerateMethods.all & ~GenerateMethods.copy)
@MappableClass()
class ProUserAccount extends UserAccount with ProUserAccountMappable {
  final String publicID;
  final ProUserAccountType proType;

  ProUserAccount({
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
    required this.publicID,
    required this.proType,
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
  final fromMap = ProUserAccountMapper.fromMap;

  @override
  final fromJson = ProUserAccountMapper.fromJson;
}
