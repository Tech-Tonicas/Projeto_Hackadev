import 'package:flutter/material.dart';
import 'package:hackadev/model/produtos.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackadev/detalhesProdutos.dart';
import 'carrinho.dart'; 

class TelaProdutosCategoria extends StatelessWidget {
  final String categoria;
  final Carrinho carrinho; // Adicione uma referência ao carrinho

  TelaProdutosCategoria({required this.categoria, required this.carrinho});

  @override
  Widget build(BuildContext context) {
    List<Produto> produtosFiltrados = ProdutosData.produtos
        .where((produto) => produto.categorias == categoria)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoria',
            style:
                GoogleFonts.openSans(fontSize: 16, color: Color(0xFF52E636))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < produtosFiltrados.length; i += 2)
              Row(
                children: [
                  for (int j = i;
                      j < i + 2 && j < produtosFiltrados.length;
                      j++)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaDetalhesProduto(
                                produto: produtosFiltrados[j],
                                carrinho:
                                    carrinho, // Passe o carrinho para a tela de detalhes
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                produtosFiltrados[j].urlImagem,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                produtosFiltrados[j].fabricante,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  produtosFiltrados[j].nome,
                                  textAlign: TextAlign.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
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
                                          produtosFiltrados[j]
                                              .avaliacao
                                              .toString(),
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

 