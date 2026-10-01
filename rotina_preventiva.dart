import 'usuario.dart';
import 'problema.dart';
import 'tarefa.dart';
import 'checklist_preventivo.dart';
import 'historico_atividade.dart';
import 'alerta.dart';

class RotinaPreventiva {
  String titulo;
  String descricao;
  String horario;
  String diasDaSemana;
  bool ativa = false;

  Usuario usuario;
  Problema problema;
  List<Tarefa> tarefas = [];
  ChecklistPreventivo checklist = ChecklistPreventivo();

  RotinaPreventiva(this.titulo, this.descricao, this.horario, this.diasDaSemana, this.usuario, this.problema);

  void ativar() {
    ativa = true;
    print("Rotina ativada!");
  }

  void desativar() {
    ativa = false;
    print("Rotina desativada!");
  }

  void adicionarTarefa(Tarefa tarefa) {
    if (tarefa.titulo.isEmpty) return print("Erro: Tarefa sem titulo!");
    tarefas.add(tarefa);
  }

  void concluirTarefa(int indice, HistoricoAtividade historico) {
    if (indice < 0 || indice >= tarefas.length) {
      print("Erro: Tarefa nao existe!");
      Alerta("Tentativa de concluir tarefa inexistente!").exibir();
      return;
    }
    tarefas[indice].concluido = true;
    historico.adicionar("Tarefa '${tarefas[indice].titulo}' foi concluida.");
  }






  void desmarcarTarefa(int indice, HistoricoAtividade historico) {
    if (indice < 0 || indice >= tarefas.length) return print("Erro: Tarefa nao existe!");
    
    tarefas[indice].concluido = false;
    historico.adicionar("Tarefa '${tarefas[indice].titulo}' voltou para pendente.");
  }

  void mostrarTarefasPendentes() {
    print("Tarefas pendentes:");
    for (var tarefa in tarefas) {
      if (!tarefa.concluido) print("- ${tarefa.titulo}");
    }
  }
}
