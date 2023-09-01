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
      title: "Digital Wave",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('logo/teste1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
