import 'package:get/get.dart';

import 'package:gestores_de_estado/models/usuario.dart';

class UsuarioController extends GetxController {

  // Con ayuda de getx controller las variables pasan a ser observables usando .obs

  var existeUsuario = false.obs;
  var usuario = new Usuario().obs;

  void cargarUsuario( Usuario usuario ){
    this.existeUsuario.value = true;
    this.usuario.value = usuario;
  }

}

