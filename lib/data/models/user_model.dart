class UserModel {
  final bool exists;
  final bool password;
  final bool verified;

  UserModel({required this.exists, required this.password, required this.verified});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      exists: json['exists'],
      password: json['password'],
      verified: json['verified'],
    );
  }
}
