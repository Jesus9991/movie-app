import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
PANTALLA: inicio de la app, lista de peliculas
*/
class HomeUserScreen extends StatelessWidget {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAndUpBlurWidget(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          //apbar
          const AppbarHomeComponents(),
        ],
      ),
    );
  }
}
