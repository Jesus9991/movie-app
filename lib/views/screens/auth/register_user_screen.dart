// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: registro de usuario
*/
class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAppBarAndUpBlurWidget(
      title: 'Registro de usuario',
      child: Consumer<RegisterUserProvider>(
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
                  'Regístrese en nuestra app de películas y disfrute de acceso ilimitado a los mejores estrenos, series y contenido exclusivo.',
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * .05),
                //nombre
                InputsComponents(
                  title: 'Nombre y apellido',
                  hintext: 'Nombre y apellido',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  controller: auth.userName,
                  validator: (val) => ValidationInputs.inputEmpty(val),
                  onChanged: (val) => auth.setUserName(val),
                ),
                SizedBox(height: size.height * .03),
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

                SizedBox(height: size.height * .03),
                //inicio de sesion
                CustomButtonLoadingComponent(
                  isLoading: auth.isLoading,
                  text: 'Registrarse',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      auth.setisLoading(true);
                      /*almacena el token del usuari*/
                      auth.setTokenUser(ApiKeysPath.token);

                      // /*almacena el token, email y contraseña*/
                      await UserDataPreferences()
                          .saveEmailUser(auth.email.text);
                      await UserDataPreferences()
                          .saveForPassword(auth.password.text);
                      await UserDataPreferences()
                          .saveUserName(auth.userName.text);
                      await UserDataPreferences().saveTokenUser(auth.tokenUser);
                      await UserDataPreferences()
                          .saveForPhoto(ImagesAssetsPath.photoProfile);

                      /*navega si coincide con el email y password guardado*/
                      await auth.setNavegationForRegister(context);
                      /*cambia el estado */
                      auth.setisLoading(false);
                    }
                  },
                ),

                SizedBox(height: size.height * .05),
                LoginRichTextOnTap(
                  title: '¿Tienes una cuenta? ',
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
