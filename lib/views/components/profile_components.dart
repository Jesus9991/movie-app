import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

/*
componentes para el menu de perfil
*/
class PhotoProfileComponents extends StatelessWidget {
  const PhotoProfileComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<UserInformationProvider>(context);
    final gallery = Provider.of<GalleryPermissionProvider>(context);
    final profile = Provider.of<UserInformationProvider>(context);
    /*entorno el brillo actual (modo oscuro o claro) */

    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .2,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: size.height * .07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: info.imageData == null
                      ? ErrorImagesComponents(
                          path: ImagesAssetsPath.photoProfile,
                          borderRadio: 200,
                        )
                      : Image.memory(
                          info.imageData!,
                          height: size.height * .6,
                          width: size.width * .6,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              ErrorImagesComponents(
                            path: ImagesAssetsPath.photoProfile,
                            borderRadio: 100,
                          ),
                        ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await gallery.requestGalleryPermission();
                  /*actualiza la foto de perfil*/
                  await profile.updateImageFromGallery();
                },
                child: Container(
                  height: size.height * .06,
                  width: size.width * .13,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode
                        ? PaletteTheme.blackTwo
                        : PaletteTheme.whiteTwo,
                    border: Border.all(
                        color: isDarkMode
                            ? PaletteTheme.principal
                            : PaletteTheme.secondary,
                        width: 5),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.gallery_outline,
                      color: isDarkMode
                          ? PaletteTheme.secondary
                          : PaletteTheme.principal,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            info.nameUser.text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            info.emailUser.text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
