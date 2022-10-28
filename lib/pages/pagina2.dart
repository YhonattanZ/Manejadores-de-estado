import 'package:estados_singleton/models/usuario.dart';
import 'package:estados_singleton/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber[400],
        centerTitle: true,
        title: const Text('Pagina 2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'pagina1');
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
              final newUser = Usuario(
                  nombre: 'Yhonattan',
                  edad: 22,
                  profesiones: ['Frontend Developer', 'Gamer Experto']);
              usuarioService.usuario = newUser;
            },
            color: Colors.amber[200],
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              usuarioService.cambiarEdad(26);
            },
            color: Colors.amber[200],
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              usuarioService.agregarProfesion();
            },
            color: Colors.amber[200],
            child: const Text(
              'Cambiar profesion',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }
}
