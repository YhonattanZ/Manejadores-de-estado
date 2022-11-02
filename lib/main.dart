import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados_singleton/pages/pagina1.dart';
import 'package:estados_singleton/pages/pagina2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      getPages: [
        GetPage(name: '/pagina2', page: (() => const Pagina2())),
        GetPage(name: '/pagina1', page: (() => const Pagina1()))
      ],
    );
  }
}
