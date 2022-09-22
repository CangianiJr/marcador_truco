import 'package:flutter/material.dart';
import 'package:marcador_truco/app/pages/marcador_page.dart';
import 'package:marcador_truco/app/rotinas/pontuacao_rotina.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({Key? key, required this.vencedores}) : super(key: key);
  final String vencedores;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text("gay"),
          Text(vencedores),
          TextButton(
            onPressed: () {
              PontuacaoRotina().reiniciarPontuacao();
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
