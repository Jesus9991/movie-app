import 'package:flutter/material.dart';

/*
pantalla para abrir el buscador
*/
class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchMoviesScreen'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
