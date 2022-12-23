import 'package:flutter/services.dart';

// Creamos la clase SettingMethodChannel que se encarga de enviar una nota a la plataforma nativa utilizando MethodChannel
class SettingMethodChannel {
// Instancia de MethodChannel con el nombre "notes"
  static const methodChannel = MethodChannel('notes');

  // Método que envía una nota a la plataforma nativa
  void sendNote(String note) async {
    // Invoca el método "sendNote" en la plataforma nativa y le pasa un mapa de argumentos que contiene la clave "text" y el valor de la nota
    await methodChannel
        .invokeMethod<String>('sendNote', {'text': note.toString()});
  }
}
