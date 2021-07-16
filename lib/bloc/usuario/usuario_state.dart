
part of 'usuario_bloc.dart';

// El state es la forma en la que se encuentra la data de mi bloc a lo largo de la aplicación
class UsuarioState {

  // Se usa final para crear un estado inmutable una vez se cree una instancia de este estado
  final bool existeUsuario;
  final Usuario? usuario;

  UsuarioState({
    Usuario? usuario,

  }) : this.usuario = usuario ?? null,
       existeUsuario = ( usuario != null ) ? true : false;

  UsuarioState copyWith({ Usuario? usuario  }) => UsuarioState(
    usuario: usuario ?? this.usuario
  );

  UsuarioState estadoInicial() => new UsuarioState();

}
