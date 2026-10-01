import 'item_checklist.dart';

class ChecklistPreventivo {
  List<ItemChecklist> itens = [];

  void adicionarItem(ItemChecklist item) {
    if (item.nome.isEmpty) {
      print("Erro: Item de checklist sem nome!");
      return;
    }
    itens.add(item);
  }

  void concluirItem(int indice) {
    if (indice < 0 || indice >= itens.length) {
      print("Erro: Item de checklist nao existe!");
      return;
    }
    itens[indice].concluido = true;
  }

  void mostrarPendentes() {
    print("Itens do checklist pendentes:");
    for (var item in itens) {
      if (!item.concluido) {
        print("- ${item.nome}");
      }
    }
  }
}
