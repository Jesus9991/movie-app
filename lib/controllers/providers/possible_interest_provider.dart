import 'dart:convert';
import 'dart:developer';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
provider para traer los posibles intereses
*/
class PossibleInterestProvider extends ChangeNotifier {
  //datos
  PossibleInterestsModels? _movies;
  bool _isLoading = false;
  String? _errorMessage;

  PossibleInterestsModels? get movies => _movies;
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
  Future fetchPossiblesInterestMovies() async {
    if (_movies != null) return; //no hace la peticion si hay datos
    /*cambio de estados*/

    _isLoading = true;
    _errorMessage = null;

    try {
      final url = Uri.parse(
          "${ApiKeysPath.httpApi}/3/tv/on_the_air?language=es-ES&page=1");
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
        _movies = PossibleInterestsModels.fromJson(data);

        log('fetchPossiblesInterestMovies: ${_movies!.results.length}');
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
  Future<void> refreshPossibleInterestMovies() async {
    _movies = null;
    fetchPossiblesInterestMovies();
  }
}
