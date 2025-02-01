import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

/*
shared preferences para almacenar el correo del usuario y el token
*/
class UserDataPreferences {
  /*string para las keys */
  String keyForEmail = 'email_user';
  String keyForPassword = 'password_user';
  String keyForToken = 'token_user';
  String keyForName = 'user_name_user';
  String keyForPhoto = 'user_photo_user';

  /*guarda el valor seleccionado */
  Future<void> saveEmailUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForEmail, value);
    log('saveEmailUser $value');
  }

  /*recupera la opcion seleciconada */
  Future<String?> getEmailUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForEmail);
  }

  /*guarda el valor seleccionado */
  Future<void> saveForPassword(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForPassword, value);
    log('keyForPassword $value');
  }

  /*recupera la opcion seleciconada */
  Future<String?> getForPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForPassword);
  }

  /*recupera la opcion seleciconada */
  Future<String?> getTokenUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForToken);
  }

  /*guarda el valor seleccionado */
  Future<void> saveTokenUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForToken, value);
    log('saveTokenUser $value');
  }

  /*guarda el valor seleccionado */
  Future<void> saveUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForName, value);
    log('saveTokenUser $value');
  }

  /*recupera la opcion seleciconada */
  Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForName);
  }

  /*guarda el valor seleccionado */
  Future<void> saveForPhoto(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForPhoto, value);
    log('saveTokenUser $value');
  }

  Future<String?> getForPhoto() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForPhoto);
  }

  /*elimina todos los datos del usuario */
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyForToken);
  }
}
