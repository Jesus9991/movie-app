/*
modela reuzables
*/
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

class ModalSheetWidget {
  //modal con 2 opciones
  static void showSelectTwoOption({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Function onConfirm,
    required Function onCancel,
    required isDark,
  }) {
    showModalBottomSheet(
      elevation: 0,
      context: context,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: isDark
          ? PaletteTheme.principal.withAlpha((0.6 * 255).toInt())
          : PaletteTheme.secondary.withAlpha((0.6 * 255).toInt()),
      builder: (context) => _ContainerTwoAction(
        title: title,
        subtitle: subtitle,
        onConfirm: () => onConfirm(),
        onCancel: () => onCancel(),
      ),
    );
  }
}

class _ContainerTwoAction extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onConfirm;
  final Function onCancel;
  const _ContainerTwoAction({
    required this.title,
    required this.subtitle,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*ontirne el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
        height: size.height * .4,
        width: size.width,
        decoration: BoxDecoration(
          color: isDarkMode ? PaletteTheme.principal : PaletteTheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.height * .03, vertical: size.height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: size.height * .04),
              CustomButton(
                text: 'Continuar',
                onTap: () => onConfirm(),
              ),
              SizedBox(height: size.height * .02),
              CustomSecondButton(
                text: 'Cancelar',
                onTap: () => onCancel(),
              )
            ],
          ),
        ));
  }
}
