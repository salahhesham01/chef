import 'dart:io';

import 'package:chef/features/profile/domain/entity/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/models/user_model.dart';

abstract class UserRemoteDataSources {
  Future<ProfileEntity> fetchUserProfile(String uId);
  Future<ProfileEntity> updateUserProfile(ProfileEntity user);

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<void> signOut();

  Future<String> uploadProfileImage(File file);
  Future<String?> getProfileImageUrl();
}

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  final SupabaseClient supabase;

  UserRemoteDataSourcesImpl({required this.supabase});

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final currentUser = supabase.auth.currentUser;
    if (currentUser == null) throw Exception("No logged in user");

    // verify old password by re-login
    await supabase.auth.signInWithPassword(
      email: currentUser.email!,
      password: currentPassword,
    );

    // update password
    final response = await supabase.auth.updateUser(
      UserAttributes(password: newPassword),
    );

    if (response.user == null) {
      throw Exception("Password update failed");
    }
  }

  @override
  Future<ProfileEntity> fetchUserProfile(String uId) async {
    final response =
        await supabase.from('users').select().eq('id', uId).maybeSingle();

    if (response == null) throw Exception("User not found");

    return UserModel.fromJson(response);
  }

  @override
  Future<ProfileEntity> updateUserProfile(ProfileEntity user) async {
    final userModel = UserModel.fromEntity(user);

    final data = userModel.toJson();

    data.removeWhere((key, value) => value == null);

    final response = await supabase
        .from('users')
        .update(data)
        .eq('id', user.userEntity.uId)
        .select()
        .maybeSingle();

    if (response == null) throw Exception("Failed to update user");

    return UserModel.fromJson(response);
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  @override
  Future<String> uploadProfileImage(File file) async {
    final userId = supabase.auth.currentUser?.id;
    final fileName =
        "$userId/profile_${DateTime.now().millisecondsSinceEpoch}.png";

    final bytes = await file.readAsBytes();

    await supabase.storage.from('images').uploadBinary(
          fileName,
          bytes,
          fileOptions: const FileOptions(upsert: true),
        );

    final url = await supabase.storage.from('images').getPublicUrl(fileName);

    await supabase.from('users').update({'photoUrl': url}).eq('id', userId!);

    return url;
  }

  @override
  Future<String?> getProfileImageUrl() async {
    final userId = supabase.auth.currentUser?.id;
    final response = await supabase
        .from('users')
        .select('photoUrl')
        .eq('id', userId!)
        .maybeSingle();

    if (response == null) return null;
    return response['photoUrl'] as String?;
  }
}
