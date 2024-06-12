abstract class HomeEvent {}

class PerformSearch extends HomeEvent {
  final String query;

  PerformSearch(this.query);
}
