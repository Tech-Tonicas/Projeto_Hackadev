import 'package:flutter/material.dart';
import './produtos.dart';
import './detalhesProdutos.dart';

class TelaListaProdutos extends StatefulWidget {
  const TelaListaProdutos({super.key});
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
                              builder: (context) =>
                                  TelaDetalhesProduto(produto: produtos[j]),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                produtos[j].urlImagem,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                produtos[j].fabricante,
                              ),
                               Text(
                                produtos[j].nome,
                              ),
                              const SizedBox(height: 2),
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Text(
                                produtos[j].formattedPreco,
                                style: const TextStyle(
                                  fontSize: 20,
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