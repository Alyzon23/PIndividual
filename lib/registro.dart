import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaNacimientoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _cedula, _nombres, _apellidos, _estadoCivil;
  DateTime? _fechaNacimiento;
  int? _edad;
  String _genero = 'Masculino';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'cedula': _cedula,
          'nombres': _nombres,
          'apellidos': _apellidos,
          'fecha_nacimiento': _fechaNacimiento != null ? DateFormat('yyyy-MM-dd').format(_fechaNacimiento!) : null,
          'edad': _edad,
          'genero': _genero,
          'estado_civil': _estadoCivil,
          'email': _emailController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registro exitoso')));
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Registro'),
        backgroundColor: Colors.green[600], // Verde de plantas
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.brown[100]!], // Verde y marrón
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Registro de Usuario',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800], // Título en verde
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildTextFormField('Cédula', (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su cédula';
                      }
                      return null;
                    }, (value) {
                      _cedula = value;
                    }, icon: Icons.person),
                    SizedBox(height: 8),
                    _buildTextFormField('Nombres', (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese sus nombres';
                      }
                      return null;
                    }, (value) {
                      _nombres = value;
                    }, icon: Icons.account_circle),
                    SizedBox(height: 8),
                    _buildTextFormField('Apellidos', (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese sus apellidos';
                      }
                      return null;
                    }, (value) {
                      _apellidos = value;
                    }, icon: Icons.account_box),
                    SizedBox(height: 8),
                    _buildDatePicker('Fecha de nacimiento', _fechaNacimientoController, (pickedDate) {
                      setState(() {
                        _fechaNacimiento = pickedDate;
                        _fechaNacimientoController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                        _edad = DateTime.now().year - pickedDate.year;
                      });
                    }),
                    SizedBox(height: 8),
                    _buildTextFormField('Edad', null, null, readOnly: true, controller: TextEditingController(text: _edad != null ? _edad.toString() : ''), icon: Icons.cake),
                    SizedBox(height: 8),
                    _buildDropdown('Género', _genero, ['Masculino', 'Femenino', 'Otro'], (newValue) {
                      setState(() {
                        _genero = newValue!;
                      });
                    }, icon: Icons.accessibility),
                    SizedBox(height: 8),
                    _buildDropdown('Estado Civil', _estadoCivil, ['Soltero', 'Casado', 'Divorciado', 'Viudo'], (newValue) {
                      setState(() {
                        _estadoCivil = newValue!;
                      });
                    }, icon: Icons.favorite),
                    SizedBox(height: 8),
                    _buildTextFormField('Email', (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su email';
                      }
                      Pattern pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(pattern as String);
                      if (!regex.hasMatch(value)) {
                        return 'Por favor, ingrese un email válido';
                      }
                      return null;
                    }, (value) {
                      _emailController.text = value!;
                    }, icon: Icons.email),
                    SizedBox(height: 8),
                    _buildTextFormField('Contraseña', (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su contraseña';
                      }
                      return null;
                    }, (value) {
                      _passwordController.text = value!;
                    }, isPassword: true, icon: Icons.lock),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700], // Verde oscuro
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Registrar', style: TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[300], // Marrón suave
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Cancelar', style: TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, String? Function(String?)? validator, void Function(String?)? onSaved, {bool readOnly = false, TextEditingController? controller, bool isPassword = false, IconData? icon}) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.green[800]), // Verde para las etiquetas
        hintStyle: TextStyle(color: Colors.green[400]), // Verde claro para hint
        prefixIcon: icon != null ? Icon(icon, color: Colors.green[800]) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[600]!, width: 2.0),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      readOnly: readOnly,
      controller: controller,
      obscureText: isPassword,
    );
  }

  Widget _buildDatePicker(String label, TextEditingController controller, Function(DateTime) onDateSelected) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.green[800]),
        hintStyle: TextStyle(color: Colors.green[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[600]!, width: 2.0),
        ),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?)? onChanged, {IconData? icon}) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.green[800]),
        prefixIcon: icon != null ? Icon(icon, color: Colors.green[800]) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.green[600]!, width: 2.0),
        ),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.green[800])),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
