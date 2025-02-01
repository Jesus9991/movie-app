import 'package:flutter/material.dart';

/*
PANTALLA: inicio de la app, lista de peliculas
*/
class HomeUserScreen extends StatelessWidget {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeUserScreen'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
