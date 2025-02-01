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
