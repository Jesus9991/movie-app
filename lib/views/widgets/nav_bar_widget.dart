import 'dart:ui';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:appmovie_request/controllers/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
navbar para las pantallas del home,comando y perfil
*/
class NavBarForsScreenWidgets extends StatefulWidget {
  const NavBarForsScreenWidgets({super.key});

  @override
  State<NavBarForsScreenWidgets> createState() =>
      _NavBarAppScreenWidgetsState();
}

class _NavBarAppScreenWidgetsState extends State<NavBarForsScreenWidgets> {
  int indexSelectScreen = 0;

  List<Widget> screenApp = [
    const HomeUserScreen(),
    const SearchMoviesScreen(),
    const FavoritesMoviesScreen(),
    const ProfileUserScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      indexSelectScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*ontirne el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: indexSelectScreen,
            backgroundColor: isDarkMode
                ? PaletteTheme.blackThree.withAlpha((0.1 * 255).toInt())
                : PaletteTheme.secondary.withAlpha((0.1 * 255).toInt()),
            // Theme.of(context).primaryColor.withAlpha((0.6 * 255).toInt()),
            selectedItemColor: PaletteTheme.secondary,
            unselectedItemColor:
                isDarkMode ? PaletteTheme.greyColor : PaletteTheme.blackTwo,
            iconSize: 25,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) async {
              onTapped(value);
              await VibrationEffectServices().buttonVibrationEffect();
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_2_outline),
                activeIcon: Icon(Iconsax.home_2_bold),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.search_normal_1_outline),
                activeIcon: Icon(Iconsax.search_normal_1_bold),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.heart_outline),
                activeIcon: Icon(Iconsax.heart_bold),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_2user_outline),
                activeIcon: Icon(Iconsax.profile_2user_bold),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: screenApp[indexSelectScreen],
    );
  }
}
