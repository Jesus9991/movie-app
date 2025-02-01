import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
PANTALLA: luego de registrarse el usuario puede seleccionar el tipo de pelicul o series que le gusta
*/
class SelectFavoritesMoviesScreen extends StatelessWidget {
  const SelectFavoritesMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAndUpBlurWidget(
        child: AnimatedFadeScaleComponent(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.height * .04),
        child: Column(
          spacing: size.height * .01,
          children: [
            SizedBox(height: size.height * .04),
            Text(
              'Selecciona tus películas o series favoritas',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text('Elige al menos 1 favorito'),
            SizedBox(height: size.height * .03),
            //lista de seleccionables como favoritos
            Expanded(
              child: ListForFavoritesComponents(),
            ),
            SizedBox(height: size.height * .03),
            CustomButton(
              text: 'Continuar',
              onTap: () {
                /*navega al home si la contraseña y correo coinciden*/
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainRoutes.navBarRoute,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
