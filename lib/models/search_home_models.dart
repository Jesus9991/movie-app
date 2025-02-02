/*
modelo para la pantalla del buscador en el home
*/
class SearchFilterHomeModels {
  final int page;
  final List<MovieFilter> results;

  SearchFilterHomeModels({
    required this.page,
    required this.results,
  });

  factory SearchFilterHomeModels.fromJson(Map<String, dynamic> json) {
    return SearchFilterHomeModels(
      page: json['page'],
      results: List<MovieFilter>.from(
          json['results'].map((x) => MovieFilter.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
  }
}

class MovieFilter {
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieFilter({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieFilter.fromJson(Map<String, dynamic> json) {
    return MovieFilter(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: json['popularity'].toDouble(),
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
