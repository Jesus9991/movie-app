import 'package:flutter/material.dart';

/*
PANTALLA: peliculas que el usaurio marco como favoritas desde el icono favoritas
*/
class FavoritesMoviesScreen extends StatelessWidget {
  const FavoritesMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('FavoritesMoviesSssfcreen'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
