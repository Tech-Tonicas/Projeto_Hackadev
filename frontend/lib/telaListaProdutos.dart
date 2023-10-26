import 'package:flutter/material.dart';
import 'produtos.dart';
import './detalhesProdutos.dart';
import 'carrinho.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Favoritos.dart';
import 'TelaFavoritos.dart';

class TelaListaProdutos extends StatefulWidget {
  final Carrinho carrinho;
  final Favoritos favoritos;

  const TelaListaProdutos(
      {Key? key, required this.carrinho, required this.favoritos})
      : super(key: key);

  @override
  _TelaListaProdutosState createState() => _TelaListaProdutosState();
}

class _TelaListaProdutosState extends State<TelaListaProdutos> {
  List<bool> carrinhoStates = List.filled(ProdutosData.produtos.length, false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < ProdutosData.produtos.length; i += 2)
            Row(
              children: [
                for (int j = i;
                    j < i + 2 && j < ProdutosData.produtos.length;
                    j++)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaDetalhesProduto(
                              produto: ProdutosData.produtos[j],
                              carrinho: widget.carrinho,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    ProdutosData.produtos[j].urlImagem,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      if (widget.favoritos.estaFavoritado(
                                          ProdutosData.produtos[j])) {
                                        widget.favoritos.removerProduto(
                                            ProdutosData.produtos[j]);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Produto removido dos favoritos.'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      } else {
                                        widget.favoritos.adicionarProduto(
                                            ProdutosData.produtos[j]);
                                             ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Produto adicionado aos favoritos.'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      widget.favoritos.estaFavoritado(
                                              ProdutosData.produtos[j])
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    color: widget.favoritos.estaFavoritado(
                                            ProdutosData.produtos[j])
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              ProdutosData.produtos[j].fabricante,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ProdutosData.produtos[j].nome,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Column(
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
                                Text(
                                  ProdutosData.produtos[j].avaliacao.toString(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFFF9017),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'R\$ ${ProdutosData.produtos[j].preco.toStringAsFixed(2).replaceAll('.', ',')}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF52E636),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        carrinhoStates[j] = !carrinhoStates[j];
                                      });

                                      if (carrinhoStates[j]) {
                                        widget.carrinho.adicionarProduto(
                                            ProdutosData.produtos[j]);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Produto adicionado ao carrinho.'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      } else {
                                        widget.carrinho.removerProduto(
                                            ProdutosData.produtos[j]);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Produto removido do carrinho.'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      carrinhoStates[j]
                                          ? Icons.add_shopping_cart
                                          : Icons.shopping_cart,
                                      color: carrinhoStates[j]
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
