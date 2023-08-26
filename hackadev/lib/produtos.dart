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
      preco: 19.99,
      urlImagem: 'imagens/fones/fonePreto.png',
    ),
    Produto(
      nome: 'Monitor Color',
      preco: 29.99,
      urlImagem: 'imagens/monitor/monitorColor.png',
    ),
    Produto(
      nome: 'Mouse Azul',
      preco: 19.99,
      urlImagem: 'imagens/mouse/mouseAzul.png',
    ),
    Produto(
      nome: 'Teclado RGB Azul',
      preco: 19.99,
      urlImagem: 'imagens/teclados/rgbAzul.png',
    ),
    Produto(
      nome: 'Fone Preto Azul',
      preco: 19.99,
      urlImagem: 'imagens/fones/fonePretoAzul.png',
    ),
    Produto(
      nome: 'Monitor Nature',
      preco: 19.99,
      urlImagem: 'imagens/monitor/monitorNature.png',
    ),
    Produto(
      nome: 'Mouse Colors',
      preco: 19.99,
      urlImagem: 'imagens/mouse/mouseColors.png',
    ),
    Produto(
      nome: 'Teclado RGB',
      preco: 29.99,
      urlImagem: 'imagens/teclados/tecladoRGB.png',
    ),
    Produto(
      nome: 'Fone Preto Marrom',
      preco: 19.99,
      urlImagem: 'imagens/fones/fonePretoMarrom.png',
    ),
    Produto(
      nome: 'Monitor Galaxia',
      preco: 19.99,
      urlImagem: 'imagens/monitor/monitorGalaxia.png',
    ),
    Produto(
      nome: 'Monitor Preto',
      preco: 19.99,
      urlImagem: 'imagens/mouse/mousePreto.png',
    ),
    Produto(
      nome: 'Teclado Teclas Laranja',
      preco: 19.99,
      urlImagem: 'imagens/monitor/monitorStarWars.png',
    ),
    Produto(
      nome: 'Fone Rosa',
      preco: 19.99,
      urlImagem: 'imagens/fones/foneRosa.png',
    ),
    Produto(
      nome: 'Monitor Star Wars',
      preco: 19.99,
      urlImagem: 'imagens/monitor/monitorStarWars.png',
    ),
    Produto(
      nome: 'Mouse Roxo',
      preco: 19.99,
      urlImagem: 'imagens/mouse/mouseRoxo.png',
    ),
    Produto(
      nome: 'Teclado Teclas Vermelhas',
      preco: 19.99,
      urlImagem: 'imagens/teclados/teclasVermelhas.png',
    )
  ];
}