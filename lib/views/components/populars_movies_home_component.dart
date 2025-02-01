import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

/*
lista y card para las peliculas populares en el home
*/

class ListPopularsNowComponents extends StatefulWidget {
  final PopularsHomeProvider populars;
  const ListPopularsNowComponents({
    super.key,
    required this.populars,
  });

  @override
  State<ListPopularsNowComponents> createState() =>
      _ListPopularsNowComponentsState();
}

class _ListPopularsNowComponentsState extends State<ListPopularsNowComponents> {
  @override
  void initState() {
    super.initState();
    getDataBanner();
  }

  getDataBanner() async {
    await widget.populars.fetchPopularsMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final banner = Provider.of<PopularsHomeProvider>(context);

    if (widget.populars.isLoading) {
      return ShimmerHorizontalComponents();
    } else {
      if (widget.populars.errorMessage == null ||
          widget.populars.errorMessage != '') {
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
                isLoading: banner.isLoading,
                onTap: () async {
                  await banner.refreshPopularsMovies();
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
            itemCount: widget.populars.movies!.results.length,
            itemBuilder: (context, index, realIndex) {
              final data = widget.populars.movies!.results[index];

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
                          borderRadio: 0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.width * 0.1,
                    width: size.height * 0.045,
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: IconButton(
                          onPressed: () {
                            //Todo: debe marcar como favorito
                          },
                          icon: Icon(
                            Iconsax.heart_outline,
                            size: 20,
                          ),
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
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
