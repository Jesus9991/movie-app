import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
/*
componentes y listas para el home
*/

class ListBannerHomeComponents extends StatelessWidget {
  const ListBannerHomeComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return _BannerHomeComponent(
          onTap: () {
            //Todo: navegar a detalles
          },
        );
      },
      options: CarouselOptions(
        height: size.height,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        autoPlay: true,
      ),
    );
  }
}

class _BannerHomeComponent extends StatelessWidget {
  final Function onTap;
  const _BannerHomeComponent({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Stack(
        children: [
          //imagenes
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.network(
              'https://m.media-amazon.com/images/M/MV5BODcwOTg2MDE3NF5BMl5BanBnXkFtZTgwNTUyNTY1NjM@._V1_.jpg',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return ShimmerContainerComponents();
              },
              errorBuilder: (context, error, stackTrace) =>
                  ErrorImagesComponents(
                borderRadio: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * .2,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  PaletteTheme.blackTwo.withAlpha((0.9 * 255).toInt()),
                  PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
                ],
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'NAME.MOVIE',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'CATEGORY.MOVIE · YEAR.MOVIE',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
