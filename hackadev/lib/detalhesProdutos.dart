import 'package:flutter/material.dart';
import './produtos.dart';

class TelaDetalhesProduto extends StatefulWidget {
  final Produto produto;

  const TelaDetalhesProduto({Key? key, required this.produto}) : super(key: key);

  @override
  _TelaDetalhesProdutoState createState() => _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends State<TelaDetalhesProduto> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  widget.produto.urlImagem,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.produto.nome,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '${widget.produto.formattedPreco}',
                    style: TextStyle(fontSize: 18, color: isButtonPressed ? Color(0xFF52E636) : Color(0xFF52E636)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Descrição do Produto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.produto.descricao,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButtonPressed = !isButtonPressed;
                  });
                  // Lógica para a ação de comprar o produto
                  // Por exemplo, mostrar um diálogo de confirmação ou adicionar ao carrinho
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  shadowColor: Color(0xFF2B2B2B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  primary: isButtonPressed ? Color(0xFF52E636) : Colors.white, // Define a cor do botão
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: isButtonPressed ? Colors.white : Color(0xFF52E636)),
                      SizedBox(width: 8),
                      Text(
                        'Adicionar ao Carrinho',
                        style: TextStyle(
                          color: isButtonPressed ? Colors.white : Color(0xFF52E636),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}