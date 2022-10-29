import 'package:estados_singleton/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_singleton/bloc/user/user_bloc.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersBloc = BlocProvider.of<UserBloc>(context);
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
                  profesiones: ['FullStack Developer']);

              UsersBloc.add(ActivateUser(newUser));
            },
            color: Colors.amber[200],
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              UsersBloc.add(ChangeUserAge(40));
            },
            color: Colors.amber[200],
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              UsersBloc.add(AddProfession('Bartender'));
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
