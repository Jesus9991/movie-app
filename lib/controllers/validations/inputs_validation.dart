/*
clase para menajar todas las validaciones de los inputs
*/

class ValidationInputs {
  static String _passwords = '';
  /*contraseña */
  static String? password(String? value) {
    if (value == null) return 'Por favor, ingrese una contraseña.';
    _passwords = value;
    if (value.isEmpty) return 'Por favor, ingrese una contraseña.';
    if (value.length < 7) return 'Mínimo 7 caracteres';
    return null;
  }

  static String? confirmPassword(String? value) {
    if (value == null) return 'El campo contraseña es requerido';
    if (value.isEmpty) return 'El campo contraseña es requerido';
    if (value != _passwords) return 'Las contraseñas no coinciden';
    return null;
  }

  /*ingresar correo electrónico */
  static String? email(String? value) {
    if (value == null) return 'Por favor, ingrese un correo';
    value = value.trim();
    if (value.isEmpty) return 'Por favor, ingrese un correo';

    if (!value.contains('@')) {
      return 'Ingrese un correo un @';
    }

    return null;
  }

  /*inputs donde el usuario tenga que escribir */
  static String? inputEmpty(String? value) {
    if (value == null) return 'Campo está vacío.';
    if (value.isEmpty) return 'Campo está vacío.';
    // if (value.length.i) return 'Mínimo 3 caracteres';
    return null;
  }

  /*para inputs de tipo select */
  static String? inputTypeSelect(String? value) {
    if (value == null) return 'Por favor, seleccione una opción';
    if (value.isEmpty) return 'Por favor, seleccione una opción';
    // if (value.length.i) return 'Mínimo 3 caracteres';
    return null;
  }

  // Validación para edad entre 1 y 100
  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo está vacío.';
    }

    // Intenta convertir el valor a un número entero
    final int? age = int.tryParse(value);

    // Si no es un número válido
    if (age == null) {
      return 'Por favor ingrese un número válido.';
    }

    // Verifica si la edad está dentro del rango de 1 a 100
    if (age < 5 || age > 120) {
      return 'La edad debe estar entre 1 y 100.';
    }

    // Si todo está bien
    return null;
  }
}
