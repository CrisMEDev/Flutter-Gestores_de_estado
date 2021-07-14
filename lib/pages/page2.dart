import 'package:flutter/material.dart';
import 'package:gestores_de_estado/models/usuario.dart';

import 'package:gestores_de_estado/services/usuario_service.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                final usuario = Usuario(nombre: 'Cristian', edad: 26);
                
                usuarioService.cargarUsuario( usuario );
              }
            ),

            MaterialButton(
              child: Text('Cambiar edad:', style: TextStyle( color: Colors.white ),),
              splashColor: Colors.red,
              color: Colors.green,
              onPressed: (){
                usuarioService.cambiarEdad( 27 );
              }
            ),

            MaterialButton(
              child: Text('Agregar profesión', style: TextStyle( color: Colors.white ),),
              splashColor: Colors.red,
              color: Colors.green,
              onPressed: (){}
            ),
            
          ],
        ),
     ),

   );
  }
}