import 'package:flutter/material.dart';
import 'model/produtos.dart';
import './detalhesProdutos.dart';
import 'carrinho.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TelaListaProdutos extends StatefulWidget {
  final Carrinho carrinho; // Adicione o parâmetro carrinho

  const TelaListaProdutos({Key? key, required this.carrinho}) : super(key: key);

  @override
  State<TelaListaProdutos> createState() => _TelaListaProdutosState();
}

class _TelaListaProdutosState extends State<TelaListaProdutos> {
  List<Produto> produtos = ProdutosData.produtos;

  // Utilize a lista de produtos
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < produtos.length; i += 2)
              Row(
                children: [
                  for (int j = i; j < i + 2 && j < produtos.length; j++)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaDetalhesProduto(
                                produto: produtos[j],
                                carrinho: widget
                                    .carrinho, // Passe o carrinho para a tela de detalhes
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                produtos[j].urlImagem,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                produtos[j].fabricante,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(
                                    8.0), // Adiciona um padding
                                child: Text(
                                  produtos[j].nome,
                                  textAlign:
                                      TextAlign.center, // Centraliza o texto
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
                                          produtos[j].avaliacao.toString(),
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
                                  produtos[j].formattedPreco,
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
 
 
 /*
 import 'dart:convert';
import 'package:flutter/material.dart';
import './detalhesProdutos.dart';
import 'carrinho.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
//import 'TelaFavoritos.dart';

class TelaListaProdutos extends StatefulWidget {
  final Carrinho carrinho; // Adicione o parâmetro carrinho
  

  const TelaListaProdutos({Key? key, required this.carrinho}) : super(key: key);

  @override
  State<TelaListaProdutos> createState() => _TelaListaProdutosState();
}

class _TelaListaProdutosState extends State<TelaListaProdutos> {
  
  // List<Produto> produtos = ProdutosData.produtos;

  //MODIFIQUEI AQUI
  List<dynamic> produto = [];
  late Future<void> future;
  
  
  //MODIFIQUEI AQUI
  Future<void> fetchProdutos() async {
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final response = await http.get(
      Uri.parse('http://localhost:8080/products'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        produto = data; // Não é mais necessário mapear para objetos Produto
      });
    } else {
      throw Exception('Falha ao carregar produtos');
    }
  }

  //MODIFIQUEI AQUI
  @override
  void initState() {
    super.initState();
    future = fetchProdutos();
  }

  // Utilize a lista de produtos
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //MODIFIQUEI AQUI
                  for (int i = 0; i < produto.length; i += 2)
                    Row(
                      children: [
                        for (int j = i; j < i + 2 && j < produto.length; j++)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaDetalhesProduto(
                                      produto: produto[j],
                                      carrinho: widget.carrinho,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Image.asset(
                                        produto[j]['urlImagem'] ?? '',
                                        height: 200,
                                         width: 200,//
                                        fit: BoxFit.cover,//contain
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      produto[j]['fabricante'] ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        produto[j]['nome'] ?? '',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFF9017),
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                produto[j]['avaliacao']
                                                        ?.toString() ?? '', // Verifique se é nulo
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
                                        produto[j]['formattedPreco'] ?? '', // Verifique se é nulo
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
        });
  }
}
 
 */