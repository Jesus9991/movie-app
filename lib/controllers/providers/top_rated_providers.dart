import 'dart:convert';
import 'dart:developer';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
provider para la lista de mejor calificadas
*/
class TopRatedHomeProvider extends ChangeNotifier {
  //datos
  TopRateModels? _movies;
  bool _isLoading = false;
  String? _errorMessage;

  TopRateModels? get movies => _movies;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //seteo de datos
  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  //*POST: PETICION PARA OBTENER LA LISTA DE PELICULAS
  Future fetchTopRateMovies() async {
    if (_movies != null) return; //no hace la peticion si hay datos
    /*cambio de estados*/

    _isLoading = true;
    _errorMessage = null;

    try {
      final url = Uri.parse(
          "${ApiKeysPath.httpApi}/3/tv/top_rated?language=es-ES&page=1");
      final response = await http.get(
        url,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${ApiKeysPath.token}"
        },
      );
      /*si el codigo es 200 añade la respuesta al modelo */
      if (response.statusCode >= 200 && response.statusCode < 300) {
        /*json para la respuesta */
        final data = json.decode(response.body);
        /*llena los datos */
        _movies = TopRateModels.fromJson(data);

        log('fetchTopRateMovies: ${_movies!.results.length}');
        /*cambio de estado */
        setErrorMessage('');

        setIsLoading(false);

        notifyListeners();
      } else {
        setErrorMessage('Error en la solicitud: ${response.statusCode}');
        log('error en banners ${response.statusCode}');
      }
    } catch (e) {
      setErrorMessage('Se produjo un error inesperado: $e');
      log('error en banners $e');
    } finally {
      setIsLoading(false);
    }
  }

  /*metodo para forzar la actualización de datos (si el usuario lo requiere) */
  Future<void> refreshTopRateMovies() async {
    _movies = null;
    fetchTopRateMovies();
  }
}
