// ignore_for_file: depend_on_referenced_packages

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*
SQL para los favoritos
*/
class SelectFavoritesMoviesSQL {
  static Database? _database;

  /*Nombre de la base de datos */
  static const String _dbName = 'favorites_movies.db';
  static const String _tableName = 'favorites';

  /*abre o crea la base de datos */
  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY,
            backdropPath TEXT,
            originalLanguage TEXT,
            originalName TEXT,
            overview TEXT,
            popularity REAL,
            posterPath TEXT,
            firstAirDate TEXT,
            name TEXT,
            voteAverage REAL,
            voteCount INTEGER
          )''',
        );
      },
      version: 1,
    );

    return _database!;
  }

  /*inserta una película o serie favorita */
  static Future<void> insertFavorite(ListFavoritesModels movie) async {
    final db = await getDatabase();
    await db.insert(
      _tableName,
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /*obbtiene todas las películas o series favoritas */
  static Future<List<ListFavoritesModels>> getAllFavorites() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(
      maps.length,
      (i) => ListFavoritesModels.fromMap(maps[i]),
    );
  }

  /*elimina una película o serie favorita por su id */
  static Future<void> deleteFavorite(int id) async {
    final db = await getDatabase();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /*verifica si una película o serie ya está en la base de datos */
  static Future<bool> isFavorite(int id) async {
    final db = await getDatabase();
    final result = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}
