import '../../features/profile/domain/entity/profile_entity.dart';
import '../entity/user_entity.dart';

class UserModel extends ProfileEntity {
  UserModel({
    required super.userEntity,
    required super.phone,
    required super.brandName,
    required super.desc,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userEntity: UserEntity(
        uId: json['id']?.toString() ?? '',
        email: json['email'] ?? '',
        name: json['name'] ?? '',
        photoUrl: json['photoUrl'] ?? '',
      ),
      phone: json['phone'] ?? '',
      brandName: json['brandName'] ?? '',
      desc: json['desc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userEntity.uId,
      'email': userEntity.email,
      'name': userEntity.name,
      'photoUrl': userEntity.photoUrl,
      'phone': phone,
      'brandName': brandName,
      'desc': desc,
    };
  }

  factory UserModel.fromEntity(ProfileEntity entity) {
    return UserModel(
      userEntity: entity.userEntity,
      phone: entity.phone,
      brandName: entity.brandName,
      desc: entity.desc,
    );
  }
}
