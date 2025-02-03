import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:appmovie_request/views/components/details_tv_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
pantallas para las series
*/
class DetailsTvScreen extends StatelessWidget {
  final int id;
  final String image;
  const DetailsTvScreen({
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
          DetailsAppBarTVComponents(id: id, image: image),
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
    final details = Provider.of<DetailsTvProvider>(context);
    return SliverList(
      delegate: SliverChildListDelegate(
        details.tvModel != null
            //Todo: crear un shimmer
            ? [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: PaletteTheme.starColor),
                    Text(
                      details.tvModel!.voteAverage.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' · votos ${details.tvModel!.voteCount} Episodios · ${details.tvModel!.numberOfEpisodes}',
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
                Text(
                  details.tvModel!.overview,
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                //temporadas
                if (details.tvModel!.seasons.isNotEmpty)
                  SizedBox(height: size.height * .02),
                if (details.tvModel!.seasons.isNotEmpty)
                  TitleArrowComponents(title: 'Temporadas', horizontal: 0),
                if (details.tvModel!.seasons.isNotEmpty)
                  ListSeasonsComponents(),
                //creadores
                if (details.tvModel!.createdBy.isNotEmpty)
                  SizedBox(height: size.height * .02),
                if (details.tvModel!.createdBy.isNotEmpty)
                  TitleArrowComponents(title: 'Creadores', horizontal: 0),
                if (details.tvModel!.createdBy.isNotEmpty)
                  ListCreatedByComponents(),
                if (details.tvModel!.genres.isNotEmpty) ListGenderComponents()
              ]
            : [],
      ),
    );
  }
}
