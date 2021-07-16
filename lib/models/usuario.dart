
class Usuario {

  final String nombre;
  final int edad;
  final List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    this.profesiones
  });

  Usuario copyWith({
    nombre,
    edad,
    profesiones
  }) => Usuario(
    nombre: nombre ?? this.nombre,
    edad: edad ?? this.edad,
    profesiones: profesiones ?? this.profesiones
  );

}

