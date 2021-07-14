
class Usuario {

  String nombre;
  int edad;
  List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    profesiones
  }): assert( nombre != 'No name'),
      assert( edad >= 0 ),
      this.profesiones = profesiones ?? [];

}

