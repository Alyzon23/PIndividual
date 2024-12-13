import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'bienvenida.dart';
import 'login.dart';
import 'registro.dart';
import 'descripcion.dart';
import 'opciones.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plantas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.blueGrey[50]!, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: Colors.blueGrey[50]!, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 61, 78, 87), 
            foregroundColor: const Color.fromARGB(255, 70, 90, 104),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 45, 58, 65),
          titleTextStyle: TextStyle(
            color: Colors.blueGrey[50]!,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BienvenidaScreen(),
        '/login': (context) => LoginScreen(),
        '/registro': (context) => RegistroScreen(),
        '/descripcion': (context) => DescripcionScreen(),
        '/opciones': (context) => OpcionesScreen(),
      },
    );
  }
}
