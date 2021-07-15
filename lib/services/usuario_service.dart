import 'package:flutter/material.dart';

import 'package:gestores_de_estado/models/usuario.dart';

class UsuarioService with ChangeNotifier {

  Usuario? _usuario;

  Usuario get usuario => this._usuario ?? Usuario(nombre: 'No name', edad: 0) ;

  bool get existeUsuario => (this._usuario != null) ? true : false;

  set usuario(Usuario usuario) {
    this._usuario = usuario;

    // Notifica a los widgets en donde este instanciado el provider UsuarioService
    // que hubó un cambio en el usuario para que se redibuje
    notifyListeners();
  }

}