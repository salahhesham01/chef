import 'package:chef/features/auth/domain/entity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  final String? phone;
  final String? brandName;
  final String? desc;

  UserModel({
    required super.uId,
    required super.email,
    required super.name,
    required super.photoUrl,
    this.phone,
    this.brandName,
    this.desc,
  });

  /// From Firestore Document
  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    return UserModel(
      uId: doc.id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'],
      phone: data['phone'],
      brandName: data['brandName'],
      desc: data['desc'],
    );
  }

  /// To Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'phone': phone,
      'brandName': brandName,
      'desc': desc,
    };
  }

  /// From Entity → useful if you just want to save minimal info
  factory UserModel.fromEntity(UserEntity entity,
      {String? phone, String? brandName, String? desc}) {
    return UserModel(
      uId: entity.uId,
      email: entity.email,
      name: entity.name,
      photoUrl: entity.photoUrl,
      phone: phone,
      brandName: brandName,
      desc: desc,
    );
  }
}
