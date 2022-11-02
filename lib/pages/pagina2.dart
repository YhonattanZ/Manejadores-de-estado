import 'package:estados_singleton/controllers/usuario_controller.dart';
import 'package:estados_singleton/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Pagina 2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('pagina1');
        },
        child: const Icon(
          Icons.keyboard_arrow_left_outlined,
          color: Colors.white,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              usuarioCtrl.cargarUsuario(Usuario(nombre: 'Yhonattan', edad: 22));
              Get.snackbar('Usuario establecido', 'Se ha registrado un usuario',
                  backgroundColor: Colors.pink[100]);
            },
            color: Colors.amber[200],
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              usuarioCtrl.cambiarEdad(55);
            },
            color: Colors.amber[200],
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              //   usuarioCtrl.agregarProfesion(
              //    'Profesion ${usuarioCtrl.usuario.value.profesiones?.length}');
              usuarioCtrl.agregarProfesion(
                  'Profesion ${usuarioCtrl.profesionesCount}');
            },
            color: Colors.amber[200],
            child: const Text(
              'Cambiar profesion',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            color: Colors.amber[200],
            child: const Text(
              'Cambiar tema',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
