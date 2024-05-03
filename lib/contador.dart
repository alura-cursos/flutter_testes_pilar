import 'data/contador_database.dart';

class Contador {
  int valor = 0;

  void incrementar() {
    valor = valor + 1;
  }

  void decrementar() {
    valor = valor - 1;
  }

  List<int> multiplicarValor(List<int> listaParaMultiplicar) {
    if (listaParaMultiplicar.isEmpty) throw ListaVaziaException();

    for (int numero in listaParaMultiplicar) {
      numero = numero * valor;
    }
    return listaParaMultiplicar;
  }

  String? adicionarDoTeclado(String novoValor) {
    double? valorDouble = double.tryParse(novoValor);

    if (valorDouble != null) {
      valor = valorDouble.floor();
      return null;
    }

    return "Valor não numérico.";
  }

  lerDoBanco(ContadorDatabase db) async {
    int dbValor = await db.ler();
    valor = dbValor;
  }

  salvarNoBanco(ContadorDatabase db) async {
    db.salvar(valor);
  }
}

class ListaVaziaException implements Exception {
  @override
  String toString() {
    return "ListaVaziaException\nA lista não pode ser vazia";
  }
}
