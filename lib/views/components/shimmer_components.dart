import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/*
shimmer para la carga de datos 
*/
class ShimmerContainerComponents extends StatelessWidget {
  const ShimmerContainerComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return AnimatedFadeScaleComponent(
      child: Shimmer.fromColors(
        baseColor: isDarkMode
            ? PaletteTheme.blackThree
            : PaletteTheme.whiteTwo.withAlpha((0.5 * 255).toInt()),
        highlightColor: isDarkMode
            ? PaletteTheme.blackThree.withAlpha((0.5 * 255).toInt())
            : PaletteTheme.whiteTwo.withAlpha((0.5 * 255).toInt()),
        enabled: true,
        child: Container(
          height: size.height * .4,
          width: size.width,
          color: Colors.black,
        ),
      ),
    );
  }
}
