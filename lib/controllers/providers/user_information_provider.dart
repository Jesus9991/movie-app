import 'dart:developer';
import 'dart:io';
import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

/*provider para manejar la informaciòn del usuario */
class UserInformationProvider extends ChangeNotifier {
  UserInformationProvider() {
    getObtainDataUser();
  }

  final TextEditingController _nameUser = TextEditingController();
  final TextEditingController _emailUser = TextEditingController();
  Uint8List? _imageData;

  TextEditingController get nameUser => _emailUser;
  TextEditingController get emailUser => _emailUser;
  Uint8List? get imageData => _imageData;

  /*instancia del sharedPreferences*/
  UserDataPreferences dataPreferences = UserDataPreferences();

//seteo de datos
  setNameUser(String val) {
    _nameUser.text = val; //nombre del usuario
    notifyListeners();
  }

  setEmailUser(String val) {
    _emailUser.text = val; //correo del usuario
    notifyListeners();
  }

  setImageData(Uint8List? image) {
    _imageData = image; //foto de perfil
    notifyListeners();
  }

  /*obtiene los datos  del usuario almacenados en local*/
  Future getObtainDataUser() async {
    try {
      final name = await dataPreferences.getUserName();
      final email = await dataPreferences.getEmailUser();
      final photo = await dataPreferences.getForPhoto();

      setEmailUser(email ?? '');
      setNameUser(name ?? '');

      /*actualiza la imagen del usuario */
      if (photo != null) {
        /*carga la imagen desde assets o almacenamiento local */
        _loadImage(photo);
      }
    } catch (e) {
      log('error de cargar info $e');
    }
  }

  /*carga la imagen, buscando assets */
  Future<void> _loadImage(String imagePath) async {
    if (imagePath.startsWith('assets/')) {
      final ByteData data = await rootBundle.load(imagePath);
      final finalImage = data.buffer.asUint8List();
      setImageData(finalImage);
      notifyListeners();
    } else {
      /*ruta para crear el archivo */
      final file = File(imagePath);
      if (await file.exists()) {
        /*lee el archivo como bytes */
        _imageData = await file.readAsBytes();
      } else {
        /*sii el archivo no existe, agarra la imagen de assets poir defecto */
        _imageData = await _loadDefaultImage();
      }
    }
    notifyListeners();
  }

  /*función para actualizar la imagen (selección de imagen desde la galeria) */
  Future<void> updateImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      _imageData = imageBytes;

      await dataPreferences
          .saveForPhoto(pickedFile.path); // guarda la ruta del archivo

      notifyListeners();
    }
  }

  /*carga una imagen por defecto desde los assets */
  Future<Uint8List> _loadDefaultImage() async {
    final ByteData data = await rootBundle.load(ImagesAssetsPath.photoProfile);
    return data.buffer.asUint8List();
  }
}
