import 'package:estados_singleton/bloc/user/user_bloc.dart';
import 'package:estados_singleton/pages/pagina1.dart';
import 'package:estados_singleton/pages/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
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
