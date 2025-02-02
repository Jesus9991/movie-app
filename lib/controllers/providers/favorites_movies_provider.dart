// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
provider para que el usuario marque favoritas 
*/

class FavoritesMoviesProvider extends ChangeNotifier {
  /*lista para almacenar los favoritos */
  List<Result> _favoriteMovies = [];

  List<Result> get favoriteMovies => _favoriteMovies;

  /*metodo para obtener todos los favoritos */
  Future<void> fetchFavorites(BuildContext context) async {
    _favoriteMovies = await SelectFavoritesMoviesSQL.getAllFavorites();
    notifyListeners();
  }

  /* mwtodo para marcar o desmarcar una pelcula como favorita */
  Future<void> toggleFavorite(Result movie, BuildContext context) async {
    final isFavorite = favoriteMovies.any((m) => m.id == movie.id);

    if (isFavorite) {
      /*se ya está como favorita la eliminamos */
      await SelectFavoritesMoviesSQL.deleteFavorite(movie.id);
      favoriteMovies.removeWhere((m) => m.id == movie.id);
      notifyListeners();

      SnackbarWidget.showSnackBar(
        context: context,
        message: 'Removida de favorita',
        icon: Icons.check_circle_outline,
        colorIcon: PaletteTheme.terteary,
      );
    } else {
      favoriteMovies.add(movie);
      /*se no está como favorita, la agregamos */
      await SelectFavoritesMoviesSQL.insertFavorite(movie);
      notifyListeners();
      SnackbarWidget.showSnackBar(
        context: context,
        message: 'Añadida a favorita',
        icon: Icons.check_circle_outline,
        colorIcon: PaletteTheme.succesColor,
      );
    }

    /*refrescamos la lista de favoritos*/
    await fetchFavorites(context);
    notifyListeners();
  }

  /* metodo para eliminar una película de favoritos directamente */
  Future<void> removeFavorite(int id, BuildContext context) async {
    await SelectFavoritesMoviesSQL.deleteFavorite(id);
    await fetchFavorites(context);
    return SnackbarWidget.showSnackBar(
      context: context,
      message: 'Removida de favorita',
      icon: Icons.check_circle_outline,
      colorIcon: PaletteTheme.terteary,
    );
  }
}
