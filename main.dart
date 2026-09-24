import 'usuario.dart';
import 'problema.dart';
import 'rotina_preventiva.dart';
import 'tarefa.dart';
import 'item_checklist.dart';
import 'historico_atividade.dart';

void main() {
  HistoricoAtividade historico = HistoricoAtividade();

  print(" Passo 1: Cadastrar problema ");
  Problema problema = Problema("Atividade atrasada", "Internet lenta para enviar trabalhos");

  Usuario usuario = Usuario("Lívia", "raquell@email.com");

  print(" Passo 2: Criar e ativar rotina ");
    RotinaPreventiva rotina = RotinaPreventiva(
      "Tomar banho",
      "Organizar as coisas e lanchar",
      "06:00",
      "Segunda a Sexta",
      usuario,
      problema
    );
    rotina.ativar();

  print("Passo 3: Inserir 2 tarefas e 2 itens de checklist ");
  rotina.adicionarTarefa(Tarefa("Fazer atividade"));
  rotina.adicionarTarefa(Tarefa("Concluir trabalho"));

  rotina.checklist.adicionarItem(ItemChecklist("Beber um copo de água"));
  rotina.checklist.adicionarItem(ItemChecklist("Enviar trabalho para o professor"));

  print(" Passo 4: Concluir 1 item de checklist e 1 tarefa ");
  rotina.checklist.concluirItem(0);
  rotina.concluirTarefa(0, historico);

  print(" Passo 5: Exibir o que ainda está pendente ");
  rotina.mostrarTarefasPendentes();
  rotina.checklist.mostrarPendentes();

  print(" Passo 6: Voltar tarefa para pendente ");
  rotina.desmarcarTarefa(0, historico);

  print(" Passo 7: Desativar a rotina ");
  rotina.desativar();

  print(" Passo 8: Mostrar histórico gerado ");
  historico.mostrarHistorico();

  print(" Passo Bônus: Testar validação (tentar concluir tarefa que não existe) ");
  rotina.concluirTarefa(99, historico);
}