import 'package:flutter/material.dart';

import 'package:gestores_de_estado/services/usuario_service.dart';
import 'package:gestores_de_estado/models/usuario.dart';

int x = 20;   // Valor usado para aumentar la edad con el boton 'cambiar edad'

class Page2Page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        // Por defecto un stream es creado como un single subscription, es decir, solo hay un lugar donde se puede estar
        // escuchando el stream y como ya se tiene un stream escuchando en la pagina 1, en la debug console nos saldrá un error tipo:
        // Bad state: Stream has already been listened to.
        // Es necesario hacer un broadcast del streamController para que varios widgets puedan escuchar
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,

          // Para no perder el estado en la página 2, si ya se creo una instancia del singleton
          // es usada para agregarla al snapshot.data, de lo contrario sigue mostrando 'Page 2'
          initialData: ( usuarioService.existeUsuario ) ? usuarioService.usuario : null,

          builder: (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
            return snapshot.hasData
                ? Text( usuarioService.usuario.nombre )
                : Text( 'Page 2' );
          },
        ),
        
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
                usuarioService.cambiarEdad( x++ );
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