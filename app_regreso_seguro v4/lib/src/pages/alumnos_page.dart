import 'package:app_regreso_seguro/src/bloc/provide.dart';
import 'package:app_regreso_seguro/src/models/alumnos_model.dart';
import 'package:app_regreso_seguro/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class AlumnoPage extends StatefulWidget {

  @override
  _AlumnoPageState createState() => _AlumnoPageState();
}

class _AlumnoPageState extends State<AlumnoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AlumnosBloc alumnosBloc;
  AlumnoModel alumno = new AlumnoModel();
  bool _guardando = false;

  @override
  Widget build(BuildContext context) {

    alumnosBloc = Provider.alumnosBloc(context);

    final AlumnoModel alumData = ModalRoute.of(context).settings.arguments;
    if (alumData != null){
      alumno = alumData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Agregar alumnos'),
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey ,
            child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearApellido(),
                  _crearEdad(),
                  _crearSexo(),
                  _crearBoton(),
                ],
              ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(){

    return TextFormField(
      initialValue: alumno.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre(s)',
      ),
        onSaved: (value) => alumno.nombre = value,
        validator: (value) {
          if (value.length < 3) {
            return 'Ingrese un nombre';
          } else {
            return null;
          }
        },
    );
  }

  Widget _crearApellido(){

    return TextFormField(
      initialValue: alumno.apellido,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Apellidos',
      ),
      onSaved: (value) => alumno.apellido = value,
      validator: (value){
        if ( value.length < 3){
          return 'Ingrese un apellido';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearEdad(){
    return TextFormField(
      initialValue: alumno.edad.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Edad',
      ),
      onSaved: (value) => alumno.edad = int.parse(value),
        validator: (value) {
          if ( utils.isNumeric(value)){
            return null;
          }else {
            return 'Ingrese una edad valida';
          }
        },
    );
  }

  Widget _crearSexo(){
    return TextFormField(
      initialValue: alumno.sexo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Sexo',
      ),
      onSaved: (value) => alumno.sexo = value,
      validator: (value){
        if ( value.length < 1){
          return 'Ingrese la inicial del sexo';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: (_guardando) ? null : _submit,
        icon: Icon(Icons.save),
        label: Text('Guardar'));
  }

  void _submit(){

    if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();

    setState(() {_guardando = true;});

    if (alumno.id == null) {
      alumnosBloc.agregarAlumno(alumno);
    }else {
      alumnosBloc.editarAlumno(alumno);
    }

    //setState(() {_guardando = false;});
    mostrarSnackbar('Registro actualizado');
    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje){
    
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);

  }
}
