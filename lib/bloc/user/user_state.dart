//Estado actual de la app, login etc...
part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existeUsuario;
  final Usuario? usuario;

  const UserState({this.existeUsuario = false, this.usuario});
}

//Estado inicial
class UserInitialState extends UserState {
  const UserInitialState() : super(existeUsuario: false, usuario: null);
}

//Crear estado
class UserSetState extends UserState {
  final Usuario newUser;

  const UserSetState(this.newUser)
      : super(existeUsuario: true, usuario: newUser);
}
