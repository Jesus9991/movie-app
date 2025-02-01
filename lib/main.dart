import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyProviderAPP());
}

class MyProviderAPP extends StatelessWidget {
  const MyProviderAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*provider para el inicio de sesion */
        ChangeNotifierProvider(create: (context) => LoginSesionProvider()),
        ChangeNotifierProvider(create: (context) => ResetPassswordProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.whiteTheme,
      darkTheme: MainTheme.darkTheme,
      routes: MainRoutes.routes,
      initialRoute: MainRoutes.screenInitRoute,
    );
  }
}
// LoginSesionProvider
