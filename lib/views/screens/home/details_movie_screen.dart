import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
maneja los detalles de una pelicula
*/
class DetailsMovieScreen extends StatelessWidget {
  final int id;
  final String image;
  const DetailsMovieScreen({
    super.key,
    required this.id,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAndUpBlurWidget(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          DetailsAppBarComponents(id: id, image: image),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .01),
            sliver: _ViewDetailsComponents(),
          )
        ],
      ),
    );
  }
}

class _ViewDetailsComponents extends StatelessWidget {
  const _ViewDetailsComponents();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final details = Provider.of<DetailsMovieProvider>(context);

    return SliverList(
      delegate: SliverChildListDelegate(
        details.movie != null
            ? [
                details.isLoading
                    ? ShimmerContainerComponents(
                        height: size.height * .03, borderRadius: 40)
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: PaletteTheme.starColor),
                          Text(
                            details.movie!.voteAverage.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' · votos ${details.movie!.voteCount}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                SizedBox(height: size.height * .01),
                Text(
                  'Descripción',
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                details.isLoading
                    ? ShimmerContainerComponents(
                        height: size.height * .03, borderRadius: 40)
                    : Text(
                        details.movie!.overview,
                        textAlign: TextAlign.start,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                SizedBox(height: size.height * .02),
                details.isLoading
                    ? ShimmerContainerComponents(
                        height: size.height * .08, borderRadius: 10)
                    : details.movie!.genres.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: size.height * .2,
                            child: _ListGenderComponents(),
                          )
              ]
            : [],
      ),
    );
  }
}

class _ListGenderComponents extends StatelessWidget {
  const _ListGenderComponents();

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final details = Provider.of<DetailsMovieProvider>(context);

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: details.movie!.genres.length,
      itemBuilder: (context, index) {
        final data = details.movie!.genres[index];
        return Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .01),
            decoration: BoxDecoration(
                color: isDarkMode
                    ? PaletteTheme.blackThree
                    : PaletteTheme.whiteThree,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                data.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ));
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: size.height * 0.01,
        crossAxisSpacing: size.width * 0.03,
        mainAxisExtent: size.height * 0.05, // Reduje el tamaño aquí también
        childAspectRatio: 1.0,
      ),
    );
  }
}
