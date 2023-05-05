import 'dart:typed_data';
import 'package:clubpro/models/base_model.dart';
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
    super.id,
    required super.login,
    required super.password,
    required super.firstName,
    required super.lastName,
    super.middleName,
    required super.email,
    super.legalTitle,
    super.legalAbbreviation,
    super.legalInn,
    super.legalOgrn,
    super.legalAddress,
    super.avatar,
  });

  static final fromJson = ProUserAccountMapper.fromJson;
  static final fromMap = ProUserAccountMapper.fromMap;
}
