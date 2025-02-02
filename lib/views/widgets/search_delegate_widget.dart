import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

/*
buscador para toda la app
*/
class SearchDelegateWidget extends SearchDelegate {
  /*estilo de fuente */
  @override
  String? get searchFieldLabel => 'Buscar peliculas';
  @override
  TextInputAction get textInputAction => TextInputAction.done;
  @override
  TextStyle? get searchFieldStyle =>
      FontsTheme.typeFont.copyWith(fontSize: 15, fontWeight: FontWeight.w300);

  @override
  List<Widget>? buildActions(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final search = Provider.of<SearchDelegateProvider>(context);

    return [
      Consumer<SearchDelegateProvider>(
        builder: (context, value, child) => Container(
          height: size.height * .06,
          width: size.width * .15,
          margin: EdgeInsets.only(right: size.width * .03),
          decoration: BoxDecoration(
              color: isDarkMode
                  ? PaletteTheme.blackThree
                  : PaletteTheme.whiteThree,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: GestureDetector(
              onTap: () async {
                //Todo: debe hacer la peticion de la busqueda
                /*almacena en la lista la busqueda: */
                if (query.isNotEmpty) {
                  await search.addSearchQuery(query);
                  /*buscador */
                  await search.searchMovies(query);
                }
              },
              child: Icon(
                Iconsax.search_normal_outline,
                color: isDarkMode
                    ? PaletteTheme.whiteThree
                    : PaletteTheme.blackThree,
              ),
            ),
          ),
        ),
      ),
    ];
  }

  /*cierra el modal */
  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  /*resultados de la busqueda*/
  @override
  Widget buildResults(BuildContext context) {
    final search = Provider.of<SearchDelegateProvider>(context);
    return ListSearchDelateComponents(search: search, query: query);
  }

/*sugerencias */
  @override
  Widget buildSuggestions(BuildContext context) {
    final search = Provider.of<SearchDelegateProvider>(context);
    return query.isEmpty
        ? SearchSugesstionComponents(search: search)
        : ListSearchDelateComponents(search: search, query: query);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: PaletteTheme.transparent,
        elevation: 0,
        iconTheme: theme.iconTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: searchFieldStyle,
          ),
    );
  }
}
