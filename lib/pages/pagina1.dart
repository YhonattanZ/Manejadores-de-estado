import 'package:estados_singleton/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_singleton/bloc/user/user_bloc.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(ResetUser());
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        title: const Text('Pagina 1'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existeUsuario
              ? InfoUsuario(
                  usuario: state.usuario!,
                )
              : const Center(child: Text('No hay usuario seleccionado'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'pagina2');
        },
        child: const Icon(
          Icons.navigate_next_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class InfoUsuario extends StatelessWidget {
  final Usuario usuario;

  const InfoUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

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
            ...usuario.profesiones.map((prof) => ListTile(
                  title: Text(prof),
                ))
          ]),
    );
  }
}
