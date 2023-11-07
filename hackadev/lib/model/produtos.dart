/*class Produto {
 int? id;
 String? nome;
 String? fabricante;
 String? resumo;
 double? preco;
 String? urlImagem;
 List<String>? imageUrls;
 String? categorias;
 String? cor;
 String? descricao;
 double? avaliacao;
 List<Comentario>? comentarios;

String? get formattedPreco {
 if (preco != null) {
 final precoString = preco!. toStringAsFixed(2).replaceAll('.', ',');
 return 'R\$ $precoString';
 }
 return null;
 }
}

class Comentario {
 String? usuario;
 String? texto;
}*/


//
class Produto {
  final int id;
  final String nome;
  final String fabricante;
  final String resumo;
  final double preco;
  final String urlImagem;
  final List<String> imageUrls;
  final String categorias;
  final String cor;
  final String descricao;
  final double avaliacao;
  final List<Comentario> comentarios;
  

  Produto({
    required this.id,
    required this.nome,
    required this.resumo,
    required this.fabricante,
    required this.preco,
    required this.urlImagem,
    required this.imageUrls,
    required this.categorias,
    required this.cor,
    required this.descricao,
    required this.avaliacao,
    required this.comentarios,
    
  });

 

  String get formattedPreco {
    String precoString = preco.toStringAsFixed(2);
    return 'R\$ ${precoString.replaceAll('.', ',')}';
  }
}

class Comentario {
  final String usuario;
  final String texto;

