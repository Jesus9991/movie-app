/*
modelos para las peliculas populares en el home
*/
class PopularNowModels {
  final int page;
  final List<Result> results;

  PopularNowModels({required this.page, required this.results});

  factory PopularNowModels.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Result> resultsList = list.map((i) => Result.fromJson(i)).toList();

    return PopularNowModels(
      page: json['page'],
      results: resultsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map> resultsJson = results.map((i) => i.toJson()).toList();

    return {
      'page': page,
      'results': resultsJson,
    };
  }
}

class Result {
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '',
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'] ?? '',
      popularity: json['popularity'],
      posterPath: json['poster_path'] ?? '',
      firstAirDate: json['first_air_date'],
      name: json['name'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
