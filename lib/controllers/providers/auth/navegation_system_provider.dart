import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
sistema de navegación para mover al usuario segun el dato o rol
*/
class NavegationSystemProvider extends ChangeNotifier {
  /*inicializa en el login*/
  String _tokenUser = '';
  String get tokenUser => _tokenUser;

  /*seteo de navegación*/
  Future setNavegationSystemUser() async {
    try {
      /*obtiene el token del usuario*/
      String? data = await UserDataPreferences().getTokenUser();

      if (data != null) {
        /*si tiene token, va el home */
        _tokenUser = data;
        notifyListeners();
      } else {
        _tokenUser = '';

        notifyListeners();
      }
    } catch (e) {
      _tokenUser = '';
      /*elimina el token */
      await UserDataPreferences().clearUserData();

      notifyListeners();
    }
    notifyListeners();
  }
}
