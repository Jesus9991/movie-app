import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
card para la lista de selccionar favoritas desde el registro
*/

class ListForFavoritesComponents extends StatelessWidget {
  const ListForFavoritesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _CardTypeFavitesComponents();
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of items in each row
        mainAxisSpacing: size.height * .01, // spacing between rows
        crossAxisSpacing: size.width * .03, // spacing between columns
        mainAxisExtent: size.height * .21,
      ),
    );
  }
}

class _CardTypeFavitesComponents extends StatelessWidget {
  const _CardTypeFavitesComponents();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: size.height * .003,
      children: [
        Container(
          height: size.height * .15,
          width: size.width * .3,
          decoration: BoxDecoration(
            color:
                isDarkMode ? PaletteTheme.blackThree : PaletteTheme.whiteThree,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              ImagesAssetsPath.placeHolder,
              fit: BoxFit.cover,
              //Todo: hacer place horder de error y un shimmer mientras carga
            ),
          ),
        ),
        Text(
          'sdsadsadasd',
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
