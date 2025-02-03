import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

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
    return SliverList(
      delegate: SliverChildListDelegate(
        [],
      ),
    );
  }
}
