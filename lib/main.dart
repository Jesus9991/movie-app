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
        ChangeNotifierProvider(create: (context) => RegisterUserProvider()),
        ChangeNotifierProvider(create: (context) => NavegationSystemProvider()),
        /*provider para peliculas */
        ChangeNotifierProvider(create: (context) => FavoritesMoviesProvider()),
        /*informacion del usuario*/
        ChangeNotifierProvider(create: (context) => UserInformationProvider()),
        /*banner en el home */
        ChangeNotifierProvider(create: (context) => BannerHomeProvider()),
        ChangeNotifierProvider(create: (context) => PopularsHomeProvider()),
      ],
      child: NavegationSystemApp(),
    );
  }
}

/*sistema de navegación*/
class NavegationSystemApp extends StatelessWidget {
  const NavegationSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavegationSystemProvider>(context);
    return MyApp(
      navProvider: navProvider,
    );
  }
}

class MyApp extends StatefulWidget {
  final NavegationSystemProvider navProvider;
  const MyApp({
    super.key,
    required this.navProvider,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> initialization;

  @override
  void initState() {
    super.initState();
    initialization = widget.navProvider.setNavegationSystemUser();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<NavegationSystemProvider>(
              builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movie app',
              theme: MainTheme.whiteTheme,
              darkTheme: MainTheme.darkTheme,
              routes: MainRoutes.routes,
              initialRoute: value.tokenUser.isEmpty
                  ? MainRoutes.loginUserRoute
                  //Todo:descomentar
                  : MainRoutes.navBarRoute,
              //Todoo: eliminar
              // : MainRoutes.selectMoviesRoute,
              // initialRoute: MainRoutes.navBarRoute,
            );
          });
        } else {
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: LoadingComponents(),
              )));
        }
      },
    );
  }
}
// LoginSesionProvider
