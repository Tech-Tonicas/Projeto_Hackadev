import 'package:flutter/material.dart';
import 'package:hackadev/CategoriasWidget.dart';
import 'package:hackadev/telaListaProdutos.dart';
import 'MenuNavegacao.dart';
import 'package:hackadev/carrinho.dart';
import 'carrossel.dart';
import 'Favoritos.dart';
import 'package:hackadev/telaListaProdutos.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 5,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Grafiti',
          fontSize: 22,
          color: Color.fromARGB(255, 82, 230, 54),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 150,
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Pesquisar",
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class Footer extends StatelessWidget {
  final Carrinho carrinho;
  final Favoritos favoritos; 

  Footer({required this.carrinho, required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 71,
      child: MenuNavegacao(carrinho: carrinho, favoritos: favoritos),
    );
  }
}

class MyApp extends StatelessWidget {
  final Carrinho carrinho = Carrinho();
  final Favoritos favoritos = Favoritos();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Digital Wave",
      theme: ThemeData.dark(),
      home: MainLayout(carrinho: carrinho, favoritos: favoritos),
    );
  }
}

class MainLayout extends StatelessWidget {
  final Carrinho carrinho;
  final Favoritos favoritos;

  MainLayout({required this.carrinho, required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Digital Wave",
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) =>
                  HomeScreen(carrinho: carrinho, favoritos: favoritos),
            );
          } else if (settings.name == '/outra_rota') {
            return MaterialPageRoute(
              builder: (context) => OutraRota(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: Footer(carrinho: carrinho, favoritos: favoritos),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Carrinho carrinho;
  final Favoritos favoritos;

  HomeScreen({required this.carrinho, required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoriasWidget(carrinho: carrinho),
          const Carrossel(),
          TelaListaProdutos(carrinho: carrinho, favoritos: favoritos),
        ],
      ),
    );
  }
}

class OutraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Rota definida"),
    );
  }
}

void main() {
  runApp(MyApp());
}
