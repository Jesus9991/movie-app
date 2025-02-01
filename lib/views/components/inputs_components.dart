import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
componentesp para manejar los inputs de la app
*/
class InputsComponents extends StatelessWidget {
  final String title;
  final String hintext;
  final String? initialValue;
  final bool? enabled;
  final int? maxLine;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;
  const InputsComponents({
    super.key,
    required this.title,
    required this.hintext,
    this.initialValue,
    this.enabled,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    required this.validator,
    required this.onChanged,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      initialValue: initialValue,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      enabled: enabled,
      maxLines: maxLine ?? 1,
      style: Theme.of(context).textTheme.headlineMedium,
      cursorColor: PaletteTheme.terteary,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: (value) => onChanged(value),
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
          hintText: hintext,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          fillColor:
              isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteThree,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: PaletteTheme.tertearyTwo, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          )),
    );
  }
}

/*
input para la contraseña
*/

class InputPasswordComponent extends StatefulWidget {
  final String hintext;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? enabled;
  final int? maxLine;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String value) onChanged;
  final String? Function(String? value) validator;
  const InputPasswordComponent({
    super.key,
    required this.hintext,
    this.controller,
    this.initialValue,
    this.enabled,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
    required this.onChanged,
    required this.validator,
  });

  @override
  State<InputPasswordComponent> createState() => _InputPasswordComponentState();
}

class _InputPasswordComponentState extends State<InputPasswordComponent> {
  bool isPassword = true;

  changeStatusPassword() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return TextFormField(
      autocorrect: false,
      controller: widget.controller,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      obscuringCharacter: '*',
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
      cursorColor: PaletteTheme.terteary,
      maxLines: widget.maxLine ?? 1,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: isPassword,
      onChanged: (value) => widget.onChanged(value),
      validator: (value) => widget.validator(value),
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            color:
                isDarkMode ? PaletteTheme.secondary : PaletteTheme.principal),
        fillColor: isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteThree,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: PaletteTheme.tertearyTwo, width: 2),
        ),
        suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => changeStatusPassword(),
            child: isPassword
                ? Icon(
                    Iconsax.eye_outline,
                    color: isDarkMode
                        ? PaletteTheme.secondary
                        : PaletteTheme.principal,
                  )
                : Icon(
                    Iconsax.eye_slash_outline,
                    color: isDarkMode
                        ? PaletteTheme.secondary
                        : PaletteTheme.principal,
                  )),
        hintText: widget.hintext,
      ),
    );
  }
}
