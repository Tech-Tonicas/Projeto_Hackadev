
import 'package:flutter/material.dart';
import 'package:hackadev/TelaProdutosCategorias.dart';
import 'produtos.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriasWidget extends StatelessWidget {
  const CategoriasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 50,padding: EdgeInsetsDirectional.all(10), 
      child:Row(   //linha contendo os botões
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaProdutosCategoria(categoria: 'Mouse'), //Rota que puxa a categoria mouse
              ),
            );
          },
          child: Column(
            children: [
              Text("Mouse", style: GoogleFonts.openSans(color: Color(0xFF52E636),fontSize: 16) // botão de texto da categoria mouse 
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
                    TelaProdutosCategoria(categoria: 'Monitor'),  //Rota que puxa a categoria Monitor
              ),
            );
          },
          child: Column(
            children: [
              Text("Monitor", style: GoogleFonts.openSans(color: Color(0xFF52E636), fontSize:16 ) // botão de texto da categoria Monitor
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
                    TelaProdutosCategoria(categoria: 'Teclado'), //Rota que puxa a categoria Teclado
              ),
            );
          },
          child: Column(
            children: [
              Text("Teclado", style: GoogleFonts.openSans(color: Color(0xFF52E636),fontSize: 16) // botão de texto da categoria Teclado
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaProdutosCategoria(categoria: 'Fone'), //Rota que puxa a categoria Fone
              ),
            );
          },
          child: Column(
            children: [
              Text("Fone", style: GoogleFonts.openSans(color: Color(0xFF52E636),fontSize: 16) // botão de texto da categoria Fone
              ),
            ],
          ),
        ),
      ],
    ) ,);
  }
}




