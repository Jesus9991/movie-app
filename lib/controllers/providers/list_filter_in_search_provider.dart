import 'dart:convert';
import 'dart:developer';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
provider para la pantalla del buscador desde el home
*/
class ListFilterSearchProvider extends ChangeNotifier {
  SearchFilterHomeModels? _movies;
  bool _isLoading = false;
  bool _isFetchingMore = false;
  String? _errorMessage;
  int _currentPage = 1;
  int _totalPages = 1; // Se actualizará desde la API

  SearchFilterHomeModels? get movies => _movies;
  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;
  String? get errorMessage => _errorMessage;

  String _filter = 'day';
  String get filter => _filter;

  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  setFilter(String fil) {
    _movies = null;
    _filter = fil;
    notifyListeners();
  }

  //* PETICIÓN INICIAL PARA OBTENER LAS PELÍCULAS
  Future<void> fetchPetitionMovies() async {
    if (_movies != null) return;

    _isLoading = true;
    _errorMessage = null;

    try {
      final url = Uri.parse(
          "${ApiKeysPath.httpApi}/3/trending/movie/$_filter?language=es-ES&api_key=${ApiKeysPath.apiKey}&page=$_currentPage");

      log('Fetching page $_currentPage: $url');

      final response = await http.get(
        url,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${ApiKeysPath.token}"
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        _movies = SearchFilterHomeModels.fromJson(data);
        _totalPages =
            data["total_pages"] ?? 1; // se obtiene el total de paginas

        log('Total pages: $_totalPages');
        notifyListeners();
      } else {
        setErrorMessage('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      setErrorMessage('Error inesperado: $e');
    } finally {
      setIsLoading(false);
    }
  }

  //* PETICIÓN PARA OBTENER MÁS PELÍCULAS (Paginación)
  Future<void> fetchMoreMovies() async {
    if (_isFetchingMore || _currentPage >= _totalPages) return;

    _isFetchingMore = true;
    notifyListeners();

    _currentPage++;

    try {
      final url = Uri.parse(
          "${ApiKeysPath.httpApi}/3/trending/movie/day?language=es-ES&api_key=${ApiKeysPath.apiKey}&page=$_currentPage");

      log('Fetching more, page $_currentPage url $url');

      final response = await http.get(
        url,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer ${ApiKeysPath.token}"
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        final newMovies = SearchFilterHomeModels.fromJson(data);

        _movies!.results.addAll(newMovies.results);
        notifyListeners();
      } else {
        setErrorMessage('Error al cargar más películas');
      }
    } catch (e) {
      setErrorMessage('Error inesperado: $e');
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  //* REFRESCAR PELÍCULAS (Reinicia la paginación)
  Future<void> refreshPetitionMovies() async {
    _movies = null;
    _currentPage++;
    await fetchPetitionMovies();
  }
}
