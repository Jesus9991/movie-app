import 'dart:io';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
COMPONENTES PARA LOADINGS DE LA AP
*/
class LoadingButtonComponents extends StatelessWidget {
  const LoadingButtonComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final isiOS = Platform.isIOS;
    return Center(
      child: !isiOS
          ? CircularProgressIndicator(
              backgroundColor: PaletteTheme.tertearyTwo,
              color: PaletteTheme.whiteThree,
            )
          : CupertinoActivityIndicator(
              color: PaletteTheme.secondary,
              radius: 12,
            ),
    );
  }
}

class LoadingComponents extends StatelessWidget {
  const LoadingComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final isiOS = Platform.isIOS;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Center(
      child: !isiOS
          ? CircularProgressIndicator(
              backgroundColor:
                  isDarkMode ? PaletteTheme.secondary : PaletteTheme.whiteThree,
              color: PaletteTheme.whiteThree,
            )
          : CupertinoActivityIndicator(
              color:
                  isDarkMode ? PaletteTheme.principal : PaletteTheme.blackThree,
              radius: 12,
            ),
    );
  }
}
