import 'package:flutter/material.dart';
import 'package:hackadev/TelaProdutosCategorias.dart';
import 'produtos.dart';

class CategoriasWidget extends StatelessWidget {
  const CategoriasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaProdutosCategoria(categoria: 'mouse'),
              ),
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.mouse,size: 25,color: Color(0xFF52E636),            
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TelaProdutosCategoria(categoria: 'monitor'),
              ),
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.monitor_sharp,size: 25,color: Color(0xFF52E636),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TelaProdutosCategoria(categoria: 'teclado'),
              ),
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.keyboard_alt_outlined,size: 25,color: Color(0xFF52E636),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaProdutosCategoria(categoria: 'fone'),
              ),
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.headphones_outlined,size: 25,color: Color(0xFF52E636),
              ),
            ],
          ),
        ),
      ],
    );
  }
}