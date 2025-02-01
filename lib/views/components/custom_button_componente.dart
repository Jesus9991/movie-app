import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
componente para el boton de la app global
*/
class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .07,
      decoration: BoxDecoration(
        color: PaletteTheme.terteary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: PaletteTheme.transparent,
          elevation: 0,
          textStyle: FontsTheme.typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteTheme.secondary),
          backgroundColor: PaletteTheme.terteary,
          foregroundColor: PaletteTheme.secondary, // Color de las letras
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: () => onTap(),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: FontsTheme.typeFont.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: PaletteTheme.secondary,
          ),
        ),
      ),
    );
  }
}

/*boton que muestra un loading */
class CustomButtonLoadingComponent extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function onTap;
  const CustomButtonLoadingComponent({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .07,
      decoration: BoxDecoration(
        color: PaletteTheme.terteary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isLoading == true
          ? Center(
              child: LoadingButtonComponents(),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: PaletteTheme.transparent,
                elevation: 0,
                textStyle: FontsTheme.typeFont.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: PaletteTheme.secondary),
                backgroundColor: PaletteTheme.terteary,
                foregroundColor: PaletteTheme.secondary, // Color de las letras
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () => onTap(),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: FontsTheme.typeFont.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: PaletteTheme.secondary,
                ),
              ),
            ),
    );
  }
}

class CustomSecondButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomSecondButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: size.width,
      height: size.height * .07,
      decoration: BoxDecoration(
        color: isDarkMode
            ? PaletteTheme.blackThree.withAlpha((0.15 * 255).toInt())
            : Color.fromARGB(255, 210, 210, 210).withAlpha((0.4 * 255).toInt()),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: PaletteTheme.transparent,
          elevation: 0,
          textStyle: FontsTheme.typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteTheme.secondary),
          backgroundColor: isDarkMode
              ? PaletteTheme.blackThree.withAlpha((0.15 * 255).toInt())
              : Color.fromARGB(255, 210, 210, 210)
                  .withAlpha((0.4 * 255).toInt()),
          foregroundColor: PaletteTheme.secondary, // Color de las letras
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: () => onTap(),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: FontsTheme.typeFont.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: PaletteTheme.secondary,
          ),
        ),
      ),
    );
  }
}

class CustomErrorButton extends StatelessWidget {
  final Function onTap;
  final bool isLoading;

  const CustomErrorButton({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .2,
      height: size.height * .05,
      decoration: BoxDecoration(
        color: PaletteTheme.terteary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isLoading == true
          ? Center(
              child: LoadingButtonComponents(),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: PaletteTheme.transparent,
                elevation: 0,
                textStyle: FontsTheme.typeFont.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: PaletteTheme.secondary),
                backgroundColor: PaletteTheme.terteary,
                foregroundColor: PaletteTheme.secondary, // Color de las letras
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () => onTap(),
              child: Icon(Icons.replay),
            ),
    );
  }
}
