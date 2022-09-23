import 'package:flutter/material.dart';
import 'package:marcador_truco/app/constants/times_constants.dart';
import 'package:marcador_truco/app/icons/marcador_truco_icons_icons.dart';
import 'package:marcador_truco/app/pages/resultado_page.dart';

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
    } else {
      if (_pontuacaoEles == 0) {
        return;
      }
      setState(() {
        _pontuacaoEles -= 1;
      });
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
                    child: const Text(
                      "Não",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _pontuacaoEles = 0;
                        _pontuacaoNos = 0;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sim",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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
        leadingWidth: 85,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: 5),
            Icon(
              MarcadorTrucoIcons.clovers,
              size: 20,
            ),
            Icon(
              MarcadorTrucoIcons.hearts,
              size: 20,
              color: Colors.red,
            ),
            Icon(
              MarcadorTrucoIcons.spades,
              size: 20,
            ),
            Icon(
              MarcadorTrucoIcons.diamonds,
              color: Colors.red,
              size: 20,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _reiniciarJogo();
            },
            icon: const Icon(Icons.replay),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey])),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 25, 12, 12),
          child: Row(
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
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          _diminuirPontuacao(TimesConstants.nos);
                        },
                        child: const Icon(
                          MarcadorTrucoIcons.minus,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            _aumentarPontuacao(TimesConstants.nos, 1);
                          },
                          child: const Icon(
                            MarcadorTrucoIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 120,
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        _aumentarPontuacao(TimesConstants.nos, 3);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            MarcadorTrucoIcons.plus,
                            color: Colors.white,
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          _diminuirPontuacao(TimesConstants.eles);
                        },
                        child: const Icon(
                          MarcadorTrucoIcons.minus,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            _aumentarPontuacao(TimesConstants.eles, 1);
                          },
                          child: const Icon(
                            MarcadorTrucoIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 35,
                    width: 120,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        _aumentarPontuacao(TimesConstants.eles, 3);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            MarcadorTrucoIcons.plus,
                            color: Colors.white,
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
