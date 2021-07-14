import 'dart:async';

import 'package:gestores_de_estado/models/usuario.dart';

class _UsuarioService {

  Usuario? _usuario;

  // Se utilizará un stream para saber cuando redibujar los widgets con cada cambio
  StreamController<Usuario?> _usuarioStreamController = new StreamController<Usuario>();


  Usuario get usuario => this._usuario ?? Usuario(nombre: 'No name', edad: 0);
  bool get existeUsuario => ( this._usuario == null ) ? false : true ;

  Stream<Usuario?> get usuarioStream => _usuarioStreamController.stream;

  cargarUsuario( Usuario usuario ) {
    this._usuario = usuario;

    // Se agrega la información al stream para que notifique a quien este pendiente de el
    this._usuarioStreamController.add( usuario );
  }

  void cambiarEdad( int edad ){
    this._usuario?.edad = edad;

    // Se agrega la información al stream para que notifique a quien este pendiente de el
    this._usuarioStreamController.add( this._usuario );
  }

}


final usuarioService = _UsuarioService(); 
