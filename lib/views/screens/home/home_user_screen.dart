import 'package:appmovie_request/controllers/exports/exports.dart';

import 'package:flutter/material.dart';
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
                TitleArrowComponents(title: 'Populares ahora', onTap: () {}),
                SizedBox(height: size.height * .02),
                ListPopularsNowComponents(populars: populars),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
