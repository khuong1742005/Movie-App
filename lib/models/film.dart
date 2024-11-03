class Film {
  final bool adult;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;


  Film({
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,

  });

  factory Film.fromMap(Map<String, dynamic> e)
  {
    return Film(
      adult: e['adult'],
      originalLanguage: e['original_language'],
      originalTitle: e['original_title'],
      overview: e['overview'],
      posterPath: e['poster_path'],
      releaseDate: e['release_date'],
      voteAverage: e['vote_average'],
      voteCount: e['vote_count'],
    );
  }
  String get fullImageUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}
