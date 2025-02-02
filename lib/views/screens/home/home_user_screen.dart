import 'package:flutter/material.dart';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: inicio de la app, lista de peliculas
*/
class HomeUserScreen extends StatelessWidget {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final populars = Provider.of<PopularsHomeProvider>(context);
    final rated = Provider.of<TopRatedHomeProvider>(context);
    final possible = Provider.of<PossibleInterestProvider>(context);

    return ScaffoldDownAndUpBlurWidget(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          //apbar
          const AppbarHomeComponents(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: size.height * .03),
                //lista de populares
                TitleArrowComponents(
                    title: 'Populares ahora',
                    onTap: () {
                      //Todo: navegar a la lista completa
                    }),
                SizedBox(height: size.height * .02),
                ListPopularsNowComponents(populars: populars),
                //mejor calificas
                TitleArrowComponents(
                    title: 'Mejor calificadas',
                    onTap: () {
                      //Todo: navegar a la lista completa
                    }),
                SizedBox(height: size.height * .02),
                ListTopRatedComponents(rated: rated),
                SizedBox(height: size.height * .02),
                //tmabien te puede interesar
                TitleArrowComponents(
                    title: 'También te puede interesar',
                    onTap: () {
                      //Todo: navegar a la lista completa
                    }),
                SizedBox(height: size.height * .02),
                ListPossibleInterestComponents(possible: possible),

                SizedBox(height: size.height * .2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