  Comentario({
  required this.usuario, 
  required this.texto});
}

 class ProdutosData {
  static final List<Produto> produtos = [
    Produto(
      id: 1,
      fabricante: 'Fallen',
      nome: 'Headset Gamer Fallen Pantera Eco, Drivers 50mm, Preto',
      resumo: 'Headset Gamer Fallen',
      preco: 199.99,
      urlImagem: 'imagens/fones/FoneFallenPreto.png',
      imageUrls: [
        'imagens/fones/FoneFallenPreto1.png',
        'imagens/fones/FoneFallenPreto2.png',
      ],
      categorias: 'Fone',
      cor: 'Preto',
      descricao:
          'Headset Gamer Fallen Pantera Eco. O Conforto Que Você Precisa. Earpads em courino, que oferecem maior conforto e uma espuma de memória para potencializar a performance do som. Sistema de Som Preciso. Drivers de 50mm, que proporcionam maior precisão do áudio, diminuindo distorções e mantendo a estabilidade durante os jogos.',
      avaliacao: 123,
      comentarios: [
        Comentario(usuario: 'Renata', texto: 'O som é incrível! Vale muito a pena'),
        Comentario(usuario: 'Jonas', texto: 'Estava a meses procurando. Achei aqui com um ótimo preço. O fone é tem um som sensacional'),
        Comentario(usuario: 'Fernando', texto: 'Chegou rápido e bem embalado. O som é muito bom.'),
      ],
    ),
    Produto(
      id: 2,
      fabricante: 'Samsung',
      nome: 'Monitor Gamer Samsung Curvo, tela ultrawide, HDMI Odyssey G7',
      resumo: 'Monitor Gamer Curvo Samsung',
      preco: 3299.99,
      urlImagem: 'imagens/monitor/Monitorsamsung.png',
      imageUrls: [
        'imagens/monitor/Monitorsamsung1.png',
        'imagens/monitor/Monitorsamsung2.png',
      ],
      categorias: 'Monitor',
      cor: 'Preto',
      descricao:
          'Monitor Gamer Curvo Samsung Odyssey 27" WQHD, 240Hz, 1ms, HDMI, Display Port, USB, compatível com G-sync, Freesync Premium Pro, com ajuste de altura, preto, série G7. Tela com 1000R preenche toda a sua visão periférica e te coloca no lugar do personagem. Viva uma experiência inédita de tirar o fôlego. Gráficos que ultrapassam os limites, resolução Ultra-WQHD proporciona uma visão vasta e abrangente do mundo dos seus jogos com detalhes verdadeiramente realistas.',
      avaliacao: 100,
      comentarios: [
        Comentario(usuario: 'Fernanda', texto: 'Imagem muito boa'),
        Comentario(usuario: 'Kelly', texto: 'Pelo valor, compensa muito. Sem falar que as cores são ótimas'),
        Comentario(usuario: 'Rejane', texto: 'Chegou rápido e bem embalado.'),
      ],
    ),
    Produto(
      id: 3,
      fabricante: 'MSI',
      nome: 'Mouse gamer MSI preto INTERCEPTOR DS B1 1600DPI Preto',
      resumo: 'Mouse gamer MSI preto',
      preco: 99.90,
      urlImagem: 'imagens/mouse/MOUSE_GAMER_MSI.png',
      imageUrls: [
        'imagens/mouse/MOUSE_GAMER_MSI1.png',
        'imagens/mouse/MOUSE_GAMER_MSI2.png',
      ],
      categorias: 'Mouse',
      cor: 'Preto',
      descricao:
          'Sensor óptico de gaming grade - botão DPI on-the-fly - design ergonômico e alças laterais anti-deslizamento - superfície antiderrapante - sistema de peso ajustável - conector banhado a ouro Especificações: sensor: óptico - resolução: 1600 DPI - botões: 6 botões - interface: conector USB 2',
      avaliacao: 150,
      comentarios: [
        Comentario(usuario: 'Samuel', texto: 'Muito bom! Paguei muito barato, entrega perfeita , sem frete , está me atendendo muito bem'),
        Comentario(usuario: 'Gabriel', texto: 'Muito bonito e funciona muito bem.'),
        Comentario(usuario: 'Gabriela', texto: 'O scroll parou de funcionar com 1 semana em 2 mouses'),
      ],
    ),
    Produto(
      id: 4,
      fabricante: 'Logitech',
      nome: 'Teclado Mecânico Logitech Gamer, cabo removível, Logitech',
      resumo: 'Teclado Mecânico Logitech',
      preco: 467.00,
      urlImagem: 'imagens/teclados/Teclado_Mecanico_Gamer.png',
      imageUrls: [
        'imagens/teclados/Teclado_Mecanico_Gamer1.png',
        'imagens/teclados/Teclado_Mecanico_Gamer2.png',
      ],
      categorias: 'Teclado',
      cor: 'Preto',
      descricao:
          'Formato TKL compacto resultando em mais espaço para movimentos do mouse, Layout ABNT2 feito especialmente para o mercado brasileiro, Keycaps feitas com o método double shot injection resultando em legendas duradouras, Iluminação RGB  Chroma Mk2 individual por tecla',
      avaliacao: 50,
      comentarios: [
        Comentario(usuario: 'Rebeca', texto: 'Produto chegou corretamente, teclas suaves e entrega bem o que o preço propõe, é uma excelente opção'),
        Comentario(usuario: 'Jonas', texto: 'A entrega foi rápida, o teclado é lindo'),
        Comentario(usuario: 'Karine', texto: 'otimo estou com ele a 2 anos e nao me arrependo'),
      ],
    ),
    Produto(
      id: 5,
      fabricante: 'JBL',
      nome: 'Headset Gamer JBL Quantum One RGB, Preto, com microfone',
      resumo: 'Headset Gamer JBL Quantum',
      preco: 169.99,
      urlImagem: 'imagens/fones/foneJBL.png',
      imageUrls: [
        'imagens/fones/foneJBL1.png',
        'imagens/fones/foneJBL2.png',
      ],
      categorias: 'Fone',
      cor: 'Preto',
      descricao:
          'O fone de ouvido com fio JBL Quantum ONE oferece áudio preciso de nível profissional com o rastreamento de cabeça aprimorado JBL QuantumSPHERE 360, som surround espacial e cancelamento de ruído ativo ajustado para jogos. O JBL QuantumSOUND Signature proporciona uma curva de som envolvente por meio dos drivers de 50 mm certificados Hi-Res alta definição. O microfone removível com foco na voz permite interações claras entre os jogadores, com supressão de ruídos, recursos de silenciamento e um seletor de equilíbrio de áudio entre jogo e bate-papo certificado pelo DISCORD.',
      avaliacao: 20,
      comentarios: [
        Comentario(usuario: 'Junior', texto: 'O som é incrível! Vale muito a pena'),
        Comentario(usuario: 'Nicole', texto: 'Estava a meses procurando. Achei aqui com um ótimo preço. O fone é tem um som sensacional'),
        Comentario(usuario: 'Julio', texto: 'Chegou rápido e bem embalado. O som é muito bom.'),
      ],
    ),
    Produto(
      id: 6,
      fabricante: 'Apple',
      nome: 'IMac ME086BZ Apple Intel Core i5 Quad Core - 8GB 1TB 21,5" + HDMI',
      resumo: 'IMac ME086BZ Apple i5',
      preco: 5685.00,
      urlImagem: 'imagens/monitor/iMac_ME086BZ_Apple.png',
      imageUrls: [
        'imagens/monitor/iMac_ME086BZ_Apple1.png',
        'imagens/monitor/iMac_ME086BZ_Apple2.png',
      ],
      categorias: 'Monitor',
      cor: 'Branco',
      descricao:
          'IMAC 21.5 2,7GHz Intel Core i5 quad core, Intel Iris Pro Graphics (Turbo Boost de até 3,2GHz) com 4MB de cache L3 (ME087BZ/A) - Tela de 21,5 polegadas (diagonal), retroiluminada por LED, com tecnologia IPS, resolução de 1920x1080 e suporte para milhões de cores, Disco rígido de 1TB (5400 rpm) Possibilidade de configuração para 1TB Fusion Drive ou para 256GB ou 512GB de armazenamento em flash (SSD). 8GB (dois módulos de 4GB) de memória DDR3 de 1600MHz Possibilidade de configuração para 16GB.',
      avaliacao: 10,
      comentarios: [
        Comentario(usuario: 'Sergio', texto: 'Ele é bom mas quando você vai usando muito com frequência, o áudio vai estourando e ele não cobre ruído, se alguém falar perto de você, você escuta'),
        Comentario(usuario: 'Emile', texto: 'A entrega foi rápida, o teclado é lindo'),
        Comentario(usuario: 'Thiago', texto: 'Designer da mercadoria lindo, muito confortável com ajuste de tamanho, chegou muito rápido'),
      ],
    ),
    Produto(
      id: 7,
      fabricante: 'Redragon',
      nome: 'Mouse Gamer Redragon Impact RGB, 12400dpi M908 Preto',
      resumo: 'Mouse Gamer Redragon',
      preco: 230.45,
      urlImagem: 'imagens/mouse/Mouse_Gamer_Redragon_Impact.png',
      imageUrls: [
        'imagens/mouse/Mouse_Gamer_Redragon_Impact1.png',
        'imagens/mouse/Mouse_Gamer_Redragon_Impact2.png',
      ],
      categorias: 'Mouse',
      cor: 'Preto',
      descricao:
          'Mouse Gamer Redragon Impact M908 - Poderoso sensor pixart PMW 3327 de 12400 DPI com 5 modos de DPI (500/1000/2000/3000/6200 DPI) (30G ACC), retroiluminação LED RGB ajustável. Polling rate de 1000hz, 12 botões programáveis, compatível com software para configuração de macro/ajuste iluminação RGB/configurações de performance. Memória interna para armazenamento de configurações. Micro-interruptores com durabilidade de até 10 milhões de cliques, ajuste de peso para uma experiência única personalizada.',
      avaliacao: 20,
      comentarios: [
        Comentario(usuario: 'Miranda', texto: 'Nota mil. Funciona super bem, bem embalado. Entrega rápida'),
        Comentario(usuario: 'Aparecida', texto: 'Produto exatamente como da foto, chegou muito rapido, atende muito bem. Melhor custo x beneficio'),
        Comentario(usuario: 'Valentina', texto: 'Mouse excelente, tem um tamanho legal'),
      ],
    ),
    Produto(
      id: 8,
      fabricante: 'ASUS',
      nome: 'Teclado ASUS ROG claymore cherry MX red Mechanical RGB',
      resumo: 'Teclado ASUS ROG claymore',
      preco: 1168.68,
      urlImagem: 'imagens/teclados/TECLADO_ASUS_ROG.png',
      imageUrls: [
        'imagens/teclados/TECLADO_ASUS_ROG1.png',
        'imagens/teclados/TECLADO_ASUS_ROG2.png',
      ],
      categorias: 'Teclado',
      cor: 'Preto',
      descricao:
          'Teclado ASUS rog claymore. rgb switch cherry mx red. o rog claymore é o primeiro teclado mecânico rgb para jogos do mundo, com teclado numérico removível que oferece opções de posicionamento enquanto você joga.',
      avaliacao: 5070,
      comentarios: [
        Comentario(usuario: 'Enzo', texto: 'Ótimo produto, qualidade excepcional!'),
        Comentario(usuario: 'Valentina', texto: 'Me surpreendi muito positivamente, pois, pelo preço, achei que seria de qualidade bem inferior. Seria um teclado temporário, mas, pelo visto, vai durar mais que o previsto'),
        Comentario(usuario: 'Eliza', texto: 'Ótimo teclado, recomendo'),
      ],
    ),
    Produto(
      id: 9,
      fabricante: 'Havit',
      nome: 'Headset Gamer Havit RGB, Drivers 53mm, Microfone Plugável',
      resumo: 'Headset Gamer Havit',
      preco: 234.99,
      urlImagem: 'imagens/fones/HEADSET_HAVIT.png',
      imageUrls: [
        'imagens/fones/HEADSET_HAVIT1.png',
        'imagens/fones/HEADSET_HAVIT2.png',
      ],
      categorias: 'Fone',
      cor: 'Preto',
      descricao:
          'Headset Gamer Havit H2002D jaqueta de liga leve com frente e superfície de plástico com revestimento de piano. Desempenho e Compatibilidade com PC, PS4 e XBOX Faixa de cabeça ajustável suspensa única, design ergonômico e confortável de usar. À prova de desgaste, resistente a arranhões e atualizado, o peso de toda a máquina é moderado, desgastando por muito tempo sem pressão. Microfone plugável de 3,5 mm compatível para PC, PS4 e XBOX e Alto-falante magnético de 53 mm de alta qualidade de som para distinguir o som dos jogos e a frequência fracionária alta e baixa meticulosa ao ouvir música.',
      avaliacao: 570,
      comentarios: [
        Comentario(usuario: 'Lais', texto: 'Qualidade de áudio muito boa, ótimo pra ouvir música e jogar. O microfone também funciona muito bem.'),
        Comentario(usuario: 'Juliana', texto: 'Um fone excelente, muito confortável e bonito, tem uma boa qualidade de som, recomendo muito'),
        Comentario(usuario: 'Marcos', texto: 'Muito bom, comprei ja faz algumas semanas e funciona perfeitamente, veio bem embalado'),
      ],
    ),
    Produto(
      id: 10,
      fabricante: 'Lenovo',
      nome: 'Monitor Gamer tela LED HD 23.8" - FreeSync Lenovo VGA + HDMI',
      resumo: 'Monitor LED HD 23.8"',
      preco: 999.00,
      urlImagem: 'imagens/monitor/Monitor_Lenovo.png',
      imageUrls: [
        'imagens/monitor/Monitor_Lenovo1.png',
        'imagens/monitor/Monitor_Lenovo2.png',
      ],
      categorias: 'Monitor',
      cor: 'Preto',
      descricao:
          'Levando os jogos a um novo patamar, o Monitor Lenovo G25-10 vem equipado com tudo o que você precisa. O monitor de jogos de 24,5 pol. está pronto para E-sports. Resolução de 1.980 x 1.080, tempo de resposta extremamente rápido de 1 ms e taxa de atualização impressionante de 144 Hz garantem a execução suave da maioria dos jogos. A tensão e a tremulação da tela são reduzidas graças à tecnologia de AMD FreeSync™ que otimiza a experiência de jogos. O conforto permanece uma prioridade com a certificação TÜV Eye Comfort, enquanto a inclinação e a base elevada permitem uma implantação flexível.',
      avaliacao: 500,
      comentarios: [
        Comentario(usuario: 'Larissa', texto: 'Monitor muito bonito e de boa qualidade, funciona bem para jogos e para trabalhar'),
        Comentario(usuario: 'Debora', texto: 'O produto é fantástico, estou realizado por essa aquisição'),
        Comentario(usuario: 'Juliana', texto: 'O produto muito bom e ótimo desempenho.'),
      ],
    ),
    Produto(
      id: 11,
      fabricante: 'T-Dagger',
      nome: 'Mouse gamer com fio T-DAGGER LIEUTENANT LED RGB',
      resumo: 'Mouse gamer T-DAGGER',
      preco: 92.37,
      urlImagem: 'imagens/mouse/MOUSE_GAMER_COM_FIO.png',
      imageUrls: [
        'imagens/mouse/MOUSE_GAMER_COM_FIO1.png',
        'imagens/mouse/MOUSE_GAMER_COM_FIO2.png',
      ],
      categorias: 'Mouse',
      cor: 'Preto',
      descricao:
          'O Mouse Gamer T-Dagger Second Lieutenant combina um design exclusivo com configurações personalizáveis, velocidade, precisão e estilo inigualáveis, com uma iluminação customizável RGB com efeito de onda arco-íris, trazendo um estilo único ao seu setup. O sensor de 8000 dpi, oferece uma excelente acuracidade ao jogador.',
      avaliacao: 770,
      comentarios: [
        Comentario(usuario: 'Alemao', texto: 'O mouse é muito bom mas é pesado D+ para meu gosto.'),
        Comentario(usuario: 'Jonathan', texto: 'Excelente mouse super rápido robusto'),
        Comentario(usuario: 'Fernanda', texto: 'É um mouse muito completo, deu trabalho pra achar o software mas é muito bom'),
      ],
    ),
    Produto(
      id: 12,
      fabricante: 'TteSPORTS',
      nome: 'Thermaltake, Poseidon ZX Illuminated, Blue Switch, com fio',
      resumo: 'Thermaltake - Poseidon ZX',
      preco: 199.00,
      urlImagem: 'imagens/teclados/Teclado_Thermaltake.png',
      imageUrls: [
        'imagens/teclados/Teclado_Thermaltake1.png',
        'imagens/teclados/Teclado_Thermaltake2.png',
      ],
      categorias: 'Teclado',
      cor: 'Preto',
      descricao:
          'O POSIDON ZX Illuminated - Blue Switch Edition - é um teclado mecânico econômico no formato tenkeyless. Perfeito para um jogador usar em casa ou lan onde o espaço é mais limitado. O POSIDON ZX possui interruptores mecânicos certificados TteSPORTS, classificados para 50 milhões de pressionamentos de teclas, com a primeira garantia de 5 anos do mundo para teclados mecânicos para jogos.',
      avaliacao: 790,
      comentarios: [
        Comentario(usuario: 'Gabriel', texto: 'Produto de boa qualidade, chegou no prazo e tem atendido as expectativas.'),
        Comentario(usuario: 'Alisson', texto: 'Bom mais não compraria novamente'),
        Comentario(usuario: 'Pedro', texto: 'Amei, ele é maravilhoso!'),
      ],
    ),
    Produto(
      id: 13,
      fabricante: 'Havit',
      nome: 'Headset Gamer Havit Vermelho, Drivers 50mm, USB com fio',
      resumo: 'Headset Gamer Havit',
      preco: 294.99,
      urlImagem: 'imagens/fones/foneHavitVermelho.png',
      imageUrls: [
        'imagens/fones/foneHavitVermelho1.png',
        'imagens/fones/foneHavitVermelho2.png',
      ],
      categorias: 'Fone',
      cor: 'Vermelho',
      descricao:
         'Headset Gamer, 7.1 Surround, PC, Xbox One/Series X e PS5. Vem com alto-falantes de alta qualidade e Surround Virtual 7.1, proporcionando uma experiência única ao jogador. Construído em alumínio industrial, garante durabilidade e leveza. Almofadas removíveis e produzidas em material sintético oferecendo conforto ao jogador, mantendo o som de alta qualidade e sem cansar. O design ergonômico foi projetado para exercer a menor pressão possível ao jogador, tornando mais agradável o uso contínuo do equipamento. O Microfone é removível, possui tecnologia de redução de ruído para uma comunicação mais precisa e sem interferência.',
      avaliacao: 80,
      comentarios: [
        Comentario(usuario: 'Nayara', texto: 'Muito satisfeito com o produto'),
        Comentario(usuario: 'Mariana', texto: 'Bom mais não compraria novamente'),
        Comentario(usuario: 'Pedro', texto: 'Nota 10 gostei muito do produto e chegou antes do prazo'),
      ],
    ),
    Produto(
      id: 14,
      fabricante: 'Benq',
      nome: 'Monitor Gamer BenQ Zowie de 24,5 polegadas, com tela LED FULL HD',
      resumo: 'Monitor gamer Benq Zowie 24,5',
      preco: 2800.00,
      urlImagem: 'imagens/monitor/Monitor_Benq.png',
      imageUrls: [
        'imagens/monitor/Monitor_Benq1.png',
        'imagens/monitor/Monitor_Benq2.png',
      ],
      categorias: 'Monitor',
      cor: 'Preto',
      descricao:
          'Uma nova geração da série XL de monitores gamers para PC, com ajustes aprimorados para maior flexibilidade, conforto e conveniência aos jogadores, permitindo foco e desempenho durante o game. Base Reduzida Mais Espaço para Jogar. Nova base desenvolvida com o objetivo de liberar mais espaço ao jogador, sem perder a estabilidade do monitor. Ajustes Flexíveis Mais Conforto Durante os Jogos. Com ajuste de altura e inclinação livre, os players podem configurar rapidamente de acordo com suas necessidades para um resultado melhor, jogando de uma forma mais confortável.',
      avaliacao: 99,
      comentarios: [
        Comentario(usuario: 'Leandro', texto: 'Disparado um dos melhores se não o melhor custo beneficio do mercado'),
        Comentario(usuario: 'Matheus', texto: 'Gostei muito da qualidade de imagem, designer, e ajustes'),
        Comentario(usuario: 'Giovana', texto: 'Nota 10 gostei muito'),
      ],
    ),
    Produto(
      id: 15,
      fabricante: 'Redragon',
      nome: 'Mouse Gamer Redragon Impact (M913) LED RGB, Preto',
      resumo: 'Mouse Gamer Redragon Impact',
      preco: 149.99,
      urlImagem: 'imagens/mouse/Mouse_Gamer_Redragon.png',
      imageUrls: [
        'imagens/mouse/Mouse_Gamer_Redragon1.png',
        'imagens/mouse/Mouse_Gamer_Redragon2.png',
      ],
      categorias: 'Mouse',
      cor: 'Preto',
      descricao:
          'Redragon IMPACT (M913) Especificações: - Poderoso Sensor Pixart PMW 3327 de 12400 DPI com 5 modos de DPI (500/1000/2000/3000/6200 DPI) (30G ACC) - Retroiluminação LED RGB Ajustável. - Polling Rate de 1000hz (Tempo de Resposta Ajustável via Software de 1/2/4/8ms) - Botão para Troca de DPI "On-The-Fly". - 18 Botões Programáveis.',
      avaliacao: 88,
      comentarios: [
        Comentario(usuario: 'Renato', texto: 'Ótimo produto, recomendo.'),
        Comentario(usuario: 'Jean', texto: 'Gostei muito da qualidade'),
        Comentario(usuario: 'Ruan', texto: 'O mouse é ótimo'),
      ],
    ),
    Produto(
      id: 16,
      fabricante: 'Redragon',
      nome: 'Teclado mecânico gamer TVASTAR LED RGB, azul com fio',
      resumo: 'Teclado mecânico TVASTAR',
      preco: 415.25,
      urlImagem: 'imagens/teclados/TECLADO_MECANICO_REDRAGON.png',
      imageUrls: [
        'imagens/teclados/TECLADO_MECANICO_REDRAGON1.png',
        'imagens/teclados/TECLADO_MECANICO_REDRAGON2.png',
      ],
      categorias: 'Teclado',
      cor: 'Azul',
      descricao:
          'Modelo K566B-RGB - Exclusivo trabalho de pintura azul metálico por toda estrutura do teclado, teclado Mecânico de Alto Desempenho, 19 modos de iluminação RGB incluindo modo de personalização individual de Teclas, teclas para controle Multimídia-12. Controle de Iluminação -On-The-Fly. Funcionamento da Tecla Win -Alternável (Pressione FN+Win para Desligar / Ligar a Tecla). Switches:Redragon Blue. Construção robusta em Plástico ABS para maior Durabilidade. Dimensões 37 x 15 x 3cm',
      avaliacao: 66,
      comentarios: [
        Comentario(usuario: 'Larissa', texto: 'Recomendo. Macio'),
        Comentario(usuario: 'Fernando', texto: 'Ótimo teclado. Atende o que é preciso e as teclas são macias'),
        Comentario(usuario: 'Bruna', texto: 'Eu amei'),
      ],
    )
  ]; 
}
