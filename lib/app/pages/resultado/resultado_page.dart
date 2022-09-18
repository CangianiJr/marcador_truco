import 'package:flutter/material.dart';
import 'package:marcador_truco/app/pages/components/layout_component.dart';
import 'package:marcador_truco/app/pages/marcador/marcador_page.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({Key? key, required this.vencedores}) : super(key: key);
  final String vencedores;

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      title: "Resultado",
      child: Column(
        children: [
          Text("Vencedores"),
          Text(vencedores),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MarcadorPage();
              }));
            },
            child: const Text("Reiniciar jogo"),
          ),
        ],
      ),
    );
  }
}
