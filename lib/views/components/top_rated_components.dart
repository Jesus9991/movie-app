import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
lista y card para las peliculas mejor calificadas en el home
*/

class ListTopRatedComponents extends StatefulWidget {
  final TopRatedHomeProvider rated;
  const ListTopRatedComponents({
    super.key,
    required this.rated,
  });

  @override
  State<ListTopRatedComponents> createState() =>
      _ListPopularsNowComponentsState();
}

class _ListPopularsNowComponentsState extends State<ListTopRatedComponents> {
  @override
  void initState() {
    super.initState();
    getDataBanner();
  }

  getDataBanner() async {
    await widget.rated.fetchTopRateMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final rated = Provider.of<TopRatedHomeProvider>(context);

    if (widget.rated.isLoading) {
      return ShimmerHorizontalComponents();
    } else {
      if (widget.rated.errorMessage == null ||
          widget.rated.errorMessage != '') {
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
                isLoading: rated.isLoading,
                onTap: () async {
                  await rated.refreshTopRateMovies();
                },
              )
            ],
          ),
        );
      } else {
        return Container(
          height: size.height * .32,
          padding: EdgeInsets.only(left: size.width * .03),
          child: CarouselSlider.builder(
            itemCount: widget.rated.movies!.results.length,
            itemBuilder: (context, index, realIndex) {
              final data = widget.rated.movies!.results[index];

              return _PopularsMoviesHomeComponents(
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
              viewportFraction: 0.45,
              autoPlay: false,
            ),
          ),
        );
      }
    }
  }
}

class _PopularsMoviesHomeComponents extends StatelessWidget {
  final String id;
  final String title;
  final String year;
  final String image;
  final String voteAverage;
  const _PopularsMoviesHomeComponents({
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
            InkWell(
              onTap: () {
                //Todo: debe navegar a los detalles
              },
              child: SizedBox(
                height: size.height * .25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
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
