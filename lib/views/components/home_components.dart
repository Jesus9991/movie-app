import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
/*
componentes y listas para el home
*/

class ListBannerHomeComponents extends StatefulWidget {
  final BannerHomeProvider banner;
  const ListBannerHomeComponents({
    super.key,
    required this.banner,
  });

  @override
  State<ListBannerHomeComponents> createState() =>
      _ListBannerHomeComponentsState();
}

class _ListBannerHomeComponentsState extends State<ListBannerHomeComponents> {
  @override
  void initState() {
    super.initState();
    getDataBanner();
  }

  getDataBanner() async {
    await widget.banner.fetchBannerMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final banner = Provider.of<BannerHomeProvider>(context);

    if (widget.banner.isLoading) {
      return ShimmerContainerComponents();
    } else {
      if (widget.banner.errorMessage == null ||
          widget.banner.errorMessage != '') {
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
                  await banner.refreshBannersMovies();
                },
              )
            ],
          ),
        );
      } else {
        return CarouselSlider.builder(
          itemCount: widget.banner.movies!.results.length,
          itemBuilder: (context, index, realIndex) {
            final data = widget.banner.movies!.results[index];
            return _BannerHomeComponent(
              title: data.title,
              image: data.posterPath,
              year: data.releaseDate,
              voteAverage: data.voteAverage.toStringAsFixed(2),
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
  }
}

class _BannerHomeComponent extends StatelessWidget {
  final Function onTap;
  final String title;
  final String year;
  final String image;
  final String voteAverage;
  const _BannerHomeComponent({
    required this.onTap,
    required this.title,
    required this.image,
    required this.year,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: InkWell(
        onTap: () => onTap(),
        child: Stack(
          children: [
            //imagenes
            SizedBox(
              height: size.height,
              width: size.width,
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
            ShadowDownComponents(),
            ShadowUpComponents(),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .03, vertical: size.height * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: PaletteTheme.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: PaletteTheme.starColor),
                      Text(
                        '$voteAverage ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: PaletteTheme.secondary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '· $year',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: PaletteTheme.secondary),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*titulo y arrow para mostrar al usuario */
class TitleArrowComponents extends StatelessWidget {
  final String title;
  final Function onTap;
  const TitleArrowComponents({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      width: size.width,
      height: size.height * .03,
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          InkWell(
            onTap: () => onTap(),
            child: Icon(
              Iconsax.arrow_right_3_outline,
              color:
                  isDarkMode ? PaletteTheme.secondary : PaletteTheme.principal,
            ),
          )
        ],
      ),
    );
  }
}
