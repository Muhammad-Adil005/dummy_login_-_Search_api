import '../../db/db.dart';

class UserDao extends DBBase {
  static final UserDao _userDao = UserDao._internal();

  UserDao._internal()
      : super(
          tableName: UserTable.tblUser,
        );

  static UserDao get() {
    return _userDao;
  }

  Future<int> addUser(
    UserTable user,
  ) async {
    return insert(user.toJson());
  }

  Future<int> deleteUser() async {
    return deleteTable();
  }

  Future<UserTable?> getLoggedUser() async {
    List<Map<String, dynamic>> users = await query();
    if (users.isNotEmpty) {
      return users.map((map) => UserTable.fromMap(map)).first;
    }
    return null;
  }
}
