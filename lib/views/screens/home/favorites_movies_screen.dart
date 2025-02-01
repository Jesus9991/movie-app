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
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
          ),
          SizedBox(height: size.height * .03),
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          SizedBox(height: size.height * .03),
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
          ),
          SizedBox(height: size.height * .03),
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
