class Produto {
  final String nome;
  final double preco;
  final String urlImagem;
  final String descricao;

  Produto({required this.nome, required this.preco, required this.urlImagem, required this.descricao});

  String get formattedPreco {
    String precoString = preco.toStringAsFixed(2);
    return 'R\$ ${precoString.replaceAll('.', ',')}';
  }
}

class ProdutosData {
  static final List<Produto> produtos = [
    Produto(
      nome: 'Fone Preto',
      preco: 249.99,
      urlImagem: 'imagens/fones/fonePreto.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Monitor Color',
      preco: 649.99,
      urlImagem: 'imagens/monitor/monitorColor.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Mouse Azul',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mouseAzul.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Teclado Caveira',
      preco: 229.99,
      urlImagem: 'imagens/teclados/tecladoCaveira.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Fone Preto Azul',
      preco: 169.99,
      urlImagem: 'imagens/fones/fonePretoAzul.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Monitor Nature',
      preco: 489.99,
      urlImagem: 'imagens/monitor/monitorNature.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Mouse Colors',
      preco: 129.99,
      urlImagem: 'imagens/mouse/mouseColors.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Teclado RGB',
      preco: 389.29,
      urlImagem: 'imagens/teclados/tecladoRGB.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Fone Preto Marrom',
      preco: 189.99,
      urlImagem: 'imagens/fones/fonePretoMarrom.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Monitor Galaxia',
      preco: 229.99,
      urlImagem: 'imagens/monitor/monitorGalaxia.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Mouse G',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mouseG.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Teclado Teclas Laranja',
      preco: 49.99,
      urlImagem: 'imagens/teclados/teclasLaranja.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Fone Rosa',
      preco: 189.99,
      urlImagem: 'imagens/fones/foneRosa.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Monitor Star Wars',
      preco: 599.99,
      urlImagem: 'imagens/monitor/monitorStarWars.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Mouse Verde',
      preco: 49.99,
      urlImagem: 'imagens/mouse/mouseVerde.png',
      descricao: 'descricao',
    ),
    Produto(
      nome: 'Teclado Teclas Vermelhas',
      preco: 69.99,
      urlImagem: 'imagens/teclados/teclasVermelhas.png',
      descricao: 'descricao',
    )
  ];
}