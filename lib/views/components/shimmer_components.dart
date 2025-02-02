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

class ShimmerHorizontalComponents extends StatelessWidget {
  const ShimmerHorizontalComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return AnimatedFadeScaleComponent(
      child: Container(
        height: size.height * .32,
        width: size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.only(left: size.width * .03),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .03),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: isDarkMode
                ? PaletteTheme.blackThree
                : PaletteTheme.whiteTwo.withAlpha((0.5 * 255).toInt()),
            highlightColor: isDarkMode
                ? PaletteTheme.blackThree.withAlpha((0.5 * 255).toInt())
                : PaletteTheme.whiteTwo.withAlpha((0.5 * 255).toInt()),
            enabled: true,
            child: Container(
              height: size.height * .4,
              width: size.width * .4,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerSearchComponents extends StatelessWidget {
  const ShimmerSearchComponents({super.key});

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .7,
      width: size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(vertical: size.height * .03),
      margin: EdgeInsets.symmetric(horizontal: size.width * .03),
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(height: size.height * .03),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: isDarkMode
              ? PaletteTheme.blackThree
              : PaletteTheme.whiteTwo.withAlpha((0.5 * 255).toInt()),
          highlightColor: isDarkMode
              ? PaletteTheme.blackThree.withAlpha((0.5 * 255).toInt())
              : PaletteTheme.whiteTwo.withAlpha((0.5 * 255).toInt()),
          enabled: true,
          child: Container(
            height: size.height * .07,
            width: size.width * .4,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
