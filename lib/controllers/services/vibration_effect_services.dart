import 'package:vibration/vibration.dart';

/*
efecto de vibración para toda la app
*/
class VibrationEffectServices {
  //vibracion para el QR
  Future getVibrationServices() async {
    // Verifica si el dispositivo admite vibración
    if (await Vibration.hasVibrator()) {
      // Activa una vibración mínima (50ms)
      Vibration.vibrate(duration: 50);
    }
  }

  //vibracion para los botones
  Future buttonVibrationEffect() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 5);
    }
  }
}
