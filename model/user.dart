// models/user.dart
class User {
  final String id;
  final String username;
  final String passwordHash;

  User({
    required this.id,
    required this.username,
    required this.passwordHash,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'passwordHash': passwordHash,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        username: json['username'] as String,
        passwordHash: json['passwordHash'] as String,
      );
}
