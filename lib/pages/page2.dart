import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestores_de_estado/bloc/usuario/usuario_cubit.dart';
import 'package:gestores_de_estado/models/usuario.dart';


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

                final newUser = Usuario(
                  nombre: 'Cristian',
                  edad: 26,
                  profesiones: [
                    'Software Engineer',
                    'Fullstack developer'
                  ]
                );

                final usuarioCubit = BlocProvider.of<UsuarioCubit>( context, listen: false );
                usuarioCubit.seleccionarUsuario( newUser );

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