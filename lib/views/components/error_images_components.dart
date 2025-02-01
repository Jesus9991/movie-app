import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';

/*
componentes para los errores de las imagenes
*/
class ErrorImagesComponents extends StatelessWidget {
  final String? path;
  final double? borderRadio;
  const ErrorImagesComponents({
    super.key,
    this.path,
    this.borderRadio,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadio ?? 15),
        child: Image.asset(
          path ?? ImagesAssetsPath.placeHolder,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
