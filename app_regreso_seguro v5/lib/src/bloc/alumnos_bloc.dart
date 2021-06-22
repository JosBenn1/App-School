import 'package:app_regreso_seguro/src/models/alumnos_model.dart';
import 'package:app_regreso_seguro/src/providers/alumnos_providers.dart';
import 'package:rxdart/rxdart.dart';

class AlumnosBloc{

  final _alumnosController = new BehaviorSubject<List<AlumnoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _alumnosProvider = new AlumnosProvider();

  Stream<List<AlumnoModel>> get alumnosStream => _alumnosController.stream;
  Stream<bool> get cargandoStream => _cargandoController.stream;

  void cargarAlumnos() async {

    final alumnos = await _alumnosProvider.cargarAlumnos();
    _alumnosController.sink.add(alumnos);
  }

  void agregarAlumno( AlumnoModel alumno) async {

    _cargandoController.sink.add(true);
    await _alumnosProvider.crearAlumno(alumno);
    _cargandoController.sink.add(false);
  }

  void editarAlumno( AlumnoModel alumno) async {

    _cargandoController.sink.add(true);
    await _alumnosProvider.editarAlumno(alumno);
    _cargandoController.sink.add(false);
  }

  void borrarAlumno( String id) async {
    
    await _alumnosProvider.borrarAlummno(id);
  }

  dispose(){
    _alumnosController?.close();
    _cargandoController?.close();
  }

}