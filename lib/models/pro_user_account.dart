import 'dart:typed_data';
import 'package:clubpro/models/base_model.dart';
import 'package:clubpro/models/uint8list_mapper.dart';
import 'package:clubpro/models/user_account.dart';
import 'package:dart_mappable/dart_mappable.dart';

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

@MappableClass()
class ProUserAccount extends UserAccount with ProUserAccountMappable {
  final String publicID;
  final ProUserAccountType proType;

  ProUserAccount({
    required this.publicID,
    required this.proType,
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

  ProUserAccount.required({
    required String id,
    required DateTime createDate,
    required String login,
    required String password,
    required String firstName,
    required String lastName,
    required String publicID,
    required ProUserAccountType proType,
  }) : this(
          id: id,
          createDate: createDate,
          login: login,
          password: password,
          firstName: firstName,
          lastName: lastName,
          proType: proType,
          publicID: publicID,
          middleName: '',
          phone: '',
          email: '',
          legalTitle: '',
          legalAbbreviation: '',
          legalAddress: '',
          legalInn: '',
          legalOgrn: '',
        );

  static final fromJson = ProUserAccountMapper.fromJson;
  static final fromMap = ProUserAccountMapper.fromMap;
}
