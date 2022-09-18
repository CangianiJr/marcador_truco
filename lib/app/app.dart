import 'package:flutter/material.dart';
import 'package:marcador_truco/app/pages/marcador/marcador_page.dart';

class MarcadorTrucoApp extends StatelessWidget {
  const MarcadorTrucoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador truco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MarcadorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
