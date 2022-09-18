import 'package:flutter/material.dart';
import 'package:marcador_truco/app/constants/times_constants.dart';
import 'package:marcador_truco/app/pages/resultado_page.dart';
import 'package:marcador_truco/app/rotinas/pontuacao_rotina.dart';

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({Key? key}) : super(key: key);

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int _pontuacaoNos = 0;
  int _pontuacaoEles = 0;

  void _aumentarPontuacao(String time, int pontos) {
    if (time == TimesConstants.nos) {
      setState(() {
        _pontuacaoNos += pontos;
        if (_pontuacaoNos > 12) _pontuacaoNos = 12;
      });

      PontuacaoRotina().atualizarPontuacaoNos(_pontuacaoNos);

      if (_pontuacaoNos >= 12) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ResultadoPage(vencedores: TimesConstants.nos);
        }));
      }
    } else {
      setState(() {
        _pontuacaoEles += pontos;
        if (_pontuacaoEles > 12) _pontuacaoEles = 12;
      });

      PontuacaoRotina().atualizarPontuacaoEles(_pontuacaoEles);

      if (_pontuacaoEles >= 12) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ResultadoPage(vencedores: TimesConstants.eles);
        }));
      }
    }
  }

  _diminuirPontuacao(String time) {
    if (time == TimesConstants.nos) {
      if (_pontuacaoNos == 0) {
        return;
      }
      setState(() {
        _pontuacaoNos -= 1;
      });
      PontuacaoRotina().atualizarPontuacaoNos(_pontuacaoNos);
    } else {
      if (_pontuacaoEles == 0) {
        return;
      }
      setState(() {
        _pontuacaoEles -= 1;
      });
      PontuacaoRotina().atualizarPontuacaoEles(_pontuacaoEles);
    }
  }

  void _reiniciarJogo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Reiniciar jogo", textAlign: TextAlign.center),
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Tem certeza que deseja reiniciar o jogo?",
                  textAlign: TextAlign.center,
                ),
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
                        _pontuacaoEles = 0;
                        _pontuacaoNos = 0;
                      });
                      PontuacaoRotina().reiniciarPontuacao();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marcador de truco"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _reiniciarJogo();
            },
            icon: const Icon(Icons.replay),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
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
                      _pontuacaoNos.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _diminuirPontuacao(TimesConstants.nos);
                          },
                          icon: const Text("-"),
                        ),
                        Column(
                          children: [
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
                      ],
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
                      _pontuacaoEles.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
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
                        IconButton(
                          onPressed: () {
                            _diminuirPontuacao(TimesConstants.eles);
                          },
                          icon: const Text("-"),
                        ),
                      ],
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
