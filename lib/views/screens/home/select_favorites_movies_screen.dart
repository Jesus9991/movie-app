import 'package:flutter/material.dart';

/*
PANTALLA: luego de registrarse el usuario puede seleccionar el tipo de pelicul o series que le gusta
*/
class SelectFavoritesMoviesScreen extends StatelessWidget {
  const SelectFavoritesMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('SelectFavoritesMoviesScreen'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
