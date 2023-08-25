import 'package:flutter/material.dart';
import 'package:hackadev/pages/detalhes-produto.dart';
import 'package:hackadev/produtos_data.dart';
import 'categorias_widget.dart';


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
        appBar: AppBar(),
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