//Estado actual y procesa los eventos
import 'package:estados_singleton/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.usuario));
    });

    on<ResetUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if (!state.existeUsuario) return;
      emit(UserSetState(state.usuario!.copyWith(edad: event.age)));
    });
    on<AddProfession>((event, emit) {
      if (!state.existeUsuario) return;
      final professions = [...state.usuario!.profesiones, event.profession];

      emit(UserSetState(state.usuario!.copyWith(profesiones: professions)));
    });
  }
}
