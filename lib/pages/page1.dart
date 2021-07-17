import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:gestores_de_estado/controllers/usuario_controller.dart';
import 'package:gestores_de_estado/models/usuario.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Se inyecta la dependencia al contex manejado por getx para que a partir
    // de este widget se pueda obtener la misma instancia del UsuarioController donde se necesite
    final usuarioCtrl = Get.put( UsuarioController() );

    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),
      ),

      body: Obx( 
        () => usuarioCtrl.existeUsuario.value
              ? _InformacionUsuario( usuario: usuarioCtrl.usuario.value )
              : Center( child: Text('No hay usuario que mostrar') )
      ),

     floatingActionButton: FloatingActionButton(
      //  onPressed: () => Navigator.pushNamed(context, 'page2')

      // Navegación con GetX; se mandan argumentos a la page2
      onPressed: () => Get.toNamed( 'page2', arguments: {
        'nombre': 'Cristian',
        'edad': 26
      }),
    ),
   );
  }
}

class _InformacionUsuario extends StatelessWidget {

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
          ListTile( title: Text('Nombre: ${usuario.nombre}'), ),
          ListTile( title: Text('Edad: ${usuario.edad}'), ),
          Text('Profesiones', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),),
          Divider(),
          ...usuario.profesiones.map(
            (profesion) => ListTile(title: Text(profesion))
          ).toList(),
          Text('Text 3', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),)

        ]
      ),
    );
  }
}