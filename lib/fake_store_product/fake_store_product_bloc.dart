import 'package:bloc/bloc.dart';
import 'package:login_api_app/fake_store_product/fake_store_product_event.dart';
import 'package:login_api_app/fake_store_product/widget/fake_store_product_model.dart';

import '../api_services/fake_store_product_api.dart';
import 'fake_store_product_state.dart';

class FakeStoreProductBloc extends Bloc<FakeStoreEvent, FakeStoreProductState> {
  FakeStoreProductBloc() : super(const FakeStoreProductState()) {
    _apiService = ApiService();
    registerEvents();
    add(CallFakeStoreProductApi());
  }

  late final ApiService _apiService;

  void registerEvents() {
    on<CallFakeStoreProductApi>(_callFakeStoreProductApi);
  }

  Future<void> _callFakeStoreProductApi(CallFakeStoreProductApi event,
      Emitter<FakeStoreProductState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    try {
      var response = await _apiService.fakeStoreProducts();
      List<FakeStoreProductModel> products = (response as List)
          .map((json) => FakeStoreProductModel.fromJson(json))
          .toList();
      emit(state.copyWith(
          loading: false, fakeStoreProductModel: products, errorMessage: ''));
    } catch (e) {
      print('error : $e');
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
