import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
manejo del tema global de la aplicación
*/

class MainTheme {
  /*modo claro */
  static final ThemeData whiteTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarMainTheme.appbarLight,
    primaryColor: PaletteTheme.principal,
    highlightColor: PaletteTheme.secondary,
    colorScheme: const ColorScheme.light(primary: PaletteTheme.purpleOne),
    textTheme: FontsTheme.lightThemeFont,
    disabledColor: PaletteTheme
        .greyColor, //Establece el color para los elementos desactivados
    dividerColor: PaletteTheme.greyColor, //Color del widget Divider()
    scaffoldBackgroundColor:
        PaletteTheme.principal, // Establece el color para el "scaffold"
    visualDensity: VisualDensity
        .adaptivePlatformDensity, //Adaptándose a diferentes tamaños y resoluciones de pantalla.
    unselectedWidgetColor: PaletteTheme.greyColor, //widgets no seleccionados
    scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(10),
            thumbColor: WidgetStatePropertyAll(
                PaletteTheme.secondary.withAlpha((0.5 * 255).toInt())),
            trackColor: const WidgetStatePropertyAll(PaletteTheme.greyColor))
        .copyWith(thumbColor: WidgetStateProperty.all(PaletteTheme.greyColor)),

    iconTheme: const IconThemeData(color: PaletteTheme.purpleTwo, size: 20),
    sliderTheme: SliderThemeData(
      activeTrackColor: PaletteTheme.purpleTwo,
      thumbColor: PaletteTheme.purpleTwo,
      overlayColor: PaletteTheme.purpleOne,
      inactiveTrackColor: PaletteTheme.greyColor.withAlpha((0.2 * 255).toInt()),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteTheme.purpleOne),
    outlinedButtonTheme: ButtonsTheme.outlinedButtonLight,

    elevatedButtonTheme: ButtonsTheme.elevatedButtonLight,
    textButtonTheme: ButtonsTheme.textButtonLight,
    iconButtonTheme: ButtonsTheme.iconButtonLight,
    dividerTheme: const DividerThemeData(color: PaletteTheme.greyColor),
    splashColor: PaletteTheme.secondary.withAlpha((0.2 * 255).toInt()),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        }),
    // navigationBarTheme: NavBarMainThemeData.navigationBarLight,
  );

  /* Tema Oscuro */
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarMainTheme.appbarDark,
    primaryColor: PaletteTheme.secondary,
    highlightColor: PaletteTheme.principal,
    colorScheme: const ColorScheme.dark(
      primary: PaletteTheme.secondary,
      onPrimary: PaletteTheme.principal,
      secondary: PaletteTheme.principal,
      onSecondary: PaletteTheme.principal,
      error: PaletteTheme.redColor,
      onError: PaletteTheme.principal,
      surface: PaletteTheme.secondary,
      onSurface: PaletteTheme.greyColor,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: PaletteTheme.purpleTwo,
      thumbColor: PaletteTheme.purpleTwo,
      overlayColor: PaletteTheme.purpleOne,
      inactiveTrackColor: PaletteTheme.blackTwo,
    ),
    textTheme: FontsTheme.dartThemeFont,
    disabledColor: PaletteTheme.greyColor,
    dividerColor: PaletteTheme.greyColor,
    scaffoldBackgroundColor: PaletteTheme.secondary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: PaletteTheme.greyColor,
    scrollbarTheme: ScrollbarThemeData(
      radius: const Radius.circular(10),
      thumbColor: WidgetStatePropertyAll(
          PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
      trackColor: const WidgetStatePropertyAll(PaletteTheme.greyColor),
    ).copyWith(thumbColor: WidgetStateProperty.all(PaletteTheme.greyColor)),
    iconTheme: const IconThemeData(color: PaletteTheme.principal, size: 20),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteTheme.principal),
    outlinedButtonTheme: ButtonsTheme.outlinedButtonDark,
    elevatedButtonTheme: ButtonsTheme.elevatedButtonDark,
    textButtonTheme: ButtonsTheme.textButtonDark,
    iconButtonTheme: ButtonsTheme.iconButtonDark,
    dividerTheme: const DividerThemeData(color: PaletteTheme.greyColor),
    splashColor: PaletteTheme.greyColor.withAlpha((0.2 * 255).toInt()),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        }),
  );
}
