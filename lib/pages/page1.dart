import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:gestores_de_estado/services/usuario_service.dart';
import 'package:gestores_de_estado/models/usuario.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Se usa la instancia de provider para saber si hay alguna data sobre el usuario para mostrar
    // por defecto la propiedad listen está en true para que este pendiente de los cambios que se le notifiquen
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),
      ),

      body: usuarioService.existeUsuario 
              ? _InformacionUsuario( usuario: usuarioService.usuario )
              : Center( child: Text('No hay usuario para mostrar'), ),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'page2')
    ),
   );
  }
}

class _InformacionUsuario extends StatelessWidget {

  // Se recibe el usaurio del provider
  final Usuario usuario;

  const _InformacionUsuario({
    Key? key,
    required this.usuario
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
          ListTile( title: Text('Nombre: ${ usuario.nombre }'), ),
          ListTile( title: Text('Edad: ${ usuario.edad }'), ),
          Text('Profesiones', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),),
          Divider(),
          ListTile( title: Text('Profesión: ${ usuario.profesiones?[0] }'), ),
          ListTile( title: Text('Profesión N'), ),
          ListTile( title: Text('Profesión N'), ),
          Text('Text 3', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),)

        ]
      ),
    );
  }
}