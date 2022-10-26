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
      body: const InfoUsuario(),
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
  const InfoUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Divider(),
            ListTile(
              title: Text('Nombre: '),
            ),
            ListTile(
              title: Text('Edad: '),
            ),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Divider(),
            ListTile(
              title: Text('Profesion actual: '),
            ),
            ListTile(
              title: Text('Profesion anterior: '),
            ),
          ]),
    );
  }
}
