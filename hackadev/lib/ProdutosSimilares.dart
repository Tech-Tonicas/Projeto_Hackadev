import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'model/produtos.dart';
import 'detalhesProdutos.dart';
import 'carrinho.dart';

class ProdutosSimilares extends StatelessWidget {
  final String categoriaAtual;
  final Produto produtoAtual;
  final Carrinho carrinho; // Adicione o parâmetro carrinho

  const ProdutosSimilares({
    Key? key,
    required this.categoriaAtual,
    required this.produtoAtual,
    required this.carrinho, // Adicione o parâmetro carrinho
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Produto> produtosSimilares = ProdutosData.produtos
        .where((produto) =>
            produto.categorias == categoriaAtual &&
            produto.id != produtoAtual.id)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Produtos Similares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int j = 0; j < produtosSimilares.length; j++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaDetalhesProduto(
                          produto: produtosSimilares[j],
                          carrinho:
                              carrinho, // Passe o carrinho para TelaDetalhesProduto
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          produtosSimilares[j].urlImagem,
                          height: 100,
                          width: 75,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          produtosSimilares[j].fabricante,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          width: 160,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              produtosSimilares[j].nome,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    initialRating:
                                        produtosSimilares[j].avaliacao,
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
                                    produtosSimilares[j].avaliacao.toString(),
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
                            produtosSimilares[j].formattedPreco,
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
            ],
          ),
        ),
      ],
    );
  }
}
 

/* import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'model/produtos.dart';
import 'detalhesProdutos.dart';
import 'carrinho.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;


class ProdutosSimilares extends StatefulWidget {
  final String categoriaAtual;
  final Map<String, dynamic> produtoAtual;
  final Carrinho carrinho;

  ProdutosSimilares({
    Key? key,
    required this.categoriaAtual,
    required this.produtoAtual,
    required this.carrinho,
  }) : super(key: key);

  @override
  _ProdutosSimilaresState createState() => _ProdutosSimilaresState();
}

class _ProdutosSimilaresState extends State<ProdutosSimilares> {
  List<Map<String, dynamic>> produtosSimilares = [];

  @override
  void initState() {
    super.initState();
    fetchProdutosSimilares();
  }

  Future<void> fetchProdutosSimilares() async {
  final response = await http.get(
    Uri.parse('http://localhost:8080/products?categorias=${widget.categoriaAtual}'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    setState(() {
      produtosSimilares = data.cast<Map<String, dynamic>>();
      // Remova o produto atual da lista de produtos similares
      produtosSimilares.removeWhere((produto) => produto['id'] == widget.produtoAtual['id']);
    });
  } else {
    throw Exception('Falha ao carregar produtos similares');
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Produtos Similares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int j = 0; j < produtosSimilares.length; j++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaDetalhesProduto(
                          produto: produtosSimilares[j],
                          carrinho: widget.carrinho,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          produtosSimilares[j]['urlImagem'] ?? '',
                          height: 100,
                          width: 75,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          produtosSimilares[j]['fabricante'] ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          width: 160,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              produtosSimilares[j]['nome'] ?? '',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    initialRating: produtosSimilares[j]['avaliacao']?.toDouble() ?? 0,
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
                                    produtosSimilares[j]['avaliacao']?.toString() ?? '',
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
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            produtosSimilares[j]['formattedPreco'] ?? '',
                            style: TextStyle(
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
            ],
          ),
        ),
      ],
    );
  }
} */