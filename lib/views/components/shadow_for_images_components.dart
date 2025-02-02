import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
effecto de sombra para las imagenes
*/
class ShadowDownComponents extends StatelessWidget {
  const ShadowDownComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .2,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            PaletteTheme.blackTwo.withAlpha((0.9 * 255).toInt()),
            PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
          ],
        )),
      ),
    );
  }
}

class ShadowUpComponents extends StatelessWidget {
  const ShadowUpComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .2,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
            PaletteTheme.blackTwo.withAlpha((0.9 * 255).toInt()),
          ],
        )),
      ),
    );
  }
}

class DetailsShadowComponents extends StatelessWidget {
  const DetailsShadowComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .2,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            PaletteTheme.principal.withAlpha((1 * 255).toInt()),
            PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
          ],
        )),
      ),
    );
  }
}
