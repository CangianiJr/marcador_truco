import 'package:flutter/material.dart';
import 'package:marcador_truco/app/constants/times_constants.dart';
import 'package:marcador_truco/app/pages/components/layout_component.dart';
import 'package:marcador_truco/app/pages/resultado/resultado_page.dart';

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({Key? key}) : super(key: key);

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int pontuacaoNos = 0;
  int pontuacaoEles = 0;

  void _aumentarPontuacao(String time, int pontos) {
    if (time == TimesConstants.nos) {
      setState(() {
        pontuacaoNos += pontos;
      });
    } else {
      setState(() {
        pontuacaoEles += pontos;
      });
    }
    if (pontuacaoNos >= 12) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ResultadoPage(vencedores: TimesConstants.nos);
      }));
    } else if (pontuacaoEles >= 12) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ResultadoPage(vencedores: TimesConstants.eles);
      }));
    }
  }

  void _reiniarJogo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Reiniciar jogo", textAlign: TextAlign.center),
            children: [
              const Text(
                "Tem certeza que deseja reiniciar o jogo?",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Não"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        pontuacaoEles = 0;
                        pontuacaoNos = 0;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Sim"),
                  ),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      title: "Marcador de truco",
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    _reiniarJogo();
                  },
                  icon: const Icon(Icons.replay_circle_filled_outlined),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      "Nós",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      pontuacaoNos.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _aumentarPontuacao(TimesConstants.nos, 1);
                      },
                      icon: const Text("+1"),
                    ),
                    IconButton(
                      onPressed: () {
                        _aumentarPontuacao(TimesConstants.nos, 3);
                      },
                      icon: const Text("+3"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Eles",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      pontuacaoEles.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _aumentarPontuacao(TimesConstants.eles, 1);
                      },
                      icon: const Text("+1"),
                    ),
                    IconButton(
                      onPressed: () {
                        _aumentarPontuacao(TimesConstants.eles, 3);
                      },
                      icon: const Text("+3"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
