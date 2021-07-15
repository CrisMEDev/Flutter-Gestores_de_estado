import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestores_de_estado/bloc/usuario/usuario_cubit.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),
      ),

      // Se utiliza el cubit para decidir que información se debe mostrar dependiendo del estado del mismo cubit
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: ( _ , state ) {

          // print( state ); // Instance of 'UsuarioInitial'

          if ( state is UsuarioInitial )  return Center( child: Text('No hay usuario que mostrar'), );

          else return _InformacionUsuario();

        }),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'page2')
    ),
   );
  }
}

class _InformacionUsuario extends StatelessWidget {
  const _InformacionUsuario({
    Key? key,
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
          ListTile( title: Text('Nombre:'), ),
          ListTile( title: Text('Edad:'), ),
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