import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/*
permisos de galeria 
*/
class GalleryPermissionProvider with ChangeNotifier {
  /*estado del permiso para la galería */
  PermissionStatus _galleryPermissionStatus = PermissionStatus.denied;

  PermissionStatus get galleryPermissionStatus => _galleryPermissionStatus;

  /*solicita permisos para la galería */
  Future<bool> requestGalleryPermission() async {
    _galleryPermissionStatus = await Permission.photos.request();
    await Permission.camera.request();

    notifyListeners();

    return _galleryPermissionStatus.isGranted;
  }

  /*verifica el estado actual del permiso */
  Future<void> checkGalleryPermission() async {
    _galleryPermissionStatus = await Permission.photos.status;

    /*si el permiso está denegado o permanentemente denegado abre la configuracion de la app */
    if (_galleryPermissionStatus.isDenied ||
        _galleryPermissionStatus.isPermanentlyDenied) {
      await openAppSettings();
    }

    notifyListeners();
  }
}
