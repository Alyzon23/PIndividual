import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenida',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[600], // Cambié el color de la barra de navegación
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quienes_somos');
            },
            child: Text(
              'Quiénes Somos',
              style: GoogleFonts.lato(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contacto');
            },
            child: Text(
              'Contáctanos',
              style: GoogleFonts.lato(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal[800]!, Colors.teal[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Menú',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.teal),
              title: Text('Bienvenida', style: GoogleFonts.lato(color: Colors.teal[900])),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.teal),
              title: Text('Login', style: GoogleFonts.lato(color: Colors.teal[900])),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.teal),
              title: Text('Registro de Usuarios', style: GoogleFonts.lato(color: Colors.teal[900])),
              onTap: () {
                Navigator.pushNamed(context, '/registro');
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.teal),
              title: Text('Galería de Plantas', style: GoogleFonts.lato(color: Colors.teal[900])),
              onTap: () {
                Navigator.pushNamed(context, '/descripcion');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.teal),
              title: Text('Opciones', style: GoogleFonts.lato(color: Colors.teal[900])),
              onTap: () {
                Navigator.pushNamed(context, '/opciones');
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/plant_background.jpg'), // Imagen de fondo relacionada con plantas
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [Colors.green[200]!, Colors.pink[100]!], // Colores pastel
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Text(
                  'Bienvenido a mi app',
                  style: GoogleFonts.lato(
                    fontSize: 32,
                    color: Colors.teal[900],
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'image/plant.png', 
                height: 300, // Tamaño ajustado
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explora nuestras funcionalidades, regístrate o inicia sesión para comenzar a disfrutar.',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.teal[700],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Ir a Login', style: GoogleFonts.lato(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200],
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Registrarse', style: GoogleFonts.lato(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de Quiénes Somos
class QuienesSomosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiénes Somos',
          style: GoogleFonts.lato(),
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Text(
          'Pantalla de Quiénes Somos',
          style: GoogleFonts.lato(fontSize: 18, color: Colors.teal[900]),
        ),
      ),
    );
  }
}

// Pantalla de Contáctanos
class ContactoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contáctanos',
          style: GoogleFonts.lato(),
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Text(
          'Pantalla de Contáctanos',
          style: GoogleFonts.lato(fontSize: 18, color: Colors.teal[900]),
        ),
      ),
    );
  }
}
