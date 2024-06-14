import 'package:equatable/equatable.dart';

import 'model/post_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final bool loggedOut;
  final List<Post> posts;
  //final bool success;
  final String? errorMessage;

  const HomeState({
    this.loading = false,
    this.loggedOut = false,
    this.posts = const [],
    //this.success = false,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? loading,
    bool? loggedOut,
    List<Post>? posts,
    //bool? success,
    String? errorMessage,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      loggedOut: loggedOut ?? this.loggedOut,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
      //success: success ?? this.success,
    );
  }

  List<Object?> get props => [
        loading,
        loggedOut,
        posts,
        errorMessage,
        //success,
      ];
}
