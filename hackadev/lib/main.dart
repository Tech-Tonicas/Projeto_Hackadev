import 'package:flutter/material.dart';
import 'package:hackadev/CategoriasWidget.dart';
import 'package:hackadev/telaListaProdutos.dart';
import 'MenuNavegacao.dart';
import 'package:hackadev/carrinho.dart';
import 'carrossel.dart';
import '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Carrinho carrinho = Carrinho(); // Crie uma instância de Carrinho

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tirar o "debug" da página
      title: "Digital Wave", // nome da loja
      theme: ThemeData.dark(), // tema da página
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80, // Definindo a altura do appbar
          elevation: 5,
          title: const Text(
            "Digital Wave",
            style: TextStyle(
              fontFamily: 'Grafiti',
              fontSize: 22,
              color: Color.fromARGB(255, 82, 230, 54),
            ),
          ), // Adicionando o nome, fonte, tamanho e cor
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0), // Adicione espaço à direita
              child: Container(
                width: 150, // Define a largura para a caixa de pesquisa
                alignment: Alignment
                    .center, // Alinha a pesquisa ao centro verticalmente

                child: const SizedBox(
                  height: 40, // Ajuste a altura desejada da barra de pesquisa
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Pesquisar", // texto de pesquisa
                      filled: true,
                      prefixIcon: Icon(Icons
                          .search), // Ícone de pesquisa à esquerda da caixa e dentro
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            CategoriasWidget(
                carrinho: carrinho), // Usando o widget de categorias
            const Carrossel(),
            TelaListaProdutos(
                carrinho: carrinho), // Passe o carrinho para TelaListaProdutos
            SizedBox(
              height: 71, // Defina a altura desejada
              child: MenuNavegacao(
                  carrinho: carrinho), // Passe o carrinho para MenuNavegacao
            ),
          ],
        ),
      ),
    );
  }
}
