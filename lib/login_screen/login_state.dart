import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool loading;
  final bool success;
  final String? errorMessage;

  const LoginState({
    this.loading = false,
    this.success = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? loading,
    bool? success,
    String? errorMessage,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        success,
      ];
}
