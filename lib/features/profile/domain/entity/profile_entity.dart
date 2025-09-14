import 'package:chef/core/entity/user_entity.dart';

class ProfileEntity {
  final UserEntity userEntity;
  final String phone;
  final String brandName;
  final String desc;

  ProfileEntity({
    required this.userEntity,
    required this.phone,
    required this.brandName,
    required this.desc,
  });
}
