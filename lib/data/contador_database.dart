class ContadorDatabase {
  Future<void> abrirBanco() async {
    //... Abrir o banco
  }

  Future<void> fecharBanco() async {
    //... Fecha o banco
  }

  Future<void> salvar(int valor) async {
    //... Salva `valor` no banco
    throw UnimplementedError();
  }

  Future<int> ler() async {
    //... Recupera `valor` no banco
    throw UnimplementedError();
  }

  Future<int> remover() async {
    //... Remove valor do banco
    throw UnimplementedError();
  }
}
