import 'dart:convert';

// Método encargado de convertir un json String a nuestro modelo de notas.
Note noteFromJson(String str) => Note.fromJson(json.decode(str));

// Método encargado de convertir nuestro modelo de nota a un json String.
String noteToJson(Note data) => json.encode(data.toJson());

// Clase Note
class Note {
  Note({
    this.noteTitle,
    this.noteDescription,
  });

  // Atributo para el título de la nota.
  String? noteTitle;
  // Atributo para la descripción de la nota.
  String? noteDescription;

  // Constructor de fábrica que se utiliza para crear una instancia de la clase Note a partir de un objeto Map.
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        noteTitle: json["noteTitle"],
        noteDescription: json["noteDescription"],
      );

  // Métodoo para convertir una instancia de la clase Note en un objeto Map
  Map<String, dynamic> toJson() => {
        "noteTitle": noteTitle,
        "noteDescription": noteDescription,
      };
}
