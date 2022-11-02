import 'package:estados_singleton/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  get profesionesCount {
    return usuario.value.profesiones?.length;
  }

  void cargarUsuario(Usuario pUsuario) {
    existeUsuario.value = true;
    usuario.value = pUsuario;
  }

  void cambiarEdad(int edad) {
    usuario.update((value) {
      value?.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((value) {
      value?.profesiones = [...?value.profesiones, profesion];
    });
  }
}
