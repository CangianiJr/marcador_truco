import 'package:flutter/material.dart';
import 'package:marcador_truco/app/pages/marcador_page.dart';

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
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Column(children: [
                  const Text(
                    "Vencedor",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    vencedores,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/Trofeu.png", height: 400),
                ]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  PontuacaoRotina().reiniciarPontuacao();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MarcadorPage();
                  }));
                },
                child: const Text(
                  "Reiniciar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
