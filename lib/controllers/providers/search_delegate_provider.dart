import 'dart:convert';

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
provider para el buscador 
*/
class SearchDelegateProvider extends ChangeNotifier {
  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;

  SearchDelegateModels? _movies;
  SearchDelegateModels? get movies => _movies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _currentPage = 1;
  int _totalPages = 1;

  int get currentPage => _currentPage;
  int get totalPages => _totalPages;

  // String _querySearch = '';
  // String get querySearch => _querySearch;

  // setQuerySearch(String search) {
  //   _querySearch = search;
  //   notifyListeners();
  // }

  SearchDelegateProvider() {
    _loadSearchHistory();
  }

  // Cargar historial de búsquedas
  Future<void> _loadSearchHistory() async {
    _searchHistory = await SaveQueryPreferences.getList();
    notifyListeners();
  }

  // Agregar una nueva búsqueda al historial
  Future<void> addSearchQuery(String query) async {
    if (!_searchHistory.contains(query)) {
      _searchHistory.add(query);
      await SaveQueryPreferences.addToList(query);
      notifyListeners();
    }
  }

  // Eliminar una búsqueda específica del historial
  Future<void> removeSearchQuery(String query) async {
    _searchHistory.remove(query);
    await SaveQueryPreferences.removeFromList(query);
    notifyListeners();
  }

  // Limpiar el modelo de películas
  setNullModel() {
    _movies = null;
    _currentPage = 1; // Reiniciar la página al limpiar el modelo
    notifyListeners();
  }

  // Realizar la búsqueda de películas
  Future<void> searchMovies(String query, {bool isNewSearch = true}) async {
    if (isNewSearch) {
      _currentPage = 1;
      _movies = null;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse(
        "${ApiKeysPath.httpApi}/3/search/movie?query=$query&include_adult=false&language=en-US&page=$_currentPage&api_key=${ApiKeysPath.apiKey}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _totalPages = data['total_pages'];

        List<SearchResult> fetchedResults = (data['results'] as List)
            .map((item) => SearchResult.fromJson(item))
            .toList();

        if (isNewSearch) {
          // Nueva búsqueda, reiniciar los resultados
          _movies = SearchDelegateModels(
            page: _currentPage,
            results: fetchedResults,
            totalPages: _totalPages,
            totalResults: data['total_results'],
          );
        } else {
          // Agregar más resultados a la lista existente
          _movies = SearchDelegateModels(
            page: _currentPage,
            results: [...?_movies?.results, ...fetchedResults],
            totalPages: _totalPages,
            totalResults: data['total_results'],
          );
        }

        addSearchQuery(query);
      } else {
        _errorMessage = "Error: ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = "Error: $e";
    }

    _isLoading = false;
    notifyListeners();
  }

  // Cargar más películas (Paginación)
  Future<void> loadMoreMovies(String query) async {
    if (_currentPage >= _totalPages || _isLoading) return;

    _currentPage++;
    await searchMovies(query,
        isNewSearch: false); // Realizar búsqueda con la página actualizada
  }
}
