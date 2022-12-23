// Importamos dos paquetes de Flutter: cupertino.dart y material.dart.
// Estos paquetes proporcionan componentes y estilos para la aplicación.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Importamos la clase NewNotePage del archivo new_note_page.dart.
import 'views/new_note_page.dart';

// Este decorador indica al compilador de Flutter que esta función debe usarse como
// punto de entrada para la aplicación.
@pragma('vm:entry-point')
void addNewNoteFlutter() => runApp(const NewNotePage());

// Esta es la función main(), que es el punto de entrada principal para la aplicación.
void main() => runApp(const NewNotePage());
