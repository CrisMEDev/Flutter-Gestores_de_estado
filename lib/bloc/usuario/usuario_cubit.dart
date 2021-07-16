
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gestores_de_estado/models/usuario.dart';

// Como los archivos usuario_cubit y usuario_state están directamente relacionados
// se puede usar dart para especificar que el usuario_state es parte de este cubit como sigue:
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {    // El cubit solo aceptará estados que extiendan de usaurio state

  // Cuando se instancie el cubit y ejecute el constructor, se le asinara el InitialState
  UsuarioCubit() : super( UsuarioInitial() );

  void seleccionarUsuario( Usuario user ){
    // Se emite un nuevo estado; emit es heredado del cubit
    emit( UsuarioActivo( user ) );
  }

  void cambiarEdad( int edad ){

    final currentState = state;

    if ( currentState is UsuarioActivo ){

      // Se usa el estado actual y el método que clona un usuario para actualizar la edad y devolver un nuevo estado
      final newUser = currentState.usuario.copyWith( edad: edad );

      emit( UsuarioActivo( newUser ) );
    }


  }

}
