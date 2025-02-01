import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
Pantalla: inicial para informar al usuario
*/
class InitPresentationScreen extends StatefulWidget {
  const InitPresentationScreen({super.key});

  @override
  State<InitPresentationScreen> createState() => _InitPresentationScreenState();
}

class _InitPresentationScreenState extends State<InitPresentationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAndUpBlurWidget(
        child: AnimatedFadeScaleComponent(
      child: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.height * .1),
        physics: const BouncingScrollPhysics(),
        children: [
          CardPresentationComponent(),

          //texto
          AnimatedFadeScaleComponent(
            fadeDuration: const Duration(seconds: 4),
            child: Text(
              'Encuéntrame las películas más populares en el cine.',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: size.height * .03),
          //inicio de sesion
          CustomButton(
            text: 'Iniciar sesión',
            onTap: () {
              /*navega al inicio de sesion*/
              Navigator.pushReplacementNamed(
                context,
                MainRoutes.loginUserRoute,
              );
            },
          ),
          SizedBox(height: size.height * .03),
          // registro
          CustomSecondButton(
            text: 'Registrarse',
            onTap: () {
              /*navegacion al registro del usuario */
              Navigator.pushReplacementNamed(
                context,
                MainRoutes.registerUserRoute,
              );
            },
          ),
        ],
      ),
    ));
  }
}
