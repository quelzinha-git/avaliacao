import 'dart:io';

class Arquivo {
  String nomeArquivo;

  Arquivo(this.nomeArquivo);

 
  void salvarTexto(String conteudo) {
    File(nomeArquivo).writeAsStringSync(conteudo);
    print("Dados salvos com sucesso em '$nomeArquivo'!");
  }

 
  void lerTexto() {
    File arquivo = File(nomeArquivo);
    if (arquivo.existsSync()) {
      String conteudo = arquivo.readAsStringSync();
      print("Conteúdo do arquivo:\n$conteudo");
    } else {
      print("O arquivo '$nomeArquivo' não foi encontrado.");
    }
  }
}
