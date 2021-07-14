import 'package:gestores_de_estado/models/usuario.dart';

class _UsuarioService {

  Usuario? _usuario;

  Usuario get usuario => this._usuario ?? Usuario(nombre: 'No name', edad: 0);

  bool get existeUsuario => ( this._usuario == null ) ? false : true ;

  cargarUsuario( Usuario usuario ) {
    this._usuario = usuario;
  }

  void cambiarEdad( int edad ){
    this._usuario?.edad = edad;
  }

}


final usuarioService = _UsuarioService(); 
