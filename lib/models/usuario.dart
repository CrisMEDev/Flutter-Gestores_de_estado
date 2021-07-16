
class Usuario {

  final String nombre;
  final int edad;
  final List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    this.profesiones
  });

  // Nuevo método para poder devolver una nueva instancia de Usuario
  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones
  }){
    return Usuario( // Si no se manda una propiedad en el método, se usa el valor que ya contenia la clase
      nombre: nombre ?? this.nombre,
      edad: edad ?? this.edad,
      profesiones: profesiones ?? this.profesiones
    );
  }

}

