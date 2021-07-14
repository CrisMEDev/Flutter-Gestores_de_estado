import 'package:flutter/material.dart';
import 'package:gestores_de_estado/models/usuario.dart';

import 'package:gestores_de_estado/services/usuario_service.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),
      ),

      // Se utiliza el singleton para mostrar un widget si es que existe información
      // El stream builder se estará redibujando cada que haya un cambio en el stream
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        
        builder: (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
          
          return snapshot.hasData
              ? _InformacionUsuario(usuario: usuarioService.usuario)    // Tambien se puede usar snapshot.data ya que contiene la ultima
                                                                        // información emitida por stream y es la misma que se le establece
                                                                        // a el singleton
              : Center( child: Text( 'No hay información del usaurio' ) );

        },
      ),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'page2')
    ),
   );
  }
}

class _InformacionUsuario extends StatelessWidget {

  final Usuario usuario;  // Se recibe el usuario del usuarioService que se establece en la pagina 2

  const _InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,

      padding: EdgeInsets.all(30.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),),
          Divider(),
          ListTile( title: Text('Nombre: ${usuario.nombre}'), ),
          ListTile( title: Text('Edad: ${usuario.edad}'), ),
          Text('Profesiones', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),),
          Divider(),
          ListTile( title: Text('Profesión N'), ),
          ListTile( title: Text('Profesión N'), ),
          ListTile( title: Text('Profesión N'), ),
          Text('Text 3', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),)

        ]
      ),
    );
  }
}