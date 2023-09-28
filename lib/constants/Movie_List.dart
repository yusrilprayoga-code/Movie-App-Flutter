class MovieList {
  String? title;
  String? backdropPath;
  String? originalTitle;
  String? Overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  MovieList({
    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.Overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) {
    return MovieList(
      title: json['title'],
      backdropPath: json['backdrop_path'],
      originalTitle: json['original_title'],
      Overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
