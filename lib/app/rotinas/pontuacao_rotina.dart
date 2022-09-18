import 'package:marcador_truco/app/models/pontuacao_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PontuacaoRotina {
  static const String _pontuacaoNos = "pontuacaoNos";
  static const String _pontuacaoEles = "pontuacaoEles";

  Future<int>? pegaPontuacaoNos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_pontuacaoNos) ?? 0;
  }

  Future<int>? pegaPontuacaoEles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_pontuacaoEles) ?? 0;
  }

  Future<PontuacaoModel>? pegaPontuacao() async {
    final prefs = await SharedPreferences.getInstance();

    PontuacaoModel pontuacao = PontuacaoModel(
      prefs.getInt(_pontuacaoNos),
      prefs.getInt(_pontuacaoEles),
    );

    return pontuacao;
  }

  atualizarPontuacaoNos(int pontos) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_pontuacaoNos, pontos);
  }

  atualizarPontuacaoEles(int pontos) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_pontuacaoEles, pontos);
  }

  reiniciarPontuacao() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_pontuacaoNos, 0);
    prefs.setInt(_pontuacaoEles, 0);
  }
}
