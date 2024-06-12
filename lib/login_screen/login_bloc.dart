import 'package:bloc/bloc.dart';
import 'package:login_api_app/login_screen/login.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../api_services/login_api.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    _apiService = ApiService();
    registerEvents();
  }

  late final ApiService _apiService;

  final loginForm = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  void registerEvents() {
    on<CallLoginApi>(_onCallLoginApi);
  }

  Future<void> _onCallLoginApi(
      CallLoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    try {
      var response = await _apiService.authenticate(
        event.userName,
        event.password,
      );

      //if (response != null) {
      if (response != null && response['id'] != null) {
        loginForm.reset();
        emit(state.copyWith(loading: false, success: true));
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
