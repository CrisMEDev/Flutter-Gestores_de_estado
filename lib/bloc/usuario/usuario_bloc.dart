
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:gestores_de_estado/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';


// El bloc nos brindara todos esos servicios donde se puede manipular la lógica relacionada al usuario
class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {

  // Constructor que recibe un estado inicial para el usuario y se lo manda al state
  UsuarioBloc() : super( UsuarioState() );
  
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    
    // print(event);

    // Si el evento recibido es tipo ActivarUsuario se emite un estado nuevo con el usuario recibido
    if ( event is ActivarUsuario ){
      // Se usa yield para emitir un estado
      yield UsuarioState( usuario: event.usuario );
    } else {
      yield UsuarioState();
    }

    
  }

  

}
