import 'dart:async';

import 'package:estados_singleton/models/usuario.dart';
import 'package:rxdart/rxdart.dart';

class _UsuarioService {
  Usuario? _usuario;

  final StreamController<Usuario> _usuarioStream = BehaviorSubject();

  Stream<Usuario> get usuarioStreamController => _usuarioStream.stream;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStream.sink.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
    _usuarioStream.sink.add(_usuario!);
  }

  @override
  void dispose() {
    _usuarioStream.close();
  }
}

final usuarioService = _UsuarioService();
