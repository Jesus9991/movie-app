import 'package:appmovie_request/controllers/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
manejo de rutas, de forma optmizada, en caso de usar solo se debe llamar la clase y a la ruta que se quiere navegar
*/

class MainRoutes {
  static const screenInitRoute = '/screen_init';
  static const loginUserRoute = '/login_user_route';
  static const registerUserRoute = '/register_user_route';
  static const selectMoviesRoute = '/select_movie_route';
  static const navBarRoute = '/nav_bar_route';
  static const resetPasswordRoute = '/reset_password_route';
  static const confirmPasswordRoute = '/confirm_password_route';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    screenInitRoute: (_) => const InitPresentationScreen(),
    loginUserRoute: (_) => const LoginSesionScreen(),
    registerUserRoute: (_) => const RegisterUserScreen(),
    /*------HOME------*/
    selectMoviesRoute: (_) => const SelectFavoritesMoviesScreen(),
    navBarRoute: (_) => const NavBarForsScreenWidgets(),
    resetPasswordRoute: (_) => const ResetPasswordScreen(),
    confirmPasswordRoute: (_) => const ConfirmPasswordScreen(),
  };
}
