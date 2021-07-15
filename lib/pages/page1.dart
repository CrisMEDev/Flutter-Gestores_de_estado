import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestores_de_estado/bloc/usuario/usuario_cubit.dart';
import 'package:gestores_de_estado/models/usuario.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),
      ),

      // Se utiliza el cubit para decidir que información se debe mostrar dependiendo del estado del mismo cubit
      body: _BodyScaffold(),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'page2')
    ),
   );
  }
}

class _BodyScaffold extends StatelessWidget {
  const _BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state ) {

        // print( state ); // Instance of 'UsuarioInitial'

        if ( state is UsuarioInitial )  return Center( child: Text('No hay usuario que mostrar'), );

        else if ( state is UsuarioActivo ){
           return _InformacionUsuario( usuario: state.usuario );
        }

        else return Center( child: Text('Estado no reconocido') );



        // Se puede usar un swith también
        // switch ( state.runtimeType ) {
        //   case UsuarioInitial:
        //     return Center( child: Text('No hay usuario que mostrar'), );
        //     break;
        //   case UsuarioActivo:
        //     return _InformacionUsuario( usuario: (state as UsuarioActivo).usuario );
        //     break;
        //   default:
        //    return Center( child: Text('Estado no reconocido') );
        // }


      });
  }
}

class _InformacionUsuario extends StatelessWidget {

  final Usuario? usuario;

  const _InformacionUsuario({
    Key? key,
    this.usuario
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
          ListTile( title: Text('Nombre: ${usuario?.nombre}'), ),
          ListTile( title: Text('Edad: ${usuario?.edad} '), ),
          Text('Profesiones', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),),
          Divider(),
          
          ...usuario!.profesiones!.map(
            ( profesion ) => ListTile( title: Text(profesion), )
          ).toList(),

          Text('Text 3', style: TextStyle( fontWeight: FontWeight.w500, fontSize: screenSize.width * 0.05 ),)

        ]
      ),
    );
  }
}