import 'package:animate_do/animate_do.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
lista y card para las peliculas en la pantalla del buscador del home
*/

class ListSearchHomeComponents extends StatefulWidget {
  final ListFilterSearchProvider movies;
  const ListSearchHomeComponents({
    super.key,
    required this.movies,
  });

  @override
  State<ListSearchHomeComponents> createState() =>
      _ListSearchHomeComponentsState();
}

class _ListSearchHomeComponentsState extends State<ListSearchHomeComponents> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getDataBanner();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !widget.movies.isFetchingMore) {
        widget.movies.fetchMoreMovies();
      }
    });
  }

  getDataBanner() async {
    await widget.movies.fetchPetitionMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movies = Provider.of<ListFilterSearchProvider>(context);

    if (movies.isLoading) {
      return ShimmerHorizontalComponents();
    } else if (movies.errorMessage != null && movies.errorMessage != '') {
      return Center(
        child: Column(
          children: [
            Text('Error al mostrar la lista de películas'),
            SizedBox(height: size.height * .02),
            CustomErrorButton(
              isLoading: movies.isLoading,
              onTap: () async {
                movies.setIsLoading(true);
                await movies.refreshPetitionMovies();
                movies.setIsLoading(false);
              },
            )
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: movies.movies!.results.length,
              itemBuilder: (context, index) {
                final data = movies.movies!.results[index];

                return Center(
                  child: _PopularsSearchHomeComponents(
                    id: data.id.toString(),
                    title: data.title,
                    year: data.releaseDate,
                    image: data.posterPath,
                    voteAverage: data.voteAverage.toStringAsFixed(2),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: size.height * .35,
                crossAxisSpacing: 8,
              ),
            ),
          ),
          if (movies.isFetchingMore)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoadingComponents(),
            ),
        ],
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                          borderRadio: 0,
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
