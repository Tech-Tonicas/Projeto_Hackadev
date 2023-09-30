import 'package:flutter/material.dart';
import 'package:hackadev/TelaProdutosCategorias.dart';
import 'package:google_fonts/google_fonts.dart';
import 'carrinho.dart';

class CategoriasWidget extends StatelessWidget {
  final Carrinho carrinho; // Adicione o parâmetro carrinho

  CategoriasWidget({required this.carrinho, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaProdutosCategoria(
                    categoria: 'Mouse',
                    carrinho:
                        carrinho, // Passe o carrinho para TelaProdutosCategoria
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Text(
                  "Mouse",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF52E636),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaProdutosCategoria(
                    categoria: 'Monitor',
                    carrinho:
                        carrinho, // Passe o carrinho para TelaProdutosCategoria
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Text(
                  "Monitor",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF52E636),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaProdutosCategoria(
                    categoria: 'Teclado',
                    carrinho:
                        carrinho, // Passe o carrinho para TelaProdutosCategoria
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Text(
                  "Teclado",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF52E636),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaProdutosCategoria(
                    categoria: 'Fone',
                    carrinho:
                        carrinho, // Passe o carrinho para TelaProdutosCategoria
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Text(
                  "Fone",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF52E636),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
