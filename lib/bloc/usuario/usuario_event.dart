
part of 'usuario_bloc.dart';

// Esta clase es para que el bloc sepa que tipo de eventos va a manejar
// Los eventos son todas aquellas acciones que modifican el estado
@immutable
abstract class UsuarioEvent {}


class ActivarUsuario extends UsuarioEvent {

  final Usuario? usuario;

  ActivarUsuario( this.usuario );

}
