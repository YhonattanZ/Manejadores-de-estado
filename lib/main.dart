import 'package:estados_singleton/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados_singleton/pages/pagina2.dart';
import 'package:estados_singleton/pages/pagina1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuarioService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1(),
          'pagina2': (_) => const Pagina2()
        },
      ),
    );
  }
}
