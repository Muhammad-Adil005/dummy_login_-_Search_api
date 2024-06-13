import 'package:equatable/equatable.dart';

import 'model/post_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<Post> posts;
  //final bool success;
  final String? errorMessage;

  const HomeState({
    this.loading = false,
    this.posts = const [],
    //this.success = false,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? loading,
    List<Post>? posts,
    //bool? success,
    String? errorMessage,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
      //success: success ?? this.success,
    );
  }

  List<Object?> get props => [
        loading,
        posts,
        errorMessage,
        //success,
      ];
}
