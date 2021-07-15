
class Usuario {

  String nombre;
  int edad;
  List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    profesiones
  }): this.profesiones = profesiones ?? [];

}

