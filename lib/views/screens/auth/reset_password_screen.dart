// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: cambio de contraseña
*/

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAppBarAndUpBlurWidget(
      title: 'Olvidé mi contraseña',
      child: Consumer<ResetPassswordProvider>(
        builder: (context, auth, child) => AnimatedFadeScaleComponent(
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .04, vertical: size.height * .05),
              children: [
                SizedBox(height: size.height * .1),
                const LogoAuthComponent(),
                Text(
                  'Ingrese su correo electrónico para recuperar su contraseña.',
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * .05),
                //corrreo
                InputsComponents(
                  title: 'Correo electrónico',
                  hintext: 'Correo electrónico',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: auth.email,
                  validator: (val) => ValidationInputs.password(val),
                  onChanged: (value) {},
                  // onChanged: (val) => auth.setEmail(val),
                ),

                SizedBox(height: size.height * .05),
                //inicio de sesion
                CustomButtonLoadingComponent(
                  isLoading: auth.isLoading,
                  text: 'Continuar',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      auth.setisLoading(true);
                      /*almacena el token del usuari*/
                      auth.setTokenUser(ApiKeysPath.token);

                      await UserDataPreferences().saveTokenUser(auth.tokenUser);
                      /*navega si el correo es valid */
                      await auth.setNavegationForEmail(context);

                      auth.setisLoading(false);
                    }
                  },
                ),
                SizedBox(height: size.height * .05),
                LoginRichTextOnTap(
                  title: '¿Recordó su contraseña? ',
                  subtitle: 'Iniciar sesión',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
