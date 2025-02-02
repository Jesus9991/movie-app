import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:appmovie_request/controllers/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: ajustes de la app
*/
class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final search = Provider.of<SearchDelegateProvider>(context);
    final profile = Provider.of<UserInformationProvider>(context);

    return ScaffolAppBarWidget(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              /*limpia el clear*/
              search.setNullModel();
              /*abre el modal */
              showSearch(context: context, delegate: SearchDelegateWidget());
            },
            icon: Icon(
              Iconsax.search_normal_outline,
            ),
          )
        ],
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .01),
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          //foto de perfil
          PhotoProfileComponents(),
          SizedBox(height: size.height * .01),
          _TitleMenuComponents(title: 'CUENTA'),
          //menu 1
          _ContainerCardComponents(
            height: size.height * .24,
            child: Column(
              // spacing: size.height * .03,
              children: [
                SizedBox(height: size.height * .01),

                //menu 1
                _MenuProfileComponents(
                  title: 'Configuración de la cuenta',
                  icon: Iconsax.profile_add_outline,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MainRoutes.editProfileRoute,
                    );
                  },
                ),
                const _CustomDividerComponents(),
                //menu 3
                _MenuProfileComponents(
                  title: 'Cambio de contraseña',
                  icon: Iconsax.password_check_outline,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MainRoutes.editProfilePasswordRoute,
                    );
                  },
                ),
                const _CustomDividerComponents(),
                //menu 3
                _MenuProfileComponents(
                  title: 'Favoritos',
                  icon: Iconsax.heart_outline,
                  onTap: () {
                    //todo muestra la lista de favoritos
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .03),
          _TitleMenuComponents(title: 'PREFERENCIAS'),
          //menu 2
          _ContainerCardComponents(
            height: size.height * .18,
            child: Column(
              children: [
                SizedBox(height: size.height * .01),
                //menu 1
                _MenuProfileComponents(
                  title: 'Políticas de privacidad',
                  icon: Iconsax.book_1_outline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoremIpsumProfileScreen(
                          title: 'Políticas de privacidad',
                        ),
                      ),
                    );
                  },
                ),
                const _CustomDividerComponents(),
                //menu 2
                _MenuProfileComponents(
                  title: 'Términos y condiciones',
                  icon: Iconsax.user_add_outline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoremIpsumProfileScreen(
                          title: 'Términos y condiciones',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .03),

          _TitleMenuComponents(title: 'SESIÓN'),
          //menu 2
          _ContainerCardComponents(
            height: size.height * .18,
            child: Column(
              children: [
                SizedBox(height: size.height * .01),
                //menu 1
                _MenuProfileComponents(
                  title: 'Acerca de la cuenta',
                  icon: Iconsax.security_outline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoremIpsumProfileScreen(
                          title: 'Acerca de la cuenta',
                        ),
                      ),
                    );
                  },
                ),
                const _CustomDividerComponents(),
                //menu 2
                _MenuProfileComponents(
                  title: 'Cerrar sesión',
                  icon: Iconsax.arrow_bottom_outline,
                  onTap: () => ModalSheetWidget.showSelectTwoOption(
                    context: context,
                    title: 'Cerrar sesión',
                    subtitle:
                        '¿Estás seguro de que deseas cerrar sesión? Tu sesión actual se terminará y necesitarás iniciar sesión nuevamente para continuar.',
                    onConfirm: () async {
                      await profile.setCloseSesion(context);
                    },
                    onCancel: () => Navigator.pop(context),
                    isDark: isDarkMode,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .12),
        ],
      ),
    );
  }
}

class _ContainerCardComponents extends StatelessWidget {
  final double height;
  final Widget child;
  const _ContainerCardComponents({
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      height: height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      decoration: BoxDecoration(
          color: isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}

class _MenuProfileComponents extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const _MenuProfileComponents({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return ListTile(
      contentPadding: EdgeInsetsDirectional.all(0),
      onTap: () => onTap(),
      leading: Icon(icon,
          color: isDarkMode ? PaletteTheme.secondary : PaletteTheme.principal),
      title: Text(
        title,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Iconsax.arrow_right_3_outline,
          color: isDarkMode ? PaletteTheme.secondary : PaletteTheme.principal),
    );
  }
}

class _CustomDividerComponents extends StatelessWidget {
  const _CustomDividerComponents();

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return Divider(
        height: 0.1,
        thickness: 0.4,
        color: isDarkMode ? PaletteTheme.secondary : PaletteTheme.principal);
  }
}

class _TitleMenuComponents extends StatelessWidget {
  final String title;
  const _TitleMenuComponents({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .02),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
      ),
    );
  }
}
