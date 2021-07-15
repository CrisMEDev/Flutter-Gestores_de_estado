

// Como los archivos usuario_cubit y usuario_state están directamente relacionados
// se puede usar dart para especificar que el usuario_state es parte de usuario_cubit como sigue:
part of 'usuario_cubit.dart';

// Con esta clase abstracta, solo se le podrán mandar al cubit estados que extiendan de la clase UsuarioState
@immutable
abstract class UsuarioState {}


// Estado inicial del usuario
class UsuarioInitial extends UsuarioState {

  final existeUsuario = false;

}

