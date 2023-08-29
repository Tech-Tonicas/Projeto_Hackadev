import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wave',
      theme: ThemeData(
        primaryColor: const Color(0xFF52E636),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF52E636),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    NewPageScreen('Categorias'),
    NewPageScreen('Carrinho'),
    WishlistScreen(),
    NewPageScreen('Minha Conta'),
  ];

  final List<String> categories = [
    'Categorias',
    'Carrinho',
    'Favoritos',
    'Minha Conta',
  ];

  final List<IconData> iconsBottom = [
    Icons.menu,
    Icons.shopping_basket,
    Icons.favorite,
    Icons.person,
  ];

  final Color selectedIconColor = Color(0xFF52E636);
  final Color unselectedIconColor = Colors.grey;
  final Color iconBackgroundColor = Colors.grey[200]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Wave'),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
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
              padding: const EdgeInsets.all(8),
              child: Icon(iconsBottom[index]),
            ),
            label: title,
          );
        }).toList(),
      ),
    );
  }
}

class NewPageScreen extends StatelessWidget {
  final String texto;

  NewPageScreen(this.texto);

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
