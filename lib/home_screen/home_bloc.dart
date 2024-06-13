// home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:login_api_app/home_screen/home.dart';

import '../api_services/login_api.dart';
import 'model/post_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    _apiService = ApiService();
    registerEvents();
  }

  late final ApiService _apiService;

  void registerEvents() {
    on<PerformSearch>(_onPerformSearch);
    //on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onPerformSearch(
      PerformSearch event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    try {
      var response = await _apiService.searchPosts(
        event.query,
      );
      //print('response : $response');
      List<Post> posts =
          (response as List).map((json) => Post.fromJson(json)).toList();
      emit(state.copyWith(loading: false, posts: posts, errorMessage: ''));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }

  // Future<void> _onFetchPosts(FetchPosts event, Emitter<HomeState> emit) async {
  //   emit(state.copyWith(loading: true, errorMessage: null));
  //   try {
  //     var response = await _apiService.fetchPosts();
  //     if (response != null) {
  //       emit(state.copyWith(loading: false, errorMessage: '', posts: response));
  //     } else {
  //       emit(state.copyWith(
  //         loading: false,
  //         errorMessage: 'Failed to fetch posts',
  //       ));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(loading: false, errorMessage: e.toString()));
  //   }
  // }
}
