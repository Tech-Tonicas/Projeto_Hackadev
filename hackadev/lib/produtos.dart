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
      urlImagem: '../assets/fones/fonePreto.png',
    ),
    Produto(
      nome: 'Monitor Color',
      preco: 29.99,
      urlImagem: '../assets/monitor/monitorColor.png',
    ),
    Produto(
      nome: 'Mouse Azul',
      preco: 19.99,
      urlImagem: '../assets/mouse/mouseAzul.png',
    ),
    Produto(
      nome: 'Teclado RGB Azul',
      preco: 19.99,
      urlImagem: '../assets/teclados/rgbAzul.png',
    ),
    Produto(
      nome: 'Fone Preto Azul',
      preco: 19.99,
      urlImagem: '../assets/fones/fonePretoAzul.png',
    ),
    Produto(
      nome: 'Monitor Nature',
      preco: 19.99,
      urlImagem: '../assets/monitor/monitorNature.png',
    ),
    Produto(
      nome: 'Mouse Colors',
      preco: 19.99,
      urlImagem: '../assets/mouse/mouseColors.png',
    ),
    Produto(
      nome: 'Teclado RGB',
      preco: 29.99,
      urlImagem: '../assets/teclados/tecladoRGB.png',
    ),
    Produto(
      nome: 'Fone Preto Marrom',
      preco: 19.99,
      urlImagem: '../assets/fones/fonePretoMarrom.png',
    ),
    Produto(
      nome: 'Monitor Galaxia',
      preco: 19.99,
      urlImagem: '../assets/monitor/monitorGalaxia.png',
    ),
    Produto(
      nome: 'Monitor Preto',
      preco: 19.99,
      urlImagem: '../assets/mouse/mousePreto.png',
    ),
    Produto(
      nome: 'Teclado Teclas Laranja',
      preco: 19.99,
      urlImagem: '../assets/monitor/monitorStarWars.png',
    ),
    Produto(
      nome: 'Fone Rosa',
      preco: 19.99,
      urlImagem: '../assets/fones/foneRosa.png',
    ),
    Produto(
      nome: 'Monitor Star Wars',
      preco: 19.99,
      urlImagem: '../assets/monitor/monitorStarWars.png',
    ),
    Produto(
      nome: 'Mouse Roxo',
      preco: 19.99,
      urlImagem: '../assets/mouse/mouseRoxo.png',
    ),
    Produto(
      nome: 'Teclado Teclas Vermelhas',
      preco: 19.99,
      urlImagem: '../assets/teclados/teclasVermelhas.png',
    )
  ];
}