/*
modelo para obtener la lista de imagenes en el banner del home
*/
class ListMoviesForBannerModels {
  final int page;
  final List<MovieModel> results;

  ListMoviesForBannerModels({
    required this.page,
    required this.results,
  });

  factory ListMoviesForBannerModels.fromJson(Map<String, dynamic> json) {
    return ListMoviesForBannerModels(
      page: json['page'],
      results: (json['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((movie) => movie.toJson()).toList(),
    };
  }
}

class MovieModel {
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

  MovieModel({
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

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
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
