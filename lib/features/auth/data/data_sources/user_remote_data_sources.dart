import 'package:chef/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entity/user_entity.dart';

abstract class UserRemoteDataSources {
  Future<UserEntity> fetchUserProfile(String uId);
  Future<UserEntity> updateUserProfile(UserEntity user);

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  UserRemoteDataSourcesImpl(
      {required this.firebaseAuth, required this.fireStore});

  @override
  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) throw Exception("No logged in user");

    // Re-authenticate before changing password
    final cred = EmailAuthProvider.credential(
      email: currentUser.email!,
      password: currentPassword,
    );

    await currentUser.reauthenticateWithCredential(cred);
    await currentUser.updatePassword(newPassword);
  }

  @override
  Future<UserEntity> fetchUserProfile(String uId) async {
    final doc = await fireStore.collection('users').doc(uId).get();
    if (!doc.exists) throw Exception("User not found");
    return UserModel.fromDoc(doc);
  }

  @override
  Future<UserEntity> updateUserProfile(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await fireStore.collection('users').doc(user.uId).set(
          userModel.toMap(),
          SetOptions(merge: true),
        );
    return userModel;
  }
}
