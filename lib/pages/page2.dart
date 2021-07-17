import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:gestores_de_estado/controllers/usuario_controller.dart';
import 'package:gestores_de_estado/models/usuario.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Se obtienen los argumentos enviados desde alguna página que navego a esta página
    // en este caso es la página 1
    final arguments = Get.arguments;
    print(arguments);

    // Obtener la instancia de mi usuario controller
    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 2' ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle( color: Colors.white ),),
              splashColor: Colors.red,
              color: Colors.green,
              onPressed: (){

                final newUser = Usuario(
                  nombre: 'Cristian',
                  edad: 26,
                  profesiones: [
                    'Software Engineer',
                    'Fullstack developer'
                  ]
                );

                usuarioCtrl.cargarUsuario( newUser );

                Get.snackbar(
                  'Usuario establecido',
                  'Cristian es su nombre',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    ),
                  ]
                );
              }
            ),

            MaterialButton(
              child: Text('Cambiar edad:', style: TextStyle( color: Colors.white ),),
              splashColor: Colors.red,
              color: Colors.green,
              onPressed: (){
                usuarioCtrl.cambiarEdad(30);
              }
            ),

            MaterialButton(
              child: Text('Agregar profesión', style: TextStyle( color: Colors.white ),),
              splashColor: Colors.red,
              color: Colors.green,
              onPressed: (){
                // usuarioCtrl.agregarProfesion( 'Profesion ${usuarioCtrl.usuario.value.profesiones.length + 1}' );
                usuarioCtrl.agregarProfesion( 'Profesion ${usuarioCtrl.countProfesiones + 1}' );
              }
            ),
            
          ],
        ),
     ),

   );
  }
}