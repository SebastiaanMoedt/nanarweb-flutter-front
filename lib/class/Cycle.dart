import 'Film.dart';

class Cycle {
  int id;
  String name;
  String description;
  List<Film> filmsToWatch;
  List<Film> filmsWatched;

  Cycle({
    required this.id,
    required this.name,
    required this.description,
    required this.filmsToWatch,
    required this.filmsWatched,
  });
}
