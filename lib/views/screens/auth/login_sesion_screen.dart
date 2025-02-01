// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: inicio de sesion para el usuario
*/
class LoginSesionScreen extends StatefulWidget {
  const LoginSesionScreen({super.key});

  @override
  State<LoginSesionScreen> createState() => _LoginSesionScreenState();
}

class _LoginSesionScreenState extends State<LoginSesionScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ScaffoldDownAndUpBlurWidget(
      child: Consumer<LoginSesionProvider>(
        builder: (context, auth, child) => AnimatedFadeScaleComponent(
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .04, vertical: size.height * .05),
              children: [
                SizedBox(height: size.height * .03),
                const LogoAuthComponent(),
                SizedBox(height: size.height * .05),

                //corrreo
                InputsComponents(
                  title: 'Correo electrónico',
                  hintext: 'Correo electrónico',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => ValidationInputs.password(val),
                  onChanged: (val) => auth.setEmail(val),
                ),
                SizedBox(height: size.height * .03),

                //contraseña
                InputPasswordComponent(
                  hintext: 'Contraseña',
                  validator: (val) => ValidationInputs.password(val),
                  onChanged: (val) => auth.setPassword(val),
                ),
                SizedBox(height: size.height * .02),

                //olvide mi contraseña
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      //Todo: debe navegar a olvide mi contraseña
                    },
                    child: Text(
                      'Olvidé mi contraseña',
                      textAlign: TextAlign.end,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .02),
                //inicio de sesion
                CustomButtonLoadingComponent(
                  isLoading: false,
                  text: 'Iniciar sesion',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      /*almacena el token del usuari*/
                      auth.setTokenUser(ApiKeysPath.token);

                      // /*almacena el token, email y contraseña*/
                      // await UserDataPreferences()
                      //     .saveEmailUser(auth.email.text);
                      // await UserDataPreferences()
                      //     .saveForPassword(auth.password.text);
                      await UserDataPreferences().saveTokenUser(auth.tokenUser);

                      /*navega si coincide con el email y password guardado*/
                      await auth.setNavegationForLogin(context);
                    }
                  },
                ),
                SizedBox(height: size.height * .03),

                CustomSecondButton(
                  text: 'Registrarse',
                  onTap: () {
                    /*navegacion al registro del usuario */
                    Navigator.pushNamed(
                      context,
                      MainRoutes.registerUserRoute,
                    );
                  },
                ),
                SizedBox(height: size.height * .03),

                LineRowComponent(title: 'O inicia sesión con'),
                SizedBox(height: size.height * .03),

                SocialNetworkComponent(
                  isLoading: false,
                  icon: ImagesAssetsPath.googleBanner,
                  onTap: () {
                    //Todo: debe mostrar un snacbar en contrusccion
                  },
                ),
                SizedBox(height: size.height * .02),

                LoginRichText(
                  title:
                      'Al crear una cuenta o iniciar sesión, acepta nuestra ',
                  subtitle: 'Política de términos de servicios.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
