import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
provider: para el registro del usuario
*/
class RegisterUserProvider extends ChangeNotifier {
  //controladores
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  String _tokenUser = '';
  bool _isLoading = false;

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get userName => _userName;

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

  setUserName(String name) {
    _userName.text = name; //nombre del usuairo
    notifyListeners();
  }

  //*REGISTRO DEL USUARIO
  setNavegationForRegister(BuildContext context) async {
    try {
      /*navega al home si la contraseña y correo coinciden*/
      Navigator.pushReplacementNamed(
        context,
        MainRoutes.navBarRoute,
      );
      return SnackbarWidget.showSnackBar(
        context: context,
        message: '¡Registro exitoso!',
        icon: Icons.error,
        colorIcon: PaletteTheme.succesColor,
      );
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
