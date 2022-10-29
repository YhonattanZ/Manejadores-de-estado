//Acciones que recibe el bloc para cambiar el state
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

//Activar usuario
class ActivateUser extends UserEvent {
  final Usuario usuario;
  ActivateUser(this.usuario);
}

//Cambiar edad del usuario loggeado
class ChangeUserAge extends UserEvent {
  final int age;
  ChangeUserAge(this.age);
}

class AddProfession extends UserEvent {
  final String profession;

  AddProfession(this.profession);
}

class ResetUser extends UserEvent {}
