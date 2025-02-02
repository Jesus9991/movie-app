import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:appmovie_request/controllers/exports/screen_exports.dart';

/*
provider para el detalle de la pelicula
*/
class DetailsMovieProvider extends ChangeNotifier {
  /* modelo de los datos*/
  DetailsMovieModel? _movie;
  /*estados */
  bool _isLoading = true;
  String? _errorMessage;

  DetailsMovieModel? get movie => _movie;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //POST: peticion para obtener el detalle
  Future<void> fetchMovieDetails(int movieId) async {
    _isLoading = true;
    _errorMessage = null;

    try {
      final url = Uri.parse(
          "${ApiKeysPath.httpApi}/3/movie/$movieId?language=es-ES&api_key=${ApiKeysPath.apiKey}");

      final response = await http.get(
        url,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${ApiKeysPath.token}"
        },
      );
      log('response ${response.body}');
      log('response ${response.statusCode}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        /*convierte la respuesta*/
        final data = json.decode(response.body);
        /*llena los datos del modelo*/
        _movie = DetailsMovieModel.fromJson(data);

        _errorMessage = null;
        _isLoading = false;
        notifyListeners();
      } else {
        _errorMessage = "Error al cargar los detalles de la película.";
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = "Ocurrió un error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

//navegacion a los detalles para ser reutilizada
  Future navegationForDetails({
    required BuildContext context,
    required int id,
    required String image,
  }) async {
    _movie = null;
    _isLoading = true;
    log('id $id');
    /*navega */
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsMovieScreen(
          id: id,
          image: image,
        ),
      ),
    );

    await fetchMovieDetails(id);
    _isLoading = false;

    notifyListeners();
  }
}
