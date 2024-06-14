import '../ast.dart';

class UserTable {
  static const tblUser = "User";
  static const dbUserId = "id";
  static const dbUsername = "username";
  static const dbPassword = "password";

  int userId;
  String? username;
  String? password;

  UserTable.create({
    required this.userId,
    this.username,
    this.password,
  });

  UserTable.update({
    required this.userId,
    this.username,
    this.password,
  });

  factory UserTable.fromJson(Map<String, dynamic> json) => UserTable.create(
        userId: asT<int>(json['id'])!,
        username: asT<String?>(json['username']),
        password: asT<String?>(json['password']),
      );

  UserTable.fromMap(Map<String, dynamic> map)
      : this.update(
          userId: int.parse(map[dbUserId]),
          username: map[dbUsername],
          password: map[dbPassword],
        );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      dbUserId: userId,
      dbUsername: username,
      dbPassword: password,
    };
    return map;
  }
}
