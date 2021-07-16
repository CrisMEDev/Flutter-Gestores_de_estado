import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestores_de_estado/bloc/usuario/usuario_bloc.dart';
import 'package:gestores_de_estado/models/usuario.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),

        actions: [
          IconButton(
            onPressed: (){
              final usuarioBloc = BlocProvider.of<UsuarioBloc>( context, listen: false );

              usuarioBloc.add( BorrarUsuario() );


            },
            icon: Icon( Icons.delete )
          )
        ],
      ),

      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          
          if ( state.existeUsuario ){
            return _InformacionUsuario( usuario: state.usuario );
          } else {
            return Center( child: Text('No hay usuario que mostrar') );
          }

        },
      ),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'page2')
    ),
   );
  }
}

class _InformacionUsuario extends StatelessWidget {

  final Usuario? usuario;

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
          ListTile( title: Text('Nombre:  ${usuario?.nombre}'), ),
          ListTile( title: Text('Edad: ${usuario?.edad}'), ),
          Text('Profesiones', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),),
          Divider(),

          ...usuario!.profesiones!.map(
            (profesion) => ListTile( title: Text( profesion ) )
          ).toList(),

          Text('Text 3', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),)

        ]
      ),
    );
  }
}