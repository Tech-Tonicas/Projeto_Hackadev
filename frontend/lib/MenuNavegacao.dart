import 'package:flutter/material.dart';
import 'package:hackadev/MenuPerfil.dart';
import 'package:hackadev/TelaFavoritos.dart';
import 'PaginaCarrinho.dart';
import 'carrinho.dart';
import 'main.dart';
import 'produtos.dart';
import 'TelaFavoritos.dart';
import 'Favoritos.dart';

class MenuNavegacao extends StatefulWidget {
  final Carrinho carrinho;
  final Favoritos favoritos;

  const MenuNavegacao(
      {Key? key, required this.carrinho, required this.favoritos,})
      : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  int _currentIndex = 0;

  List<Widget> get telas => [
        Pagina('Categorias'),
        PaginaCarrinho(
          carrinho: widget.carrinho,
          favoritos: widget.favoritos,
          appBar: true,
          footer: true,
        ),
        TelaFavoritos(carrinho: widget.carrinho, favoritos: widget.favoritos),
        MenuPerfil(),
      ];

  final List<String> categories = [
    'Home',
    'Categorias',
    'Carrinho',
    'Favoritos',
    'Meu Perfil',
  ];

  final List<IconData> iconsBottom = [
    Icons.home,
    Icons.menu,
    Icons.add_shopping_cart_outlined,
    Icons.favorite,
    Icons.account_circle,
  ];

  final Color selectedIconColor = Colors.black;
  final Color unselectedIconColor = Color(0xFF52E636);
  final Color iconBackgroundColor = const Color.fromARGB(255, 46, 44, 44);

  void _navigateToHome(BuildContext context) {
    //Definindo regra para passar por todas as rotas até chegar à primeira rota (tela inicial)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Determinar o número de itens a serem exibidos no BottomNavigationBar com base no tamanho da tela
    final numberOfItems = screenSize.width < 600 ? 5 : 5;

    return Scaffold(
      appBar: _currentIndex == 1 || _currentIndex == 3
          ? null
          : AppBar(elevation: 5),
      body: telas[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: unselectedIconColor,
        items: categories
            .asMap()
            .entries
            .where((entry) => entry.key < numberOfItems)
            .map((entry) {
          final index = entry.key;
          final title = entry.value;
          return BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                if (index == 0) {
                  _navigateToHome(context);
                }
                if (index == 2) {
                  // Navegar para a rota da PaginaCarrinho quando clicar no ícone do carrinho
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaginaCarrinho(
                        carrinho: widget.carrinho,
                        favoritos: widget.favoritos,
                        appBar: true,
                        footer: true,
                      ),
                    ),
                  );
                }
                if (index == 3) {
                // Navegar para a tela de favoritos quando clicar no ícone de favoritos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaFavoritos(
                      carrinho: widget.carrinho,
                      favoritos: widget.favoritos,
                    ),
                  ),
                );
              }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  iconsBottom[index],
                  color: index == 2 ? Color(0xFF52E636) : unselectedIconColor,
                ),
              ),
            ),
            label: title,
          );
        }).toList(),
      ),
    );
  }
}

class Pagina extends StatelessWidget {
  final String texto;

  Pagina(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}
