abstract class LoginEvent {}

class CallLoginApi extends LoginEvent {
  final String userName;
  final String password;

  CallLoginApi({
    required this.userName,
    required this.password,
  });
}
