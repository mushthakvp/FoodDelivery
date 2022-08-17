class UserModel {
  final String name;
  final String email;
  final String profile;
  final bool verified;

  UserModel({
    required this.name,
    required this.email,
    required this.profile,
    required this.verified,
  });

  Map<String, dynamic> toSnapshot() {
    return {
      "name": name,
      "email": email,
      "profile": profile,
      "verified": verified,
    };
  }
}
