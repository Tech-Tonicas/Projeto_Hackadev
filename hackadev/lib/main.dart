import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Loja Virtual", // Titulo da pagina
    theme: ThemeData.dark(), color: Color(0xFF2B2B2B),
    home: Scaffold(appBar: AppBar(),
    //Body com as categorias
    body: const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(children: [Icon(Icons.computer, size: 70.0,),Text("Monitores")],
      ),
      Column(children: [Icon(Icons.mouse,size: 70.0,),Text("Mouses")],
      ),
      Column(children: [Icon(Icons.keyboard, size: 70.0,),Text("Teclados")],
      ),
      Column(children: [Icon(Icons.headphones,size: 70.0,),Text("Fones")],)
    ],),)
    
    );  
  }
}

void main() {
  runApp(MaterialApp(
    home: TelaListaProdutos(),
  ));
}

class Produto {
  final String nome;
  final double preco;
  final String urlImagem;

  Produto({required this.nome, required this.preco, required this.urlImagem});
}

class TelaListaProdutos extends StatelessWidget {
  List<Produto> produtos = [
    Produto(
      nome: 'Fone Preto',
      preco: 19.99,
      urlImagem: 'produtos/fones/fonePreto.jpg',
    ),
    Produto(
      nome: 'Monitor Color',
      preco: 29.99,
      urlImagem: 'produtos/monitores/monitorColor.png',
    ),
    Produto(
      nome: 'Mouse Azul',
      preco: 19.99,
      urlImagem: 'produtos/mouses/mouseAzul.png',
    ),
    Produto(
      nome: 'Teclado RGB Azul',
      preco: 19.99,
      urlImagem: 'produtos/teclados/rgbAzul.png',
    ),
    Produto(
      nome: 'Fone Preto Azul',
      preco: 19.99,
      urlImagem: 'produtos/fones/fonePretoAzul.png',
    ),
    Produto(
      nome: 'Monitor Nature',
      preco: 19.99,
      urlImagem: 'produtos/monitores/monitorNature.png',
    ), Produto(
      nome: 'Mouse Colors',
      preco: 19.99,
      urlImagem: 'produtos/mouses/mouseColors.png',
    ),
    Produto(
      nome: 'Teclado RGB',
      preco: 29.99,
      urlImagem: 'produtos/teclados/tecladoRGB.png',
    ),
    Produto(
      nome: 'Fone Preto Marrom',
      preco: 19.99,
      urlImagem: 'produtos/fones/fonePretoMarrom.png',
    ),
    Produto(
      nome: 'Monitor Galaxia',
      preco: 19.99,
      urlImagem: 'produtos/monitores/monitorGalaxia.png',
    ),
    Produto(
      nome: 'Monitor Preto',
      preco: 19.99,
      urlImagem: 'produtos/mouses/mousePreto.png',
    ),
    Produto(
      nome: 'Teclado Teclas Laranja',
      preco: 19.99,
      urlImagem: 'produtos/teclados/teclasLaranja.png',
    ),
      Produto(
      nome: 'Fone Rosa',
      preco: 19.99,
      urlImagem: 'produtos/fones/foneRosa.png',
    ),
    Produto(
      nome: 'Monitor Star Wars',
      preco: 19.99,
      urlImagem: 'produtos/monitores/monitorStarWars.png',
    ),
    Produto(
      nome: 'Mouse Roxo',
      preco: 19.99,
      urlImagem: 'produtos/mouses/mouseRoxo.png',
    ),
    Produto(
      nome: 'Teclado Teclas Vermelhas',
      preco: 19.99,
      urlImagem: 'produtos/teclados/teclasVermelhas.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo de E-Commerce'),
      ),
      body: SingleChildScrollView(
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
                              builder: (context) => TelaDetalhesProduto(produto: produtos[j]),
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
                              SizedBox(height: 4),
                              Text(
                                produtos[j].nome,                              
                              ),
                              SizedBox(height: 2),                                                           
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Ajuste o espaçamento conforme necessário
                                child: Text(
                                  'R\$ ${produtos[j].preco.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 1, 105, 6),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
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

class TelaDetalhesProduto extends StatelessWidget {
  final Produto produto;

  TelaDetalhesProduto({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Produto'),
      ),
      body: Column(
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
          SizedBox(height: 16),
          Text(
            produto.nome,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Preço: R\$${produto.preco.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
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
          SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {
              // Lógica para a ação de comprar o produto
              // Por exemplo, mostrar um diálogo de confirmação ou adicionar ao carrinho
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 255, 255), // Cor de fundo personalizada
              elevation: 4, // Define a elevação (sombra) do botão
              shadowColor: Colors.black, // Cor da sombra
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), // Define o raio do arredondamento
            ),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 200, // Define a largura máxima
              ),
              height: 40, // Altura desejada do botão
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                
                  SizedBox(width: 4), // Espaço entre o ícone e o texto
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
      ),
    );
  }
}
