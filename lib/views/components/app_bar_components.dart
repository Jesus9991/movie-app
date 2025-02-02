import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
COMPONENTS: appbars para toda lapp
*/
class AppbarHomeComponents extends StatelessWidget {
  const AppbarHomeComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final banner = Provider.of<BannerHomeProvider>(context);
    return SliverAppBar(
      toolbarHeight: size.height * .4,
      expandedHeight: size.height * .05,
      elevation: 0,
      pinned: false,
      backgroundColor: PaletteTheme.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [StretchMode.blurBackground, StretchMode.zoomBackground],
        background: Stack(
          children: [
            //lista de imagenes
            ListBannerHomeComponents(
              banner: banner,
            ),
            //appbar blur
            Container(
              height: size.height * .1,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              margin: EdgeInsets.only(top: size.height * .04),
              child: Consumer<UserInformationProvider>(
                builder: (context, info, child) => _DetailsAppBarComponent(
                  info: info,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsAppBarComponent extends StatefulWidget {
  final UserInformationProvider info;
  const _DetailsAppBarComponent({required this.info});

  @override
  State<_DetailsAppBarComponent> createState() =>
      _DetailsAppBarComponentState();
}

class _DetailsAppBarComponentState extends State<_DetailsAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<UserInformationProvider>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .0, vertical: size.height * .0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*INFORMACIÒN DEL USUARIO */
            SizedBox(
              width: size.width * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: PaletteTheme.secondary),
                  ),
                  Text(
                    value.nameUser.text,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: PaletteTheme.secondary),
                  ),
                ],
              ),
            ),
            const Spacer(),

            /*CIRCULO PARA LA FOTO DE PERFIL*/
            CircleAvatar(
              backgroundColor: PaletteTheme.terteary,
              radius: 22,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: widget.info.imageData == null
                    ? ErrorImagesComponents(
                        path: ImagesAssetsPath.photoProfile,
                        borderRadio: 200,
                      )
                    : Image.memory(
                        widget.info.imageData!,
                        height: size.height * .6,
                        width: size.width * .8,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            ErrorImagesComponents(
                          path: ImagesAssetsPath.photoProfile,
                          borderRadio: 100,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
