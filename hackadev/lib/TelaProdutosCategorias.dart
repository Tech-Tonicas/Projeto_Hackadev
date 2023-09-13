import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackadev/detalhesProdutos.dart';
import 'package:hackadev/produtos.dart';

class TelaProdutosCategoria extends StatelessWidget {
  final String categoria;

  TelaProdutosCategoria({required this.categoria});

  @override
  Widget build(BuildContext context) {
    List<Produto> produtosFiltrados = ProdutosData.produtos   //Lista onde acessa os produtos filtrados
        .where((produto) => produto.categorias == categoria)
        .toList();

    return Scaffold(
      appBar: AppBar( 
        title: Text('$categoria',style: GoogleFonts.openSans(fontSize:16,color: Color(0xFF52E636)),), //Titulo da página das categorias
      ),
      body: SingleChildScrollView( //widget que permite ter a barra de rolagem
        child: Column(
          children: [
            for (int i = 0; i < produtosFiltrados.length; i += 2)
              Row(
                children: [
                  for (int j = i; j < i + 2 && j < produtosFiltrados.length; j++)  // Laço for onde permite dois produtos por linha
                    Expanded(
                      child: GestureDetector( //widget que detecta qualquer ação do usuario
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaDetalhesProduto( // Rota para a descrição dos produtos
                                produto: produtosFiltrados[j],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                produtosFiltrados[j].urlImagem, //estrutura da imagem nos card
                                height: 100, //tamanho da imagem
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                produtosFiltrados[j].fabricante, //
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(8.0), // Adiciona um padding
                                child: Text(
                                  produtosFiltrados[j].nome,
                                  textAlign: TextAlign.center, // Centraliza o texto
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              SizedBox(width: 8),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center, //centralização das estrelas nos cards
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,         //interação das estrelas e suas avaliações
                                          itemCount: 5,
                                          itemSize: 15,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Color(0xFFFF9017),
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          produtosFiltrados[j].avaliacao.toString(),
                                          style: TextStyle(
                                            fontSize: 11,                                      
                                            color: Color(0xFFFF9017),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  produtosFiltrados[j].formattedPreco,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF52E636),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

