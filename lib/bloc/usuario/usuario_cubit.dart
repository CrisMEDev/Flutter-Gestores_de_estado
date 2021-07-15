
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// Como los archivos usuario_cubit y usuario_state están directamente relacionados
// se puede usar dart para especificar que el usuario_state es parte de este cubit como sigue:
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {    // El cubit solo aceptará estados que extiendan de usaurio state

  // Cuando se instancie el cubit y ejecute el constructor, se le asinara el InitialState
  UsuarioCubit() : super( UsuarioInitial() );

}
