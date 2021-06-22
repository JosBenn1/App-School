import 'package:app_regreso_seguro/src/bloc/provide.dart';
import 'package:app_regreso_seguro/src/pages/alumnos_page.dart';
import 'package:app_regreso_seguro/src/pages/home_page.dart';
import 'package:app_regreso_seguro/src/pages/listAlumnos_page.dart';
import 'package:app_regreso_seguro/src/pages/login_page.dart';
import 'package:app_regreso_seguro/src/pages/registro_page.dart';
import 'package:app_regreso_seguro/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Regreso a clases',
        initialRoute: 'lista',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'alumno' : (BuildContext context) => AlumnoPage(),
          'lista' : (BuildContext context) => listAlumnosPage(),
          'registro' : (BuildContext context) => RegistroPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );

  }
}