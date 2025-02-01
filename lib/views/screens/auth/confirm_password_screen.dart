// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
pantalla: cambio de contreseña
*/
class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAppBarAndUpBlurWidget(
      title: 'Confirmar contraseña',
      child: Consumer<ResetPassswordProvider>(
        builder: (context, auth, child) => AnimatedFadeScaleComponent(
          child: Form(
            key: formKey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .04, vertical: size.height * .05),
              children: [
                SizedBox(height: size.height * .1),
                const LogoAuthComponent(),
                Text(
                  'Para completar el cambio de contraseña, confirme ingresando su nueva contraseña.',
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * .03),

                //contraseña
                InputPasswordComponent(
                  hintext: 'Contraseña',
                  controller: auth.password,
                  validator: (val) => ValidationInputs.password(val),
                  onChanged: (val) => auth.setPassword(val),
                ),

                SizedBox(height: size.height * .03),
                // confirmar contraseña
                InputPasswordComponent(
                  hintext: 'Confirmar contraseña',
                  controller: auth.confirmPassword,
                  validator: (val) => ValidationInputs.confirmPassword(val),
                  onChanged: (val) => auth.setConfirmPassword(val),
                ),

                SizedBox(height: size.height * .05),
                //inicio de sesion
                CustomButtonLoadingComponent(
                  isLoading: auth.isLoading,
                  text: 'Confirmar cambio',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      auth.setisLoading(true);
                      /*almacena el token del usuari*/
                      auth.setTokenUser(ApiKeysPath.token);

                      await UserDataPreferences().saveTokenUser(auth.tokenUser);
                      /*navega si el correo es valid */
                      await auth.setNavegationForPassword(context);

                      auth.setisLoading(false);
                    }
                  },
                ),
                SizedBox(height: size.height * .05),
                LoginRichTextOnTap(
                  title: '¿Recordó su contraseña? ',
                  subtitle: 'Iniciar sesión',
                  onTap: () => Navigator.pushReplacementNamed(
                      context, MainRoutes.loginUserRoute),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
