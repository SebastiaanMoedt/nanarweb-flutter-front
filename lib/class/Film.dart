enum FilmState { TO_KEEP, TO_DELETE, TO_WATCH }

class Film {
  String id;
  String title;
  int year;
  int length;
  String specialInfo;
  String filmPath;
  String subsPath;
  FilmState filmState;

  Film({
    required this.id,
    required this.title,
    required this.year,
    required this.length,
    required this.specialInfo,
    required this.filmPath,
    required this.subsPath,
    required this.filmState,
  });
}
