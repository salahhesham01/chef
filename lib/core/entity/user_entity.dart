class UserEntity {
  final String uId;
  final String email;
  final String? photoUrl;
  final String name;

  UserEntity(
      {required this.uId,
      required this.email,
      this.photoUrl,
      required this.name});
}
