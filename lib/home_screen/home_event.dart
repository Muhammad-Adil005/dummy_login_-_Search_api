abstract class HomeEvent {}

class PerformSearch extends HomeEvent {
  final String query;

  PerformSearch(this.query);
}

class Logout extends HomeEvent {}

// class FetchPosts extends HomeEvent {}
