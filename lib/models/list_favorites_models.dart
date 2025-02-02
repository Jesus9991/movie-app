/*
modelo para obtener la lista de favoritos
*/
class ListFavoritesModels {
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

  ListFavoritesModels({
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

  // Método para convertir de Map a objeto
  factory ListFavoritesModels.fromMap(Map<String, dynamic> map) {
    return ListFavoritesModels(
      backdropPath: map['backdropPath'] ?? '',
      id: map['id'] ?? 0,
      originalLanguage: map['originalLanguage'] ?? '',
      originalName: map['originalName'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['posterPath'] ?? '',
      firstAirDate: map['firstAirDate'] ?? '',
      name: map['name'] ?? '',
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      voteCount: map['voteCount'] ?? 0,
    );
  }

  // Método para convertir de objeto a Map
  Map<String, dynamic> toMap() {
    return {
      'backdropPath': backdropPath,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalName': originalName,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'firstAirDate': firstAirDate,
      'name': name,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}
