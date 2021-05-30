import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_regreso_seguro/src/models/alumnos_model.dart';

class AlumnosProvider{

  final String _url = 'https://alumnos-c7e1a-default-rtdb.firebaseio.com';

  Future<bool>crearAlumno( AlumnoModel alumno ) async {

    final url = Uri.parse('$_url/alumnos.json');

    final resp = await http.post( url, body: alumnoModelToJson(alumno));

    final decodedData = json.decode(resp.body);

    print( decodedData);

    return true;
  }

  Future<bool>editarAlumno( AlumnoModel alumno ) async {

    final url = Uri.parse('$_url/alumnos/${ alumno.id}.json');

    final resp = await http.put( url, body: alumnoModelToJson(alumno));

    final decodedData = json.decode(resp.body);

    print( decodedData);

    return true;
  }

  Future<List<AlumnoModel>> cargarAlumnos()async{

    final url = Uri.parse('$_url/alumnos.json');
    final resp =  await http.get(url);
    
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<AlumnoModel> alumnos = new List();
    if (decodedData == null) return [];

    decodedData.forEach(( id, alum) {

      final alumTemp = AlumnoModel.fromJson(alum);
      alumTemp.id = id;

      alumnos.add(alumTemp);
    });


    return alumnos;
  }

  Future<int>borrarAlummno (String id) async {

    final url = Uri.parse('$_url/alumnos/$id.json');
    final resp = await http.delete(url);

    return 1;
  }
}