import 'package:equatable/equatable.dart';
import 'package:login_api_app/fake_store_product/widget/fake_store_product_model.dart';

class FakeStoreProductState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<FakeStoreProductModel> fakeStoreProductModel;

  const FakeStoreProductState({
    this.loading = false,
    this.errorMessage,
    this.fakeStoreProductModel = const [],
  });

  FakeStoreProductState copyWith({
    bool? loading,
    String? errorMessage,
    List<FakeStoreProductModel>? fakeStoreProductModel,
  }) {
    return FakeStoreProductState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      fakeStoreProductModel:
          fakeStoreProductModel ?? this.fakeStoreProductModel,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        fakeStoreProductModel,
      ];
}
