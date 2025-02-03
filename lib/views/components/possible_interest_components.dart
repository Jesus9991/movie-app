import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
lista y card para las peliculas mejor calificadas en el home
*/

class ListPossibleInterestComponents extends StatefulWidget {
  final PossibleInterestProvider possible;
  const ListPossibleInterestComponents({
    super.key,
    required this.possible,
  });

  @override
  State<ListPossibleInterestComponents> createState() =>
      _ListPopularsNowComponentsState();
}

class _ListPopularsNowComponentsState
    extends State<ListPossibleInterestComponents> {
  @override
  void initState() {
    super.initState();
    getDataBanner();
  }

  getDataBanner() async {
    await widget.possible.fetchPossiblesInterestMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final possible = Provider.of<PossibleInterestProvider>(context);

    if (widget.possible.isLoading) {
      return ShimmerHorizontalComponents();
    } else {
      if (widget.possible.errorMessage == null ||
          widget.possible.errorMessage != '') {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error al mostrar los banners',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * .02),
              CustomErrorButton(
                isLoading: possible.isLoading,
                onTap: () async {
                  await possible.refreshPossibleInterestMovies();
                },
              )
            ],
          ),
        );
      } else {
        return Container(
          height: size.height * .16,
          padding: EdgeInsets.only(left: size.width * .03),
          child: CarouselSlider.builder(
            itemCount: widget.possible.movies!.results.length,
            itemBuilder: (context, index, realIndex) {
              final data = widget.possible.movies!.results[index];

              return _CardComponents(
                id: data.id.toString(),
                title: data.name,
                year: data.firstAirDate,
                image: data.posterPath,
                voteAverage: data.voteAverage.toStringAsFixed(2),
              );
            },
            options: CarouselOptions(
              height: size.height,
              aspectRatio: 16 / 9,
              viewportFraction: 0.4,
              autoPlay: false,
            ),
          ),
        );
      }
    }
  }
}

class _CardComponents extends StatelessWidget {
  final String id;
  final String title;
  final String year;
  final String image;
  final String voteAverage;
  const _CardComponents({
    required this.id,
    required this.title,
    required this.year,
    required this.image,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final details = Provider.of<DetailsTvProvider>(context);
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Container(
        width: size.width * .35,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //imagen
            InkWell(
              onTap: () async {
                /*navega a la pantalla de detalles */
                await details.navegationForDetails(
                    context: context, id: int.parse(id), image: image);
              },
              child: SizedBox(
                height: size.height * .1,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: int.parse(id),
                    child: Image.network(
                      "${ApiKeysPath.lookImages}$image",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return ShimmerContainerComponents();
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          ErrorImagesComponents(
                        borderRadio: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * .01),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: PaletteTheme.starColor, size: 15),
                Text(
                  '$voteAverage ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
