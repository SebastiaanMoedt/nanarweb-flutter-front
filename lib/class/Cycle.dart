import 'Film.dart';

enum SortType { RELEASE_YEAR, SPECIAL_INFO, TITLE, LENGTH }

enum CycleState { CURRENT, READY, TO_FILL, WATCHED }

class Cycle {
  int id;
  String name;
  String description;
  List<Film> filmsToWatch;
  List<Film> filmsWatched;
  SortType defaultSortType;
  CycleState state;

  Cycle({
    required this.id,
    required this.name,
    required this.description,
    required this.filmsToWatch,
    required this.filmsWatched,
    required this.defaultSortType,
    required this.state,
  });
}
