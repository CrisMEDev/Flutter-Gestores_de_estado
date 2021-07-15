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

  void cambiarEdad( int edad ){
    this.usuario.edad = edad;

    notifyListeners();
  }

  void removerUsuario(){
    this._usuario = null;

    notifyListeners();
  }

  void agregarProfesion( String profesion ){
    this._usuario!.profesiones?.add( profesion );

    notifyListeners();
  }

}