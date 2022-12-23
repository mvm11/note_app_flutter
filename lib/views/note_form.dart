// importamos la biblioteca 'dart:convert' para poder usar el método.
import 'dart:convert';
// importamos la biblioteca 'material.dart' para poder usar widgets de Flutter.
import 'package:flutter/material.dart';

// importamos nuestro modelo de notas.
import '../models/note.dart';
import '../services/setting_method_channel.dart';

// Creamos la clase 'NoteForm' que hereda de 'StatefulWidget' y sobreescribe el método 'createState'.
class NoteForm extends StatefulWidget {
  // Creamos un constructor de clase que recibe una clave y la pasa a su padre.
  const NoteForm({super.key});

  /// Sobreescribimos el método 'createState' para que devuelva una instancia de la clase.
  @override
  _NoteFormState createState() => _NoteFormState();
}

// Creamos la clase interna '_NoteFormState' que hereda de 'State<NoteForm>' y sobreescribe el método 'build'.
class _NoteFormState extends State<NoteForm> {
  // Creamos una instancia de la clase 'SettingMethodChannel' para comunicarnos con nuestra app nativa de IOS.
  final SettingMethodChannel settingMethodChannel = SettingMethodChannel();

  // Creamos dos instancias de la clase 'TextEditingController' para controlar los campos de entrada de texto.
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // Sobreescribimos el método build.
  @override
  Widget build(BuildContext context) {
    // retornamos el Widget Scaffold, que representa la interfaz de usuario de la aplicación.
    return Scaffold(
      // Creamos el app bar de nuestra aplicación y le damos el títutlo de: "Add a new note 📝".
      appBar: AppBar(title: const Text("Add a new note 📝")),
      body: Center(
        // En el cuerpo de nuestro widget Scaffold contiene un 'Container' que se centra en la pantalla y tiene un padding de 20 pixels en todos los lados.
        child: Container(
          padding: const EdgeInsets.all(20),
          // Creamos un columna de widgets.
          child: Column(
            children: [
              // Agregamos dos campos de entrada de texto para guardar el título y la descripción de la nota.
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter the note's title",
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter the note's description",
                ),
              ),
              // Agregamos un espacio en blanco para separar nuestros TextFields de nuestro botón para guardar notas.
              const SizedBox(
                height: 15,
              ),
              // Agregamos un botón para guardar nuestra notas.
              ElevatedButton(
                // Le pasamos una función anónima a la acción de presionar el botón.
                onPressed: () {
                  //Creamos una nueva instancia de Note
                  final note = Note(
                    noteTitle: titleController.text,
                    noteDescription: descriptionController.text,
                  );

                  // convertimos nuestra nota a un json String.
                  String noteJSON = jsonEncode(note);
                  // envía el json a la app nativa
                  settingMethodChannel.sendNote(noteJSON);

                  // Limpiamos nuestros TextFields.
                  titleController.clear();
                  descriptionController.clear();
                },
                // Indicamos que el texto de nuestro botón es: "Save"
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
