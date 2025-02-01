/*
modelo para que el usuario seleccione el tipo de peliculas o series favorias 
*/
class UserSelectFavoritesModels {
  final String id;
  final String name;
  final String image;
  final bool isFavorite;

  UserSelectFavoritesModels({
    required this.id,
    required this.name,
    required this.image,
    required this.isFavorite,
  });

  // Convertir un JSON a un modelo Dart
  factory UserSelectFavoritesModels.fromJson(Map<String, dynamic> json) {
    return UserSelectFavoritesModels(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }

  // Convertir un modelo Dart a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFavorite': isFavorite,
    };
  }

  // Crear una copia del modelo con valores modificados
  UserSelectFavoritesModels copyWith({
    String? id,
    String? name,
    String? image,
    bool? isFavorite,
  }) {
    return UserSelectFavoritesModels(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
