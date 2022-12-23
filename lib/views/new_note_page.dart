// importamos la biblioteca 'material.dart' para poder usar widgets de Flutter.
import 'package:flutter/material.dart';
// importamos nuestro formulario para crear notas.
import 'note_form.dart';

// Creamos la clase 'NewNotePage' que hereda de 'StatelessWidget' y sobreescribe el método 'build'.
class NewNotePage extends StatelessWidget {
  // Creamos un constructor de clase que recibe una clave y la pasa a su padre.
  const NewNotePage({super.key});

  // Sobreescribimos el método build.
  @override
  Widget build(BuildContext context) {
    // retornamos MaterialApp, que representa la pantalla principal de usuario de la aplicación.
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: "Note App", home: NoteForm());
  }
}
