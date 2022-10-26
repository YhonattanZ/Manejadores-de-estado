import 'package:estados_singleton/models/usuario.dart';
import 'package:estados_singleton/services/usuario_services.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        title: const Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStreamController,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? InfoUsuario(snapshot.data)
              : Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.purple[200],
                  ),
                );
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
  final Usuario? usuario;

  const InfoUsuario(this.usuario);

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
              title: Text('Nombre:  ' '${usuario?.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario?.edad}'),
            ),
            const Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            const ListTile(
              title: Text('Profesion actual: '),
            ),
            const ListTile(
              title: Text('Profesion anterior: '),
            ),
          ]),
    );
  }
}
