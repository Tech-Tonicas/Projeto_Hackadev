class Produto {
  final String nome;
  final double preco;
  final String urlImagem;

  Produto({required this.nome, required this.preco, required this.urlImagem});
}

class ProdutosData {
  static final List<Produto> produtos = [
    Produto(
      nome: 'Headphone Wave PF1508 Preto',
      preco: 249.99,
      urlImagem: 'imagens/fones/fonePreto.png',
    ),
    Produto(
      nome: 'Monitor 24 polegadas Widescreen',
      preco: 649.99,
      urlImagem: 'imagens/monitor/monitorColor.png',
    ),
    Produto(
      nome: 'Mouse Gamer Azul',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mouseAzul.png',
    ),
    Produto(
      nome: 'Teclado Gamer RGB Azul',
      preco: 229.99,
      urlImagem: 'imagens/teclados/rgbAzul.png',
    ),
    Produto(
      nome: 'Headphone sem fio WAPT 8000 Preto/Azul',
      preco: 169.99,
      urlImagem: 'imagens/fones/fonePretoAzul.png',
    ),
    Produto(
      nome: 'Monitor Full HD Led Nature',
      preco: 489.99,
      urlImagem: 'imagens/monitor/monitorNature.png',
    ),
    Produto(
      nome: 'Mouse Mobile Portable Colors',
      preco: 129.99,
      urlImagem: 'imagens/mouse/mouseColors.png',
    ),
    Produto(
      nome: 'Teclado Gamer Sate RGB USB ',
      preco: 389.29,
      urlImagem: 'imagens/teclados/tecladoRGB.png',
    ),
    Produto(
      nome: 'Fone sem Fio Preto Marrom',
      preco: 189.99,
      urlImagem: 'imagens/fones/fonePretoMarrom.png',
    ),
    Produto(
      nome: 'Monitor Galaxia',
      preco: 229.99,
      urlImagem: 'imagens/monitor/monitorGalaxia.png',
    ),
    Produto(
      nome: 'Mouse Preto com Fio ',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mousePreto.png',
    ),
    Produto(
      nome: 'Teclado USB com Fio',
      preco: 49.99,
      urlImagem: 'imagens/teclados/teclasLaranja.png',
    ),
    Produto(
      nome: 'Headphone Rosa com Fio',
      preco: 189.99,
      urlImagem: 'imagens/fones/foneRosa.png',
    ),
    Produto(
      nome: 'Monitor 14 polegadas Star Wars',
      preco: 599.99,
      urlImagem: 'imagens/monitor/monitorStarWars.png',
    ),
    Produto(
      nome: 'Mouse Roxo BT21',
      preco: 49.99,
      urlImagem: 'imagens/mouse/mouseRoxo.png',
    ),
    Produto(
      nome: 'Teclado sem Fio USB',
      preco: 69.99,
      urlImagem: 'imagens/teclados/teclasVermelhas.png',
    )
  ];
}
