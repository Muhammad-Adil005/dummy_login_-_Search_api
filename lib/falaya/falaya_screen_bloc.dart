import 'package:bloc/bloc.dart';
import 'package:login_api_app/falaya/falaya.dart';

import '../api_services/falaya_api.dart';
import '../model/falaya_model.dart';

class FalayaBloc extends Bloc<FalayaEvent, FalayaState> {
  FalayaBloc() : super(FalayaState()) {
    _apiService = ApiService();
    registerEvents();
    add(CallFalayaApi());
  }

  late final ApiService _apiService;

  void registerEvents() {
    on<CallFalayaApi>(_onCallFalayaApi);
  }

  Future<void> _onCallFalayaApi(
      CallFalayaApi event, Emitter<FalayaState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    try {
      //var response = await _apiService.getFalayaList();
      List<dynamic> response = await _apiService.getFalayaList();
      List<Falaya> falaya =
          response.map((json) => Falaya.fromJson(json)).toList();
      //print('Response inside Falaya Bloc is : $response');

      emit(state.copyWith(loading: false, falayaList: falaya));
    } catch (e) {
      print('Error : $e');
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
