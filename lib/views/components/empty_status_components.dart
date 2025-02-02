import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
estados de la app
*/
class EmptyStatusComponents extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const EmptyStatusComponents({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .12,
            child: Image.asset(isDarkMode
                ? ImagesAssetsPath.darkEmpty
                : ImagesAssetsPath.lightEmpty),
          ),
          SizedBox(height: size.height * .02),
          Text(
            title ?? 'Estado vacio',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            subtitle ?? 'Estado vacio',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
