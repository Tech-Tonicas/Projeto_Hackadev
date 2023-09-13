import 'package:flutter/material.dart';
import 'package:hackadev/CategoriasWidget.dart';
import 'package:hackadev/telaListaProdutos.dart';
import 'MenuNavegacao.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false, // tirar o "debug" da página
      title: "Digital Wave", // nome da loja
      theme: ThemeData.dark(), // tema da página
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, // Definindo a altura do appbar
          backgroundColor: Color.fromARGB(255, 0, 0, 0), // Defina a cor de fundo desejada
          elevation: 5,
          title:const Text("Digital Wave", style: TextStyle(fontFamily: 'Grafiti', fontSize: 22,color:Color.fromARGB(255, 121, 214, 124))), // Adicionando o nome, fonte, tamanho e cor
          actions: [
             Padding(
    padding: const EdgeInsets.only(right: 16.0), // Adicione espaço à direita
    child: Container(
      width: 200, // Define a largura para a caixa de pesquisa
      alignment: Alignment.center, // Alinha a pesquisa ao centro verticalmente
      child: TextField(
        decoration: InputDecoration(
          hintText: "Pesquisar", // texto de pesquisa
          filled: true,
          fillColor: Color.fromARGB(255, 0, 0, 0), // Cor de fundo da caixa de pesquisa
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white), // Cor da borda branca,
          ),
          prefixIcon: Icon(Icons.search), // Ícone de pesquisa à esquerda da caixa e dentro
        ),
      ),
    ),
  ),
          ],
        ),
        body: const Column(
          children: [
            CategoriasWidget(), //Usando o widget de categorias
            TelaListaProdutos(), //Usando a classe TelaListaProdutos
             SizedBox(
                height: 91, // Defina a altura desejada
                child: MenuNavegacao(),
              ),
          ],
        ),
      ),
    );
  }
}
