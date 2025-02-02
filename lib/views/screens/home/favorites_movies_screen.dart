import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: peliculas que el usaurio marco como favoritas desde el icono favoritas
*/
class FavoritesMoviesScreen extends StatelessWidget {
  const FavoritesMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffolAppBarWidget(
      appBar: AppBar(
        title: Text(
          'Favoritos',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      child: _ListFavoritesComponents(),
    );
  }
}

class _ListFavoritesComponents extends StatelessWidget {
  const _ListFavoritesComponents();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FavoritesMoviesProvider>(
      builder: (context, provider, child) {
        // Mostrar un indicador de carga mientras se obtienen los datos
        if (provider.favoriteMovies.isEmpty) {
          provider.fetchFavorites(context);
          return const Center(
            child: EmptyStatusComponents(
              title: '¡Aún no tienes películas favoritas!',
              subtitle:
                  'Explora nuestra colección y marca tus películas preferidas para encontrarlas fácilmente aquí.',
            ),
          );
        }

        return provider.favoriteMovies.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: provider.favoriteMovies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: size.height * .35,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final movie = provider.favoriteMovies[index];
                    return Center(
                      child: _PopularsSearchHomeComponents(
                        id: movie.id.toString(),
                        title: movie.name,
                        year: movie.firstAirDate,
                        image: movie.posterPath,
                        voteAverage: movie.voteAverage.toString(),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: EmptyStatusComponents(
                  title: '¡Aún no tienes películas favoritas!',
                  subtitle:
                      'Explora nuestra colección y marca tus películas preferidas para encontrarlas fácilmente aquí.',
                ),
              );
      },
    );
  }
}

class _PopularsSearchHomeComponents extends StatelessWidget {
  final String id;
  final String title;
  final String year;
  final String image;
  final String voteAverage;
  const _PopularsSearchHomeComponents({
    required this.id,
    required this.title,
    required this.year,
    required this.image,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Container(
        width: size.width * .4,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //imagen
            SizedBox(
              height: size.height * .25,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        //Todo: debe navegar a los detalles
                      },
                      child: Image.network(
                        "${ApiKeysPath.lookImages}$image",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return ShimmerContainerComponents();
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            ErrorImagesComponents(
                          borderRadio: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * .01),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),

            Text(
              year,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
