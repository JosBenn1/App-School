import 'package:app_regreso_seguro/src/bloc/provide.dart';
import 'package:app_regreso_seguro/src/providers/alumnos_providers.dart';
import 'package:app_regreso_seguro/src/models/alumnos_model.dart';
import 'package:flutter/material.dart';

class listAlumnosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final alumnosBloc = Provider.alumnosBloc(context);
    alumnosBloc.cargarAlumnos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos'),
      ),
      body: _crearListado(alumnosBloc),
      floatingActionButton: _crearBoton( context ),
    );
  }
  
  Widget _crearListado(AlumnosBloc alumnosBloc){

    return StreamBuilder(
      stream: alumnosBloc.alumnosStream,
      builder: (BuildContext context, AsyncSnapshot<List<AlumnoModel>> snapshot){
        if (snapshot.hasData){

          final alumnos = snapshot.data;
          return ListView.builder(
            itemCount: alumnos.length,
            itemBuilder: (context, i) => _crearItem(context, alumnosBloc ,alumnos[i]),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );

  }

  Widget _crearItem(BuildContext context, AlumnosBloc alumnosBloc,AlumnoModel alumno){
    
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion)=>alumnosBloc.borrarAlumno(alumno.id),
      child: ListTile(
        title: Text('${ alumno.nombre} - ${ alumno.apellido}'),
        subtitle: Text( alumno.id),
        onTap: ()=> Navigator.pushNamed(context, 'alumno',arguments: alumno),
      ),
    );
  }

  _crearBoton(BuildContext context){
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: ()=> Navigator.pushNamed(context, 'alumno'),
    );
  }


}
