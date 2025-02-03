import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListGenderComponents extends StatelessWidget {
  const ListGenderComponents({super.key});

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final details = Provider.of<DetailsTvProvider>(context);

    return SizedBox(
      height: size.height * .2,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        physics: const BouncingScrollPhysics(),
        itemCount: details.tvModel!.genres.length,
        itemBuilder: (context, index) {
          final data = details.tvModel!.genres[index];
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
      ),
    );
  }
}

class ListCreatedByComponents extends StatelessWidget {
  const ListCreatedByComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final details = Provider.of<DetailsTvProvider>(context);

    return SizedBox(
      height: size.height * .19,
      child: ListView.separated(
        itemCount: details.tvModel!.createdBy.length,
        padding: EdgeInsets.symmetric(vertical: size.height * .02),
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: size.width * .03),
        itemBuilder: (context, index) {
          final data = details.tvModel!.createdBy[index];
          return CardReutizableComponents(
            image: data.profilePath,
            name: data.name,
            episodes: '',
            dateTime: '',
          );
        },
      ),
    );
  }
}

/*lista de temporadas */
class ListSeasonsComponents extends StatelessWidget {
  const ListSeasonsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final details = Provider.of<DetailsTvProvider>(context);

    return SizedBox(
      height: size.height * .19,
      child: ListView.separated(
        itemCount: details.tvModel!.seasons.length,
        padding: EdgeInsets.symmetric(vertical: size.height * .02),
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: size.width * .03),
        itemBuilder: (context, index) {
          final data = details.tvModel!.seasons[index];
          return CardReutizableComponents(
            image: data.posterPath,
            name: data.name,
            episodes: data.episodeCount.toString(),
            dateTime: data.airDate,
          );
        },
      ),
    );
  }
}

class CardReutizableComponents extends StatelessWidget {
  final String image;
  final String name;
  final String episodes;
  final String dateTime;
  const CardReutizableComponents({
    super.key,
    required this.image,
    required this.name,
    required this.episodes,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            SizedBox(
              height: size.height * .1,
              width: size.width,
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
            SizedBox(height: size.height * .01),
            Text(
              episodes.isNotEmpty ? '$name · $episodes' : name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Text(
              '$dateTime ',
              maxLines: 2,
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
