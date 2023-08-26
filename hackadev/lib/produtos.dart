class Produto {
  final String nome;
  final double preco;
  final String urlImagem;

  Produto({required this.nome, required this.preco, required this.urlImagem});
}

class ProdutosData {
  static final List<Produto> produtos = [
    Produto(
      nome: 'Fone Preto',
      preco: 249.99,
      urlImagem: 'imagens/fones/fonePreto.png',
    ),
    Produto(
      nome: 'Monitor Color',
      preco: 649.99,
      urlImagem: 'imagens/monitor/monitorColor.png',
    ),
    Produto(
      nome: 'Mouse Azul',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mouseAzul.png',
    ),
    Produto(
      nome: 'Teclado RGB Azul',
      preco: 229.99,
      urlImagem: 'imagens/teclados/rgbAzul.png',
    ),
    Produto(
      nome: 'Fone Preto Azul',
      preco: 169.99,
      urlImagem: 'imagens/fones/fonePretoAzul.png',
    ),
    Produto(
      nome: 'Monitor Nature',
      preco: 489.99,
      urlImagem: 'imagens/monitor/monitorNature.png',
    ),
    Produto(
      nome: 'Mouse Colors',
      preco: 129.99,
      urlImagem: 'imagens/mouse/mouseColors.png',
    ),
    Produto(
      nome: 'Teclado RGB',
      preco: 389.29,
      urlImagem: 'imagens/teclados/tecladoRGB.png',
    ),
    Produto(
      nome: 'Fone Preto Marrom',
      preco: 189.99,
      urlImagem: 'imagens/fones/fonePretoMarrom.png',
    ),
    Produto(
      nome: 'Monitor Galaxia',
      preco: 229.99,
      urlImagem: 'imagens/monitor/monitorGalaxia.png',
    ),
    Produto(
      nome: 'Mouse Preto',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mousePreto.png',
    ),
    Produto(
      nome: 'Teclado Teclas Laranja',
      preco: 49.99,
      urlImagem: 'imagens/teclados/teclasLaranja.png',
    ),
    Produto(
      nome: 'Fone Rosa',
      preco: 189.99,
      urlImagem: 'imagens/fones/foneRosa.png',
    ),
    Produto(
      nome: 'Monitor Star Wars',
      preco: 599.99,
      urlImagem: 'imagens/monitor/monitorStarWars.png',
    ),
    Produto(
      nome: 'Mouse Roxo',
      preco: 49.99,
      urlImagem: 'imagens/mouse/mouseRoxo.png',
    ),
    Produto(
      nome: 'Teclado Teclas Vermelhas',
      preco: 69.99,
      urlImagem: 'imagens/teclados/teclasVermelhas.png',
    )
  ];
}