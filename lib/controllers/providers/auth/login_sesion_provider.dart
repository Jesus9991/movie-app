// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
Provider para el inicio de sesion para el usuario
*/
class LoginSesionProvider extends ChangeNotifier {
  //controladores
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _tokenUser = '';
  bool _isLoading = false;

  TextEditingController get email => _email;
  TextEditingController get password => _password;

  String get tokenUser => _tokenUser;
  bool get isLoading => _isLoading;

  //seteo de datos
  setEmail(String value) {
    _email.text = value; // correo del usuario
    notifyListeners();
  }

  setPassword(String value) {
    _password.text = value; // contraseña del usuario
    notifyListeners();
  }

  setTokenUser(String token) {
    _tokenUser = token; //almacena el token del usuario
    notifyListeners();
  }

  setisLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  //*INICIO DE SESION
  setNavegationForLogin(BuildContext context) async {
    try {
      final emailSaved = await UserDataPreferences().getEmailUser();
      final passwordSaved = await UserDataPreferences().getForPassword();

      if (_email.text == emailSaved && _password.text == passwordSaved) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          MainRoutes.navBarRoute,
          (route) => false,
        );
        return SnackbarWidget.showSnackBar(
          context: context,
          message: '¡Inicio de sesión exitoso!',
          icon: Icons.error,
          colorIcon: PaletteTheme.succesColor,
        );
      } else if (_email.text != emailSaved) {
        return SnackbarWidget.showSnackBar(
          context: context,
          message: 'Correo no encontrado.',
          icon: Icons.error,
          colorIcon: PaletteTheme.terteary,
        );
      } else if (_password.text != passwordSaved) {
        return SnackbarWidget.showSnackBar(
          context: context,
          message: 'La constraseña no coincide.',
          icon: Icons.error,
          colorIcon: PaletteTheme.terteary,
        );
      }
      notifyListeners();
    } catch (e) {
      return SnackbarWidget.showSnackBar(
        context: context,
        message: 'Error: $e',
        icon: Icons.error,
        colorIcon: PaletteTheme.terteary,
      );
    }
  }

  //limpia el provider
  cleanProvider() {
    _email.clear();
    _password.clear();
    _tokenUser = '';
    notifyListeners();
  }
}
