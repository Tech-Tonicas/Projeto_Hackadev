import 'package:flutter/material.dart';
import 'package:hackadev/produtos.dart';

class TelaProdutosCategoria extends StatelessWidget {
  final String categoria;

  TelaProdutosCategoria({required this.categoria});

  @override
  Widget build(BuildContext context) {
    List<Produto> produtosFiltrados = ProdutosData.produtos
        .where((produto) => produto.categorias == categoria)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos - $categoria'),
      ),
      body: ListView.builder(
        itemCount: produtosFiltrados.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produtosFiltrados[index].nome),
            subtitle: Text(
                'R\$ ${produtosFiltrados[index].preco.toStringAsFixed(2)}'),
            leading: Image.asset(produtosFiltrados[index].urlImagem),
          );
        },
      ),
    );
  }
}