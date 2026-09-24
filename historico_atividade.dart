class HistoricoAtividade {
  List<String> registros = [];

  void adicionar(String mensagem) {
    registros.add(mensagem);
  }

  void mostrarHistorico() {
    print(" HISTÓRICO DE ATIVIDADES ");
    for (var registro in registros) {
      print(registro);
    }
  }
}