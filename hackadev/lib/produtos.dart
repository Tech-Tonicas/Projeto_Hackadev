class Produto {
  final String nome;
  final double preco;
  final String urlImagem;
  final String categorias;
  final String descricao;

  Produto({required this.nome, required this.preco, required this.urlImagem, required this.categorias, required this.descricao});

  String get formattedPreco {
    String precoString = preco.toStringAsFixed(2);
    return 'R\$ ${precoString.replaceAll('.', ',')}';
  }
}

class ProdutosData {
  static final List<Produto> produtos = [
    Produto(
      nome: 'Headset preto',
      preco: 249.99,
      urlImagem: 'imagens/fones/fonePreto.png',
      categorias: 'fone',
      descricao: 'O headset Mancer Twilight traz a união de conforto e estilo, seu visual em preto com detalhes de iluminação Rainbow nos earcups em alto relevo faz dele uma peça essencial pra em qualquer setup ficar ainda mais bonito e completo.',
    ),
    Produto(
      nome: 'Monitor LG',
      preco: 649.99,
      urlImagem: 'imagens/monitor/monitorColor.png',
      categorias: 'monitor',
      descricao: 'O Monitor LG 21,5" apresenta tela Full HD vibrante e precisa, incluindo Modo Leitura para conforto visual. Flicker Safe reduz fadiga ocular, enquanto AMD FreeSync proporciona jogos suaves. Interface intuitiva permite personalização fácil, e Dynamic Action Sync melhora reações em jogos. Combinação de qualidade visual e recursos práticos.',
    ),
    Produto(
      nome: 'Mouse sem fio',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mouseAzul.png',
      categorias: 'mouse',
      descricao: 'Cliques silenciosos do mouse, conexão USB plug-and-play, controle suave do cursor e design ambidestro',
    ),
    Produto(
      nome: 'Teclado Mecânico Caveira',
      preco: 229.99,
      urlImagem: 'imagens/teclados/tecladoCaveira.png',
      categorias: 'teclado',
      descricao: 'Formato TKL compacto resultando em mais espaço para movimentos do mouse, Layout ABNT2 feito especialmente para o mercado brasileiro, Keycaps feitas com o método double shot injection resultando em legendas duradouras, Iluminação RGB  Chroma Mk2 individual por tecla',
    ),
    Produto(
      nome: 'Heaset Gamer Trust',
      preco: 169.99,
      urlImagem: 'imagens/fones/fonePretoAzul.png',
      categorias: 'fone',
      descricao: 'Compatível com PS4, Xbox, Switch, PC e Mobile, Fones com malhas acolchoadas de 50mm. Qualidade de som com graves potentes e intensos, Controle de som e silenciador acoplados no fone. Alça ajustável e microfone flexível permitindo posicioná-lo como quiser',
    ),
    Produto(
      nome: 'Monitor Samsung',
      preco: 489.99,
      urlImagem: 'imagens/monitor/monitorNature.png',
      categorias: 'monitor',
      descricao: 'Monitor Gamer Samsung 27" FHD,75Hz, HDMI, VGA, Freesync,Preto, Série T350',
    ),
    Produto(
      nome: 'Mouse Fortrek RGB',
      preco: 129.99,
      urlImagem: 'imagens/mouse/mouseColors.png',
      categorias: 'mouse',
      descricao: 'Com iluminação de LED RGB Rainbow. Design diferenciado, anatômico e moderno: laterais com padrões cuidadosamente desenhados para dar um UP em seu setup. Possui cabo de 1,8 metros com têxtil trançado e conector USB 2.0 (Plug & Play)',
    ),
    Produto(
      nome: 'Teclado Gamer RGB',
      preco: 389.29,
      urlImagem: 'imagens/teclados/tecladoRGB.png',
      categorias: 'teclado',
      descricao: 'Teclado Gamer Profissional Semi Mecânico Iluminação Led Rgb, conexão USB, base resistente teclas super macias e padrão Qwerty. O teclado é gamer perfeito para quem gosta de jogar online, é semi-mecânico e com conexão USB e seu maior diferencial: As luzes RGB de fundo que deixa o teclado mais bonito e melhora a visualização das teclas.'
    ),
    Produto(
      nome: 'Fone Multi Pop',
      preco: 189.99,
      urlImagem: 'imagens/fones/fonePretoMarrom.png',
      categorias: 'fone',
      descricao: 'Fone de ouvido multi pop bluetooth preto com detalhe de couro marrom  PH246. Compatível com	Smartphones, tablets e outros dispositivos. Haste acolchoada e ajustável proporcionando conforto estendido garantindo ergonomia no uso. Earpads extra macios para melhor conforto e melhor acústica.'
    ),
    Produto(
      nome: 'Monitor Odyssey G7 27',
      preco: 229.99,
      urlImagem: 'imagens/monitor/monitorGalaxia.png',
      categorias: 'monitor',
      descricao: 'O Monitor Odyssey G7 de 27" é um display premium projetado para entusiastas de jogos e usuários exigentes. Com uma tela curva de alta resolução e taxa de atualização ultrarrápida, oferece uma experiência imersiva e suave para jogos e entretenimento. Possui tecnologia QLED para cores vibrantes e realistas, juntamente com suporte a HDR para maior profundidade de contraste.',
    ),
    Produto(
      nome: 'Mouse G203',
      preco: 149.99,
      urlImagem: 'imagens/mouse/mouseG.png',
      categorias: 'mouse',
      descricao: 'O G203 LIGHTSYNC vem pronto para jogar com um sensor de 8.000 DPI e cores RGB LIGHTSYNC personalizáveis. A iluminação RGB LIGHTSYNC pode ser personalizada com efeitos ou padrões de ondas de cores em aproximadamente 16,8 milhões de cores para se adequar ao seu estilo, configuração e humor. O sensor de nível avançado para jogos responde com precisão aos seus movimentos.',
    ),
    Produto(
      nome: 'Teclado Gamer Action',
      preco: 49.99,
      urlImagem: 'imagens/teclados/teclasLaranja.png',
      categorias: 'teclado',
      descricao: 'Desenvolvido para otimizar seu desempenho, o teclado game TC200 tem teclas destacadas para uma fácil localização durante os jogos. Padrão ABNT2 e conexão USB. TECLADO ACTION: Padrão ABNT2 / Teclas destacadas para uma fácil localização durante os jogos / Conexão USB / Multimídia / 16 teclas de atalho / Teclas macias e silenciosas',
    ),
    Produto(
      nome: 'Headset Hylas Rosa',
      preco: 189.99,
      urlImagem: 'imagens/fones/foneRosa.png',
      categorias: 'fone',
      descricao: 'Um dos maiores destaques do modelo é sua iluminação RGB, que conta com 4 modos de operação, podendo também ser desligada. Moderno O Redragon Hylas RGB Bubblegum possui corpo fosco e arco de cabeça revestido com courino, entregando um visual sóbrio e de extremo bom gosto. Conforto Leve e equipado com almofadas ultra macias e acolchoamento no arco de cabeça.',
    ),
    Produto(
      nome: 'GalaxyView Jedi Edition',
      preco: 599.99,
      urlImagem: 'imagens/monitor/monitorStarWars.png',
      categorias: 'monitor',
      descricao: 'O Monitor Star Wars é um tributo épico à icônica saga cinematográfica. Com designs temáticos que apresentam elementos marcantes da série, esse monitor cativa os fãs com sua estética única. Além de sua aparência impressionante, oferece qualidade visual excepcional, com resolução nítida e cores envolventes.',
    ),
    Produto(
      nome: 'Mouse Razer Deathadder',
      preco: 49.99,
      urlImagem: 'imagens/mouse/mouseVerde.png',
      categorias: 'mouse',
      descricao: 'Desde a sua concepção, o Razer DeathAdder continua a oferecer o gameplay mais confortável de todos os tempos. O design com curvas e contornos foi perfeitamente projeto para encaixar na sua mão e o acabamento em preto matte previne acumulação de suor e garante melhor pegada.',
    ),
    Produto(
      nome: 'Teclado Multilaser',
      preco: 69.99,
      urlImagem: 'imagens/teclados/teclasVermelhas.png',
      categorias: 'teclado',
      descricao: 'Teclado Multilaser Slim com Fio USB Teclas Silenciosas Preto - TC213, Multilaser, Teclados, Windows ou Mac OS, Preto, PLUG & PLAY Conexão automática, conecte a entrada USB e comece a usar. Teclas super macias e silenciosas para seu conforto. Compatibilidade Windows ou Mac OS.',
    )
  ];
}