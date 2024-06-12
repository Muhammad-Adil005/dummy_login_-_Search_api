// home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:login_api_app/home_screen/home.dart';

import '../api_services/login_api.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    _apiService = ApiService();
    registerEvents();
  }

  late final ApiService _apiService;

  void registerEvents() {
    on<PerformSearch>(_onPerformSearch);
  }

  Future<void> _onPerformSearch(
      PerformSearch event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    try {
      var response = await _apiService.searchPosts(
        event.query,
      );
      print('response : $response');
      if (response != null) {
        emit(state.copyWith(loading: false, errorMessage: ''));
      } else {
        emit(state.copyWith(
          loading: false,
          errorMessage: 'Login failed',
        ));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}
