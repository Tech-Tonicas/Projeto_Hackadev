import 'package:flutter/material.dart';

class MenuNavegacao extends StatefulWidget {
  const MenuNavegacao({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}
// percorre o índice
class _MenuNavegacaoState extends State<MenuNavegacao> {
  int _currentIndex = 0;

  final List<String> categories = [
    'Categorias',
    'Carrinho',
    'Favoritos',
    'Minha Conta',
  ];
//Ícones do menu navegação//

  final List<IconData> iconsBottom = [
    Icons.menu,
    Icons.add_shopping_cart_outlined,
    Icons.favorite,
    Icons.person,
  ];
//esquema de cores que envolve os ícons//
  final Color selectedIconColor = Colors.black;
  final Color unselectedIconColor = Color(0xFF52E636);
  final Color iconBackgroundColor = const Color.fromARGB(255, 46, 44, 44);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColorLight,
          unselectedItemColor: unselectedIconColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: categories.asMap().entries.map((entry) {
            final index = entry.key;
            final title = entry.value;

            return BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  iconsBottom[index],
                  color: index == 2
                      ? Color.fromARGB(255, 230, 66, 66)
                      : unselectedIconColor,
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
