import 'dart:async';

import 'package:app_regreso_seguro/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Vaidators{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);


  //Insertar valores
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePasword => _passwordController.sink.add;

  //Obtener ultimo valor
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}