import 'package:estados_singleton/controllers/usuario_controller.dart';
import 'package:estados_singleton/models/usuario.dart';
import 'package:estados_singleton/pages/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        title: const Text('Pagina 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ? InfoUsuario(usuario: usuarioCtrl.usuario.value)
          : const NoInfo()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        onPressed: () {
          Get.to(() => const Pagina2());
        },
        child: const Icon(
          Icons.navigate_next_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('No hay usuario seeccionado')),
    );
  }
}

class InfoUsuario extends StatelessWidget {
  final Usuario usuario;

  const InfoUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            ListTile(
              title: Text('Nombre: ${usuario.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario.edad}'),
            ),
            const Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            ...?usuario.profesiones
                ?.map((value) => ListTile(title: Text(value)))
          ]),
    );
  }
}
