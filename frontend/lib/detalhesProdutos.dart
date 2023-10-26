import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'produtos.dart';
import 'carrinho.dart';
import 'ProdutosSimilares.dart'; 
import 'CarrosselDeProdutos.dart';
import 'opiniao.dart';

class TelaDetalhesProduto extends StatefulWidget {
  final Produto produto;
  final Carrinho carrinho;

  const TelaDetalhesProduto({Key? key, required this.produto, required this.carrinho}) : super(key: key);

  @override
  _TelaDetalhesProdutoState createState() => _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends State<TelaDetalhesProduto> {
  bool isButtonPressed = false;
  bool isFavorited = false;
  bool isDescricaoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.resumo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ProductImageCarousel(
                imageUrls: [
                  widget.produto.urlImagem,
                  ...widget.produto.imageUrls,
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.produto.nome,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
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
                  Row(
                    children: [
                      Text(
                        widget.produto.avaliacao.toString(),
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFFF9017),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: const Color.fromARGB(255, 106, 111, 116),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${widget.produto.formattedPreco}',
                style: TextStyle(fontSize: 18, color: isButtonPressed ? Color(0xFF52E636) : Color(0xFF52E636)),
              ),
            ),
            SizedBox(height: 16),
            // Botão "Abrir/Fechar Descrição"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDescricaoVisible = !isDescricaoVisible;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 58, 58, 58),
                  onPrimary: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color.fromARGB(112, 71, 71, 71),
                      width: 2,
                    ),
                  ),
                  minimumSize: Size(100, 50), // Ajuste a largura e altura conforme necessário
                  padding: EdgeInsets.symmetric(horizontal: 16), // Ajuste o espaçamento interno
                ),
                child: Row(
                  children: [
                    Text('Descrição do produto', style: TextStyle(fontSize: 16)),
                    Icon(
                      isDescricaoVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            // Exibir a descrição se isDescricaoVisible for verdadeiro
            if (isDescricaoVisible)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      widget.produto.descricao,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 15),
            // Botão "Ver Avaliações"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AvaliacoesProduto(comentarios: widget.produto.comentarios),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 58, 58, 58),
                  onPrimary: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color.fromARGB(112, 71, 71, 71),
                      width: 2,
                    ),
                  ),
                  minimumSize: Size(100, 50), // Ajuste a largura e altura conforme necessário
                  padding: EdgeInsets.symmetric(horizontal: 16), // Ajuste o espaçamento interno
                ),
                child: Row(
                  children: [
                    Text('Avaliações', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButtonPressed = !isButtonPressed;
                      });

                      if (isButtonPressed) {
                        widget.carrinho.adicionarProduto(widget.produto);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto adicionado ao carrinho.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto removido do carrinho.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      shadowColor: Color(0xFF2B2B2B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: isButtonPressed ? Colors.green : Colors.white,
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: isButtonPressed ? Colors.white : Colors.green),
                          SizedBox(width: 8),
                          Text(
                            isButtonPressed ? 'Remover do carrinho' : 'Adicionar ao carrinho',
                            style: TextStyle(
                              color: isButtonPressed ? Colors.white : Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });

                      if (isFavorited) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto adicionado aos favoritos.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto removido dos favoritos.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Color.fromARGB(255, 71, 67, 67),
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.red : const Color.fromARGB(199, 158, 158, 158),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Widget ProdutosSimilares
            ProdutosSimilares(
              categoriaAtual: widget.produto.categorias,
              produtoAtual: widget.produto,
              carrinho: widget.carrinho,
            ),
          ],
        ),
      ),
    );
  }
}
