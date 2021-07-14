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
      body: usuarioService.existeUsuario
        ? _InformacionUsuario( usuario: usuarioService.usuario, ) // Manda los valores colocados desde la pagina 2
        : Center( child: Text('No hay información del usuario'), ),

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