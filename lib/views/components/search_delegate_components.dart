import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
componentes para el buscador del searchdelegate
*/

class ListSearchDelateComponents extends StatefulWidget {
  final SearchDelegateProvider search;
  final String query;
  const ListSearchDelateComponents({
    super.key,
    required this.search,
    required this.query,
  });

  @override
  State<ListSearchDelateComponents> createState() =>
      _ListSearchDelateComponentsState();
}

class _ListSearchDelateComponentsState
    extends State<ListSearchDelateComponents> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!widget.search.isLoading) {
        widget.search.loadMoreMovies(widget.query);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.search.isLoading && widget.search.movies == null) {
      return ShimmerSearchComponents();
    } else if (widget.search.errorMessage != null &&
        widget.search.errorMessage!.isNotEmpty) {
      return Center(
        child: Column(
          children: [
            Text('Error al mostrar la lista de películas'),
            SizedBox(height: size.height * .02),
          ],
        ),
      );
    } else {
      if (widget.search.movies == null ||
          widget.search.movies!.results.isEmpty && widget.query.isNotEmpty) {
        return Center(child: Text('No se encontraron películas'));
      } else {
        return ListView.separated(
          controller: _scrollController,
          itemCount: widget.search.movies!.results.length + 1,
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          separatorBuilder: (context, index) =>
              SizedBox(height: size.height * .03),
          itemBuilder: (context, index) {
            if (index < widget.search.movies!.results.length) {
              final data = widget.search.movies!.results[index];
              return _ResultSearchDelegateComponents(
                id: data.id.toString(),
                title: data.title,
                year: data.releaseDate,
                image: data.posterPath,
              );
            } else {
              return widget.search.isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LoadingComponents(),
                    )
                  : SizedBox();
            }
          },
        );
      }
    }
  }
}

class _ResultSearchDelegateComponents extends StatelessWidget {
  final String id;
  final String title;
  final String year;
  final String image;
  const _ResultSearchDelegateComponents({
    required this.id,
    required this.title,
    required this.year,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      onTap: () {
        //Todo: debe navegar a los detalles
      },
      subtitle: Text(
        year,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      leading: SizedBox(
        width: size.width * .2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            "${ApiKeysPath.lookImages}$image",
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return ShimmerContainerComponents();
            },
            errorBuilder: (context, error, stackTrace) => ErrorImagesComponents(
              borderRadio: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchSugesstionComponents extends StatelessWidget {
  final SearchDelegateProvider search;
  const SearchSugesstionComponents({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    if (search.searchHistory.isEmpty) {
      return Center(
        child: Text(
          'Presiona el icono del buscador para iniciar la búsqueda.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isDarkMode
                    ? PaletteTheme.secondary
                    : PaletteTheme.principal,
              ),
        ),
      );
    } else {
      return ListView.separated(
        itemCount: search.searchHistory.length,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) =>
            SizedBox(height: size.height * .02),
        itemBuilder: (context, index) {
          if (search.searchHistory.isEmpty) {
            return Center(
              child: Text(
                'Presiona el icono del buscador para iniciar la búsqueda.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDarkMode
                          ? PaletteTheme.secondary
                          : PaletteTheme.principal,
                    ),
              ),
            );
          } else {
            final data = search.searchHistory[index];
            return ListTile(
              leading: Text(
                data,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDarkMode
                          ? PaletteTheme.secondary
                          : PaletteTheme.principal,
                    ),
              ),
              trailing: GestureDetector(
                onTap: () async {
                  await search.removeSearchQuery(data);
                },
                child: Icon(
                  Iconsax.trash_outline,
                  color: isDarkMode
                      ? PaletteTheme.secondary
                      : PaletteTheme.principal,
                ),
              ),
            );
          }
        },
      );
    }
  }
}
