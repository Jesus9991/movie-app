import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
PANTALLA: peliculas que el usaurio marco como favoritas desde el icono favoritas
*/
class FavoritesMoviesScreen extends StatelessWidget {
  const FavoritesMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffolAppBarWidget(
      appBar: AppBar(
        title: Text(
          'Favoritos',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      child: ListView(
        children: [],
      ),
    );
  }
}
