import 'package:flutter/material.dart';
import 'PaginaCarrinho.dart';
import 'carrinho.dart';
import 'MenuPerfil.dart';

class MenuNavegacao extends StatefulWidget {
  final Carrinho carrinho;

  const MenuNavegacao({Key? key, required this.carrinho}) : super(key: key);

  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> {
  int _currentIndex = 0;

  List<Widget> get telas => [
        Pagina('Categorias'),
        PaginaCarrinho(carrinho: widget.carrinho),
        WishlistScreen(),
        MenuPerfil(),
      ];

  final List<String> categories = [
    'Categorias',
    'Carrinho',
    'Favoritos',
    'Meu Perfil',
  ];

  final List<IconData> iconsBottom = [
    Icons.menu,
    Icons.add_shopping_cart_outlined,
    Icons.favorite,
    Icons.account_circle,
  ];

  final Color selectedIconColor = Colors.black;
  final Color unselectedIconColor = Color(0xFF52E636);
  final Color iconBackgroundColor = const Color.fromARGB(255, 46, 44, 44);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Determinar o número de itens a serem exibidos no BottomNavigationBar com base no tamanho da tela
    final numberOfItems = screenSize.width < 600 ? 2 : 4;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
      ),
      body: telas[_currentIndex],
      bottomNavigationBar: SingleChildScrollView(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColorLight,
          unselectedItemColor: unselectedIconColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: categories
              .asMap()
              .entries
              .where((entry) =>
                  entry.key <
                  numberOfItems) // Limitar o número de itens exibidos
              .map((entry) {
            final index = entry.key;
            final title = entry.value;
            return BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  if (index == 1) {
                    // Navegar para a rota da PaginaCarrinho quando clicar no ícone do carrinho
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PaginaCarrinho(carrinho: widget.carrinho),
                      ),
                    );
                  }
                  if (index == 3) {
                    // Navegar para a tela MenuPerfil quando clicar em "Meu Perfil"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuPerfil(),
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

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favoritos'),
    );
  }
}
