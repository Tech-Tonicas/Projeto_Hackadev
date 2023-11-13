import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'model/produtos.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Categoria:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50), // Espaço horizontal entre os textos
                  Text(
                    '${widget.produto.categorias}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Cor:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 95), // Espaço horizontal entre os textos
                  Text(
                    '${widget.produto.cor}',
                    style: TextStyle(fontSize: 16),
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
                textAlign: TextAlign.justify,
              ),
            ),
            
            
            // Botão "Ver Avaliações"
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AvaliacoesProduto(comentarios: widget.produto.comentarios),
                  ),
                );
              },
              child: Text('Ver Avaliações'),
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
                        // Produto adicionado ao carrinho
                        widget.carrinho.adicionarProduto(widget.produto);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto adicionado ao carrinho.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        // Produto removido do carrinho
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
                  SizedBox(width: 16), // Espaço entre os botões
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });

                      // Verificar se o produto foi adicionado ou removido dos favoritos
                      if (isFavorited) {
                        // Produto adicionado aos favoritos
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto adicionado aos favoritos.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        // Produto removido dos favoritos
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
                          color: Color.fromARGB(255, 71, 67, 67), // Cor da borda
                          width: 0.5, // Espessura da borda
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

/*
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'model/produtos.dart';
import 'carrinho.dart';

class TelaDetalhesProduto extends StatefulWidget {
  final Map<String, dynamic>
      produto; // Altere o tipo para corresponder aos dados do produto
  final Carrinho carrinho;

  const TelaDetalhesProduto(
      {Key? key, required this.produto, required this.carrinho})
      : super(key: key);

  @override
  _TelaDetalhesProdutoState createState() => _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends State<TelaDetalhesProduto> {
  bool isButtonPressed = false;
  bool isFavorited = false;
  // Defina uma variável de instância para acessar o produto

  late Map<String, dynamic> produto;

  @override
  void initState() {
    super.initState();
    // Inicialize a variável de instância com os dados do produto
    produto = widget.produto;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto['resumo'] ?? ''),
        //title: Text(widget.produto.resumo),
      ),
   body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Image.network(
          widget.produto['urlimagem'] ?? '',
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              child: Text(
                widget.produto['resumo'] ?? '',

                //widget.produto.nome,
                style: TextStyle(
                    fontSize: mediaQuery.textScaleFactor * 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: mediaQuery.textScaleFactor * 15,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color(0xFFFF9017),
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  Row(
                    children: [
                      Text(
                        widget.produto['avaliacao']?.toString() ??
                            '', // Verifique se 'avaliacao' não é nulo antes de chamar 'toString()'
                        style: TextStyle(
                          fontSize: mediaQuery.textScaleFactor * 11,
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
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              child: Text(
                '${widget.produto['preco']}', // Verifique se 'formattedPreco' não é nulo antes de criar a string
                style: TextStyle(
                    fontSize: mediaQuery.textScaleFactor * 18,
                    color: isButtonPressed
                        ? Color(0xFF52E636)
                        : Color(0xFF52E636)),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'Categoria:',
                    style: TextStyle(
                        fontSize: mediaQuery.textScaleFactor * 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.04),
                  Text(
                    '${widget.produto['categorias']}',
                    style: TextStyle(fontSize: mediaQuery.textScaleFactor * 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'Cor:',
                    style: TextStyle(
                        fontSize: mediaQuery.textScaleFactor * 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.04),
                  Text(
                    '${widget.produto['cor']}',
                    style: TextStyle(fontSize: mediaQuery.textScaleFactor * 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              child: Text(
                'Descrição do Produto',
                style: TextStyle(
                    fontSize: mediaQuery.textScaleFactor * 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(mediaQuery.size.width * 0.04),
              child: Text(
                widget.produto['descricao'] ??
                    '', // Verifique se 'descricao' não é nulo antes de acessá-lo
                style: TextStyle(
                    fontSize: mediaQuery.textScaleFactor * 16,
                    color: Colors.white),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Botão Pressionado");
                        print("Detalhes do produto: ${widget.produto}");

                        setState(() {
                          isButtonPressed = !isButtonPressed;
                        });

                        if (isButtonPressed) {
                          widget.carrinho.adicionarProduto(
                            Produto.fromJson(widget.produto),
                          );
                          print(
                            "Produto adicionado ao carrinho. Conteúdo do carrinho: ${widget.carrinho.itens}",
                          );
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
                            Icon(
                              Icons.add,
                              color:
                                  isButtonPressed ? Colors.white : Colors.green,
                            ),
                            SizedBox(
                                width: 8), // Espaço entre o ícone e o texto
                            Text(
                              isButtonPressed ? 'Remover' : 'Adicionar',
                              style: TextStyle(
                                color: isButtonPressed
                                    ? Colors.white
                                    : Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.03),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

*/ 