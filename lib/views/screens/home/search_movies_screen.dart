import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

/*
pantalla para abrir el buscador
*/
class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movies = Provider.of<ListFilterSearchProvider>(context);

    return ScaffolAppBarWidget(
        appBar: AppBar(
          title: Text(
            'Catálogo',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        child: Column(
          children: [
            //abre el buscador
            _OpenSearchComponents(),
            SizedBox(height: size.height * .03),
            //lista de datos
            Expanded(
              child: ListSearchHomeComponents(movies: movies),
            ),
          ],
        ));
  }
}

class _OpenSearchComponents extends StatelessWidget {
  const _OpenSearchComponents();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final search = Provider.of<SearchDelegateProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * .03),
      child: Row(
        children: [
          //buscador
          InkWell(
            onTap: () {
              /*limpia el clear*/
              search.setNullModel();
              /*abre el modal */
              showSearch(context: context, delegate: SearchDelegateWidget());
            },
            child: Container(
              height: size.height * .06,
              width: size.width * .75,
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              decoration: BoxDecoration(
                  color: isDarkMode
                      ? PaletteTheme.blackThree
                      : PaletteTheme.whiteThree,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Icon(
                    Iconsax.search_normal_outline,
                    color: isDarkMode
                        ? PaletteTheme.whiteThree
                        : PaletteTheme.blackThree,
                  ),
                  SizedBox(width: size.width * .03),
                  Text('Buscar pelicula', textAlign: TextAlign.start)
                ],
              ),
            ),
          ),
          const Spacer(),
          //filtro
          Container(
            height: size.height * .06,
            width: size.width * .15,
            decoration: BoxDecoration(
                color: isDarkMode
                    ? PaletteTheme.blackThree
                    : PaletteTheme.whiteThree,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  showPopover(
                    context: context,
                    height: 130,
                    width: 140,
                    radius: 15,
                    arrowHeight: 20,
                    arrowWidth: 10,
                    direction: PopoverDirection.top,
                    backgroundColor: isDarkMode
                        ? PaletteTheme.blackThree
                        : PaletteTheme.whiteThree,
                    bodyBuilder: (context) => _MenuPopever(),
                  );
                },
                child: Icon(
                  Iconsax.candle_outline,
                  color: isDarkMode
                      ? PaletteTheme.whiteThree
                      : PaletteTheme.blackThree,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuPopever extends StatelessWidget {
  const _MenuPopever();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ListFilterSearchProvider>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                value.setFilter('day');
                Navigator.pop(context);
                await value.refreshPetitionMovies();
              },
              child: Text(
                'Filtar por día',
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () async {
                value.setFilter('week');
                Navigator.pop(context);
                await value.refreshPetitionMovies();
              },
              child: Text(
                'Filtrar por semana',
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
