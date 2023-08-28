import 'package:flutter/material.dart';
import 'package:hackadev/CategoriasWidget.dart';
//import 'package:hackadev/pages/detalhes-produto.dart';
//import 'package:hackadev/produtos_data.dart';
import 'package:hackadev/telaListaProdutos.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loja Virtual",
      theme: ThemeData.dark(),
      color: const Color(0xFF2B2B2B),
      home: Scaffold(
        appbar: AppBar(
          elevation: 5,
          toolbarHeigtht: 150,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagens/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: const Column(
          children: [
            CategoriasWidget(), // Usando o widget de categorias
            TelaListaProdutos(), // Usando a classe TelaListaProdutos
          ],
        ),
      ),
    );
  }
}