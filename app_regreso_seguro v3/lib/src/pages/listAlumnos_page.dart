import 'package:app_regreso_seguro/src/bloc/provide.dart';
import 'package:app_regreso_seguro/src/providers/alumnos_providers.dart';
import 'package:app_regreso_seguro/src/models/alumnos_model.dart';
import 'package:flutter/material.dart';

class listAlumnosPage extends StatelessWidget {

  final alumnosProvider = new AlumnosProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos'),
      ),
      body: _crearListado(),
    );
  }
  
  Widget _crearListado(){

    return FutureBuilder(
      future: alumnosProvider.cargarAlumnos(),
      builder: (BuildContext context, AsyncSnapshot<List<AlumnoModel>> snapshot){
        if (snapshot.hasData){

          final alumnos = snapshot.data;
          return ListView.builder(
            itemCount: alumnos.length,
            itemBuilder: (context, i) => _crearItem(context, alumnos[i]),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
    }
    );
  }

  Widget _crearItem(BuildContext context, AlumnoModel alumno){
    
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion){
        alumnosProvider.borrarAlummno(alumno.id);
      },
      child: ListTile(
        title: Text('${ alumno.nombre} - ${ alumno.apellido}'),
        subtitle: Text( alumno.id),
        onTap: ()=> Navigator.pushNamed(context, 'alumno',arguments: alumno),
      ),
    );
  }
}
