import 'package:flutter/material.dart';

class DescripcionScreen extends StatefulWidget {
  @override
  _DescripcionScreenState createState() => _DescripcionScreenState();
}

class _DescripcionScreenState extends State<DescripcionScreen> {
  final List<Map<String, String>> plantas = [
    {
      'nombre': 'Claveles',
      'imagen': 'image/flor1.png',
      'descripcion': 'Planta ornamental, de flores en colores diversos.',
    },
    {
      'nombre': 'Petunias',
      'imagen': 'image/flor2.png',
      'descripcion': 'Planta con flores en tonos vibrantes, ideal para jardines.',
    },
    {
      'nombre': 'Lantana',
      'imagen': 'image/flor3.png',
      'descripcion': 'Planta resistente, con flores multicolores.',
    },
    {
      'nombre': 'Lavanda',
      'imagen': 'image/flor4.png',
      'descripcion': 'Planta aromática que se usa en la medicina y la cosmética.',
    },
    {
      'nombre': 'Bugambilia',
      'imagen': 'image/flor5.png',
      'descripcion': 'Planta trepadora con flores rosadas o moradas.',
    },
    {
      'nombre': 'Anturio rojo',
      'imagen': 'image/flor6.png',
      'descripcion': 'Planta de interior con flores rojas muy llamativas.',
    },
    {
      'nombre': 'Geranio',
      'imagen': 'image/flor7.png',
      'descripcion': 'Planta que produce flores de colores intensos.',
    },
    {
      'nombre': 'Kalanchoe blossfeldiana',
      'imagen': 'image/flor8.png',
      'descripcion': 'Planta suculenta con flores pequeñas en colores brillantes.',
    },
    {
      'nombre': 'Violeta africana',
      'imagen': 'image/flor9.png',
      'descripcion': 'Planta muy popular por su resistencia y belleza. Ideal para decorar espacios con poca luz.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Determinamos el número de columnas basadas en el tamaño de la pantalla
    int crossAxisCount = (screenWidth > 600) ? 3 : 2; // Más columnas para pantallas grandes

    return Scaffold(
      appBar: AppBar(
        title: Text('Galería de Plantas y Flores'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan[200]!, Colors.pink[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Galería de Plantas
              GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Cambia las columnas según el tamaño de la pantalla
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: (screenWidth > 600) ? 0.6 : 0.75, // Ajustamos el aspecto según el ancho
                ),
                itemCount: plantas.length,
                shrinkWrap: true, // Esto hace que el GridView no ocupe toda la pantalla
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final planta = plantas[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4.0,
                    child: Column(
                      children: [
                        // Imagen expandida que ocupa todo el card
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              planta['imagen']!,
                              fit: BoxFit.cover, // Ajusta para que la imagen ocupe todo el espacio
                              width: double.infinity, // La imagen ocupa todo el ancho
                            ),
                          ),
                        ),
                        // Cuadro beige para la descripción
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xFFF5F5DC), // Color beige
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  planta['nombre']!,
                                  style: TextStyle(
                                    fontSize: screenWidth > 600 ? 18 : 16, // Tamaño más grande en pantallas grandes
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[800],
                                  ),
                                ),
                              ),
                              // Descripción debajo del nombre
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  planta['descripcion']!,
                                  style: TextStyle(
                                    fontSize: screenWidth > 600 ? 16 : 14, // Tamaño más grande en pantallas grandes
                                    color: Colors.blueGrey[600],
                                  ),
                                  textAlign: TextAlign.center, // Asegura que el texto esté centrado
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
