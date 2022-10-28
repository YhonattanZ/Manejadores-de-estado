import 'package:estados_singleton/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_singleton/bloc/usuarios/usuario_cubit.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
            icon: const Icon(Icons.cancel_outlined),
            color: Colors.white,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        title: const Text('Pagina 1'),
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
        print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(
                child: Text('No hay informacion todavia del usuario'));

          case UsuarioActivo:
            return InfoUsuario((state as UsuarioActivo).usuario);

          default:
            return const Center(child: CircularProgressIndicator.adaptive());
        }

        /*if (state is UsuarioInitial) {
          return const Center(
              child: Text('No hay informacion todavia del usuario'));
        } else if (state is UsuarioActivo) {
          return InfoUsuario(state.usuario);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }*/
      }),
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
  Usuario usuario;

  InfoUsuario(this.usuario);

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
                ?.map((profesion) => ListTile(title: Text(profesion)))
                .toList()
          ]),
    );
  }
}
