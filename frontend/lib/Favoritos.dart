import 'package:hackadev/produtos.dart';

class Favoritos {
  final List<Produto> itens = [];

  void adicionarProduto(Produto produto) {
    itens.add(produto);
  }

  void removerProduto(Produto produto) {
    itens.remove(produto);
  }

  bool estaFavoritado(Produto produto) {
    return itens.contains(produto);
  }

  // Adicione o método toggleFavorito para alternar o favorito
  void toggleFavorito(Produto produto) {
    if (estaFavoritado(produto)) {
      removerProduto(produto);
    } else {
      adicionarProduto(produto);
    }
  }
}
