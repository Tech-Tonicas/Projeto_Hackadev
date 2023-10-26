import 'package:flutter/material.dart';
import 'Favoritos.dart';
import 'carrinho.dart';
import 'produtos.dart';
import 'telaListaProdutos.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TelaFavoritos extends StatefulWidget {
  final Carrinho carrinho;
  final Favoritos favoritos;

  TelaFavoritos({
    required this.carrinho,
    required this.favoritos,
  });

  @override
  _TelaFavoritosState createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  @override
  Widget build(BuildContext context) {
    final produtosFavoritos = widget.favoritos.itens;

      return Scaffold(
          appBar: AppBar(
            title: Text('Favoritos'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                onPressed: () {
                  // Adicione ação aqui, se necessário
                },
              )
            ],
          ),
          body: produtosFavoritos.isEmpty
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 64,
                      color: Colors.pink,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Sua lista de desejos está vazia.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      'Adicione produtos que você deseja comprar.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                  itemCount: produtosFavoritos.length,
                  itemBuilder: (context, index) {
                    final produto = produtosFavoritos[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(
                          produto.urlImagem,
                          width: 80,
                        ),
                        title: Text(produto.fabricante),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(produto.nome),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: produto.avaliacao,
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
                                Text(
                                  produto.avaliacao.toStringAsFixed(0),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFFF9017),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF52E636),
                              ),
                            ),
                            SizedBox(height: 8), 
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.favoritos.removerProduto(produto);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Produto removido dos favoritos.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, 
                                onPrimary: Colors.red, 
                              ),
                              child: Text('Remover'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
