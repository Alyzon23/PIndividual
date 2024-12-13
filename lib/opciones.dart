import 'package:flutter/material.dart';

class OpcionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
        backgroundColor: Colors.green[600], // Color relacionado con plantas
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/plant_background.jpg'), // Imagen de fondo relacionada con plantas
            fit: BoxFit.cover, // La imagen cubrirá toda la pantalla
          ),
          gradient: LinearGradient(
            colors: [Colors.green[200]!, Colors.pink[100]!], // Colores pastel inspirados en el tema de plantas
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1.0], // Definir el rango de los colores en el gradiente
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título "Opciones de la App"
              Text(
                'Opciones de la App',
                style: TextStyle(fontSize: 24, color: Colors.blueGrey[50], fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Imagen
              Image.asset(
                'image/planta2.png', 
                height: 150, 
                width: 150, 
              ),
              SizedBox(height: 20),

              // Configuración de Cuenta y Perfil
              Text(
                'Configuración de Cuenta y Perfil:',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey[50]),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Acción para configurar perfil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400], // Color relacionado con plantas
                ),
                child: Text('Configurar Perfil', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Acción para configurar cuenta
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400], // Color relacionado con plantas
                ),
                child: Text('Configurar Cuenta', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 30),

              // Redes Sociales
              Text(
                'Síguenos en redes sociales:',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey[50]),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Acción para redirigir a Facebook
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.pink), // Ejemplo para Instagram
                    onPressed: () {
                      // Acción para redirigir a Instagram
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.business_center, color: Colors.blueGrey), // Ejemplo para LinkedIn
                    onPressed: () {
                      // Acción para redirigir a LinkedIn
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Desarrollado por Alyzon Egas
              Text(
                'Desarrollado por Alyzon Egas 2024',
                style: TextStyle(fontSize: 14, color: Colors.blueGrey[50], fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),

              // Botón Volver a Bienvenida
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400], // Color relacionado con plantas
                ),
                child: Text('Volver a Bienvenida', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
