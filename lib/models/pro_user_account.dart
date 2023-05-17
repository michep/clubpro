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
  @MappableField(key: 'public_identity')
  final String? publicIdentity;

  @MappableField(key: 'pro_type')
  final ProUserAccountType? proType;

  ProUserAccount({
    this.publicIdentity,
    this.proType,
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
    super.avatarFileId,
  });

  static const fromJson = ProUserAccountMapper.fromJson;
  static const fromMap = ProUserAccountMapper.fromMap;
}
