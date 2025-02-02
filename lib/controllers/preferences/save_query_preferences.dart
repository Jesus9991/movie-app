import 'package:shared_preferences/shared_preferences.dart';

/*shared preferences para el buscador de peliculas*/
class SaveQueryPreferences {
  static const String _key = 'saved_list';

  /// Guarda un nuevo elemento en la lista
  static Future<void> addToList(String value) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(_key) ?? [];

    // Agregar el nuevo valor y guardar
    list.add(value);
    await prefs.setStringList(_key, list);
  }

  /// Obtiene la lista de elementos guardados
  static Future<List<String>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  /// Elimina un elemento de la lista
  static Future<void> removeFromList(String value) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(_key) ?? [];

    // Remueve el valor y guarda la lista actualizada
    list.remove(value);
    await prefs.setStringList(_key, list);
  }
}
