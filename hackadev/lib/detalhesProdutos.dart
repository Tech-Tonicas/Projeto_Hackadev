import 'package:flutter/material.dart';
import './produtos.dart';
// Importe o arquivo produtos_data.dart

class TelaDetalhesProduto extends StatelessWidget {
  final Produto produto;

  const TelaDetalhesProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              produto.urlImagem,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          produto.nome,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Preço: R\$${produto.preco.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'Descrição: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Curta suas músicas com qualidade excepcional usando o nosso fone de ouvido preto. Design moderno e elegante, isolamento de ruído passivo e som claro e balanceado. Perfeito para suas atividades diárias ou para mergulhar no mundo da música.',
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: 4),
        ElevatedButton(
          onPressed: () {
            // Lógica para a ação de comprar o produto
            // Por exemplo, mostrar um diálogo de confirmação ou adicionar ao carrinho
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
                255, 255, 255, 255), // Cor de fundo personalizada
            elevation: 4, // Define a elevação (sombra) do botão
            shadowColor: Colors.black, // Cor da sombra
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50), // Define o raio do arredondamento
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 200, // Define a largura máxima
            ),
            height: 40, // Altura desejada do botão
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 4), // Espaço entre o ícone e o texto
                Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Colors.green[900], // Cor do texto
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
