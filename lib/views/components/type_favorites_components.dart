import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
card para la lista de selccionar favoritas desde el registro
*/

class ListForFavoritesComponents extends StatefulWidget {
  const ListForFavoritesComponents({super.key});

  @override
  State<ListForFavoritesComponents> createState() =>
      _ListForFavoritesComponentsState();
}

class _ListForFavoritesComponentsState
    extends State<ListForFavoritesComponents> {
  void toggleFavorite(int index) {
    setState(() {
      FavoritesMoviesJson.favoritesMovies[index]["isFavorite"] =
          !FavoritesMoviesJson.favoritesMovies[index]["isFavorite"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: FavoritesMoviesJson.favoritesMovies.length,
      itemBuilder: (context, index) {
        final user = FavoritesMoviesJson.favoritesMovies[index];
        return InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => toggleFavorite(index),
          child: _CardTypeFavoritesComponents(
            image: user["image"],
            name: user["name"],
            isFavorite: user["isFavorite"],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: size.height * 0.01,
        crossAxisSpacing: size.width * 0.03,
        mainAxisExtent: size.height * 0.21,
      ),
    );
  }
}

class _CardTypeFavoritesComponents extends StatelessWidget {
  final String image;
  final String name;
  final bool isFavorite;

  const _CardTypeFavoritesComponents({
    required this.image,
    required this.name,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contenedor con animación en el borde
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: size.height * .15,
            width: size.width * .3,
            decoration: BoxDecoration(
              color:
                  isDarkMode ? PaletteTheme.principal : PaletteTheme.whiteThree,
              borderRadius: BorderRadius.circular(15),
              border: isFavorite
                  ? Border.all(width: 2, color: PaletteTheme.secondary)
                  : Border.all(),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImagesAssetsPath.placeHolder,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),

          // Espacio entre la imagen y el texto
          SizedBox(height: size.height * .01),

          // Nombre con animación de opacidad
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isFavorite ? 1.0 : 0.7,
            child: Text(
              name,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
