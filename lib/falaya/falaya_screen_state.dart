import 'package:equatable/equatable.dart';

import '../model/falaya_model.dart';

class FalayaState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<Falaya> falayaList;

  FalayaState({
    this.loading = false,
    this.errorMessage,
    this.falayaList = const [],
  });

  FalayaState copyWith({
    bool? loading,
    String? errorMessage,
    List<Falaya>? falayaList,
  }) {
    return FalayaState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      falayaList: falayaList ?? this.falayaList,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        falayaList,
      ];
}
