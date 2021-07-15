import 'package:flutter/material.dart';
import 'package:gestores_de_estado/models/usuario.dart';

import 'package:provider/provider.dart';

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

                // Se usa una instancia del provider UsuarioService para establecer data al usuario
                // como por defecto el listen es true, debe ser cambiado a false ya que intentará dibujar
                // fuera del árbol de widgets
                final usuarioService = Provider.of<UsuarioService>( context, listen: false );

                usuarioService.usuario = new Usuario(nombre: 'Cristian', edad: 26, profesiones: ['Software engineer']);

              }
            ),

            MaterialButton(
              child: Text('Cambiar edad:', style: TextStyle( color: Colors.white ),),
              splashColor: Colors.red,
              color: Colors.green,
              onPressed: (){}
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