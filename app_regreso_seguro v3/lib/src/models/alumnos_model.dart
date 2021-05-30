// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

AlumnoModel alumnoModelFromJson(String str) => AlumnoModel.fromJson(json.decode(str));

String alumnoModelToJson(AlumnoModel data) => json.encode(data.toJson());

class AlumnoModel {

  String id;
  String nombre;
  String apellido;
  int edad;
  String sexo;

  AlumnoModel({
    this.id,
    this.nombre = '',
    this.apellido = '',
    this.edad = 0,
    this.sexo = '',

  });

  factory AlumnoModel.fromJson(Map<String, dynamic> json) => new AlumnoModel(
    id         : json["id"],
    nombre     : json["nombre"],
    apellido      : json["apellido"],
    edad : json["edad"],
    sexo    : json["sexo"],
  );

  Map<String, dynamic> toJson() => {
    //"id"         : id,
    "nombre"     : nombre,
    "apellido"      : apellido,
    "edad" : edad,
    "sexo"    : sexo,
  };
}
