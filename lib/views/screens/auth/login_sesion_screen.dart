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
    final resetPrv = Provider.of<ResetPassswordProvider>(context);
    final registerPrv = Provider.of<RegisterUserProvider>(context);
    return ScaffoldDownAndUpBlurWidget(
      child: Consumer<LoginSesionProvider>(
        builder: (context, auth, child) => AnimatedFadeScaleComponent(
          child: Form(
            key: formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  controller: auth.email,
                  validator: (val) => ValidationInputs.email(val),
                  onChanged: (val) => auth.setEmail(val),
                ),
                SizedBox(height: size.height * .03),

                //contraseña
                InputPasswordComponent(
                  hintext: 'Contraseña',
                  controller: auth.password,
                  validator: (val) => ValidationInputs.password(val),
                  onChanged: (val) => auth.setPassword(val),
                ),
                SizedBox(height: size.height * .02),

                //olvide mi contraseña
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      /*limpia el provider */
                      resetPrv.cleanProvider();

                      /*navega a cambio de contraseña*/
                      Navigator.pushNamed(
                        context,
                        MainRoutes.resetPasswordRoute,
                      );
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
                  isLoading: auth.isLoading,
                  text: 'Iniciar sesion',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      auth.setisLoading(true);
                      /*almacena el token del usuari*/
                      auth.setTokenUser(ApiKeysPath.token);

                      await UserDataPreferences().saveTokenUser(auth.tokenUser);
                      await UserDataPreferences()
                          .saveForPhoto(ImagesAssetsPath.photoProfile);

                      /*navega si coincide con el email y password guardado*/
                      await auth.setNavegationForLogin(context);
                      auth.setisLoading(false);
                    }
                  },
                ),
                SizedBox(height: size.height * .03),

                CustomSecondButton(
                  text: 'Registrarse',
                  onTap: () {
                    registerPrv.cleanProvider();
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
                    SnackbarWidget.showSnackBar(
                      context: context,
                      message: 'En construcción',
                      icon: Icons.error,
                      colorIcon: PaletteTheme.terteary,
                    );
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
