import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool loading;
  //final bool success;
  final String? errorMessage;

  const HomeState({
    this.loading = false,
    //this.success = false,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? loading,
    //bool? success,
    String? errorMessage,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      //success: success ?? this.success,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        //success,
      ];
}
