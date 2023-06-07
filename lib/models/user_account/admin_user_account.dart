import 'package:clubpro/models/fileset.dart';
import 'package:clubpro/models/user_account/user_account.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'admin_user_account.mapper.dart';

@MappableClass()
class AdminUserAccount extends UserAccount with AdminUserAccountMappable {
  AdminUserAccount({
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

  static const fromJson = AdminUserAccountMapper.fromJson;
  static const fromMap = AdminUserAccountMapper.fromMap;
}
