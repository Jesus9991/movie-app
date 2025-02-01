import 'dart:ui';

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
/*
effecto blur para algunas pantallas
*/

class ScaffoldDownBlurEffectWidget extends StatelessWidget {
  final Widget child;

  const ScaffoldDownBlurEffectWidget({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // fondo que se verá afectado por el desenfoque
            Positioned(
              right: size.width * 0.01,
              top: 10,
              child: Container(
                alignment: Alignment.topRight,
                height: size.height * 0.2,
                width: 150,
                decoration: BoxDecoration(
                  color: PaletteTheme.terteary,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Blur(
              blur: 150,
              colorOpacity: 0.01,
              blurColor: PaletteTheme.terteary,
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
            // El contenido principal del widget
            child,
          ],
        ),
      ),
    );
  }
}

/*doble efecto blur para el scafford */
class ScaffoldDownAndUpBlurWidget extends StatelessWidget {
  final Widget child;
  const ScaffoldDownAndUpBlurWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // fondo que se verá afectado por el desenfoque
            Positioned(
              left: size.width * 0.01,
              top: 10,
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.2,
                width: 80,
                decoration: BoxDecoration(
                  // color: PaletteTheme.terteary,
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        PaletteTheme.terteary,
                        PaletteTheme.tertearyTwo,
                        PaletteTheme.blackThree,
                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),

            Positioned(
              // right: size.width * 0.01,
              bottom: 10,
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.2,
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        PaletteTheme.terteary,
                        PaletteTheme.tertearyTwo,
                        PaletteTheme.blackThree,
                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),

            Blur(
              blur: 110,
              colorOpacity: 0.01,
              blurColor:
                  isDarkMode ? PaletteTheme.principal : PaletteTheme.secondary,
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
            // El contenido principal del widget
            child,
          ],
        ),
      ),
    );
  }
}

class ScaffoldDownAppBarAndUpBlurWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const ScaffoldDownAppBarAndUpBlurWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: AppBar(
              backgroundColor: isDarkMode
                  ? PaletteTheme.principal.withAlpha((0.1 * 255).toInt())
                  : PaletteTheme.secondary.withAlpha((0.1 * 255)
                      .toInt()), // Opacidad para el efecto de cristal
              elevation: 0,
              title: const Text("Blur AppBar"),
              centerTitle: true,
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   centerTitle: false,
      //   title: Text(title),
      // ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // fondo que se verá afectado por el desenfoque
            Positioned(
              left: size.width * 0.01,
              top: 10,
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.2,
                width: 80,
                decoration: BoxDecoration(
                  // color: PaletteTheme.terteary,
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        PaletteTheme.terteary,
                        PaletteTheme.tertearyTwo,
                        PaletteTheme.blackThree,
                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),

            Positioned(
              // right: size.width * 0.01,
              bottom: 10,
              child: Container(
                alignment: Alignment.topCenter,
                height: size.height * 0.2,
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        PaletteTheme.terteary,
                        PaletteTheme.tertearyTwo,
                        PaletteTheme.blackThree,
                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),

            Blur(
              blur: 110,
              colorOpacity: 0.01,
              blurColor:
                  isDarkMode ? PaletteTheme.principal : PaletteTheme.secondary,
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
            // El contenido principal del widget
            child,
          ],
        ),
      ),
    );
  }
}
