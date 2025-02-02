// ignore_for_file: use_build_context_synchronously

import 'package:appmovie_request/controllers/exports/exports.dart';

import 'package:flutter/material.dart';

//provider: provider

class ResetPassswordProvider extends ChangeNotifier {
  //controladores
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  String _tokenUser = '';
  bool _isLoading = false;

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;

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

  setConfirmPassword(String val) {
    _confirmPassword.text = val; //confirmar contraseña
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

  //*SI EL CORREO
  setNavegationForEmail(BuildContext context) async {
    try {
      final emailSaved = await UserDataPreferences().getEmailUser();
      // final passwordSaved = await UserDataPreferences().getForPassword();

      if (_email.text == emailSaved) {
        /*navega al home si la contraseña y correo coinciden*/
        Navigator.pushNamed(
          context,
          MainRoutes.confirmPasswordRoute,
        );
        return SnackbarWidget.showSnackBar(
          context: context,
          message: '¡Correo válido!',
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

  //*NAVEGA AL CONFIRMAR LA CONTRASEÑA
  setNavegationForPassword(BuildContext context) async {
    try {
      final passwordSaved = await UserDataPreferences().getForPassword();

      if (_password.text == passwordSaved) {
        /*navega al home si la contraseña y correo coinciden*/
        Navigator.of(context).pushNamedAndRemoveUntil(
          MainRoutes.navBarRoute,
          (route) => false,
        );
        /*cambio de contraseña*/
        await UserDataPreferences().saveForPassword(_password.text);

        return SnackbarWidget.showSnackBar(
          context: context,
          message: '¡Cambio realizado con éxito!',
          icon: Icons.error,
          colorIcon: PaletteTheme.succesColor,
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

  setForPasswordOfEditProfile(BuildContext context) async {
    try {
      final passwordSaved = await UserDataPreferences().getForPassword();

      if (_password.text == passwordSaved) {
        /*navega al home si la contraseña y correo coinciden*/
        Navigator.of(context).pop();
        /*cambio de contraseña*/
        await UserDataPreferences().saveForPassword(_password.text);

        return SnackbarWidget.showSnackBar(
          context: context,
          message: '¡Cambio realizado con éxito!',
          icon: Icons.error,
          colorIcon: PaletteTheme.succesColor,
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
    _confirmPassword.clear();
    notifyListeners();
  }
}
