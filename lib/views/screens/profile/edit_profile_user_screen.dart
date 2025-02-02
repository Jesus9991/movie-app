// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
pantalla para editar el perfil del usuario
*/
class EditProfileUserScreen extends StatefulWidget {
  const EditProfileUserScreen({super.key});

  @override
  State<EditProfileUserScreen> createState() => _EditProfileUserScreenState();
}

class _EditProfileUserScreenState extends State<EditProfileUserScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownAppBarAndUpBlurWidget(
      title: 'Editar perfil',
      child: Consumer<RegisterUserProvider>(
        builder: (context, auth, child) => AnimatedFadeScaleComponent(
          child: Form(
            key: formKey,
            child: Consumer<UserInformationProvider>(
                builder: (context, profile, child) {
              return ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .05),
                children: [
                  SizedBox(height: size.height * .1),

                  Text(
                    'Puedes editar tu perfil en cualquier momento para actualizar tu información personal',
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
                    initialValue: profile.nameUser.text,
                    validator: (val) => ValidationInputs.inputEmpty(val),
                    onChanged: (val) => profile.setNameUser(val),
                  ),
                  SizedBox(height: size.height * .03),
                  //corrreo
                  InputsComponents(
                    title: 'Correo electrónico',
                    hintext: 'Correo electrónico',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    initialValue: profile.emailUser.text,
                    validator: (val) => ValidationInputs.email(val),
                    onChanged: (val) => profile.setEmailUser(val),
                  ),

                  SizedBox(height: size.height * .03),
                  //inicio de sesion
                  CustomButtonLoadingComponent(
                    isLoading: auth.isLoading,
                    text: 'Guardar cambios',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        auth.setisLoading(true);
                        /*almacena el token del usuari*/
                        auth.setTokenUser(ApiKeysPath.token);
                        /*actualiza el perfil */
                        await profile.setUpdateProfile();

                        await UserDataPreferences()
                            .saveTokenUser(auth.tokenUser);

                        /*navega si coincide con el email y password guardado*/
                        await auth.setNavegationForEditProfile(context);
                        /*cambia el estado */
                        auth.setisLoading(false);
                      }
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
