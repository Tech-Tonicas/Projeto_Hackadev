import 'package:hackadev/model/produtos.dart';

class Carrinho {
  final Map<Produto, int> itens = {};

  void adicionarProduto(Produto produto) {
    if (itens.containsKey(produto)) {
      itens[produto] = itens[produto]! + 1;
    } else {
      itens[produto] = 1;
    }
  }

  void limparCarrinho() {
    itens.clear(); // Limpa os itens do carrinho
  }

  void removerProduto(Produto produto) {
    if (itens.containsKey(produto)) {
      if (itens[produto]! > 1) {
        itens[produto] = itens[produto]! - 1;
      } else {
        itens.remove(produto);
      }
    }
  }

  int get quantidadeTotal {
    int quantidade = 0;
    for (var valor in itens.values) {
      quantidade += valor;
    }
    return quantidade;
  }

  double get valorTotal {
    double total = 0.0;
    for (var entry in itens.entries) {
      total += entry.key.preco * entry.value;
    }
    return total;
  }

  String get valorTotalFormatado {
    return 'R\$ ${valorTotal.toStringAsFixed(2)}';
  }
}
