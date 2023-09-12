class Produto {
  final String fabricante;
  final String nome;
  final double preco;
  final String urlImagem;
  final String categorias;
  final String descricao;

  Produto({required this.fabricante,required this.nome, required this.preco, required this.urlImagem, required this.categorias, required this.descricao});

  String get formattedPreco {
    String precoString = preco.toStringAsFixed(2);
    return 'R\$ ${precoString.replaceAll('.', ',')}';
  }
}

class ProdutosData {
  static final List<Produto> produtos = [
    Produto(
      fabricante: "Fallen",
      nome: 'Headset Gamer Fallen Pantera Eco, Drivers 50mm, Preto',
      preco: 199.90,
      urlImagem: 'imagens/fones/FoneFallenPreto.png',
      categorias: 'fone',
      descricao: 'Headset Gamer Fallen Pantera Eco. O Conforto Que Você Precisa. Earpads em courino, que oferecem maior conforto e uma espuma de memória para potencializar a performance do som. Sistema de Som Preciso. Drivers de 50mm, que proporcionam maior precisão do áudio, diminuindo distorções e mantendo a estabilidade durante os jogos.',
    ),

     Produto(
      fabricante: "Samsung",
      nome: 'Monitor Gamer Curvo Samsung, tela ultrawide, HDMI',
      preco: 3299.99,
      urlImagem: 'imagens/monitor/Monitorsamsung.png',
      categorias: 'monitor',
      descricao: 'Monitor Gamer Samsung Odyssey G5 34 VA, Curvo, Wide, 165 Hz, 2K QHD, 1ms, FreeSync Premium, HDR10, HDMI/DisplayPort. Cenas vívidas que te envolvem, abrangente tela com 1000R preenche toda a sua visão periférica e te coloca no lugar do personagem. Viva uma experiência inédita de tirar o fôlego. Gráficos que ultrapassam os limites, resolução Ultra-WQHD proporciona uma visão vasta e abrangente do mundo dos seus jogos com detalhes verdadeiramente realistas. O amplo tamanho da tela elimina a distração de bordas no meio e cabos bagunçados de um setup com dois monitores. Pronto para conquistar os inimigos, sem atrasos e sem oscilações. Taxa de Atualização de 165 Hz. Desempenho ultrarrapido. O AMD FreesSync Premium apresenta uma tecnologia de sincronização adaptável que reduz o travamento de tela, oscilação e atrasos. Gráficos inspiradores com HDR10. Um caleidoscópio de tonalidades dá vida às cenas dos seus jogos de forma mais vibrante do que nunca. Revele os segredos que se escondem nas sombras com pretos profundamente escuros, brancos luminosos e uma resolução incrivelmente detalhada.',
    ),

    Produto(
      fabricante: "MSI", 
      nome: 'Mouse gamer MSI preto INTERCEPTOR DS B1 1600DPI',
      preco: 99.90,
      urlImagem: 'imagens/mouse/MOUSE_GAMER_MSI.png',
      categorias: 'mouse',
      descricao: 'Sensor óptico de gaming grade - botão DPI on-the-fly - design ergonômico e alças laterais anti-deslizamento - superfície antiderrapante - sistema de peso ajustável - conector banhado a ouro Especificações: sensor: óptico - resolução: 1600 DPI - botões: 6 botões - interface: conector USB 2',
    ),

     Produto(
      fabricante: " Logitech",
      nome: 'Teclado Mecânico Gamer, cabo removível, Logitech G - CX',
      preco: 467.00,
      urlImagem: 'imagens/teclados/Teclado_Mecanico_Gamer.png',
      categorias: 'teclado',
      descricao: 'Pensado e desenvolvido para você que busca um teclado com alto desempenho de nível competitivo com velocidade e precisão, a Logitech trás o teclado G Pro mecânico para jogos com design tenkeyles, totalmente compacto garantindo maior espaço em sua mesa, para demais itens gamers que utilizar. Os switches GX Clicky oferecem um som de clique nitido e um feedback tátil para obter um pressionamento de tecla sólido e seguro. Sem contar com a iluminação RGB LIGHTSYNC programável e ajustável, sua memória interna permite personalização e armazenamento de iluminação para várias partidas.'
    ),

     Produto(
      fabricante: "Redragon", 
      nome: 'Teclado mecânico Redragon TVASTAR RGB azul metalico',
      preco: 415.25,
      urlImagem: 'imagens/teclados/TECLADO_MECANICO_REDRAGON.png',
      categorias: 'teclado',
      descricao: 'Modelo K566B-RGB - Exclusivo trabalho de pintura azul metálico por toda estrutura do teclado, teclado Mecânico de Alto Desempenho, 19 modos de iluminação RGB incluindo modo de personalização individual de Teclas, teclas para controle Multimídia-12. Controle de Iluminação -On-The-Fly. Funcionamento da Tecla Win -Alternável (Pressione FN+Win para Desligar / Ligar a Tecla). Switches:Redragon Blue. Construção robusta em Plástico ABS para maior Durabilidade. Dimensões 37 x 15 x 3cm',
    ),

    Produto(
      fabricante: "JBL",
      nome: 'Headset Gamer JBL Quantum One RGB',
      preco: 169.99,
      urlImagem: 'imagens/fones/foneJBL.png',
      categorias: 'fone',
      descricao: 'JBL QUANTUM ONE. Transforme seu jogo em uma experiência épica. O fone de ouvido com fio JBL Quantum ONE oferece áudio de nível profissional com o rastreamento de cabeça aprimorado JBL QuantumSPHERE 360, som surround espacial e cancelamento de ruído ativo ajustado para jogos. Projetado para posicionamento de áudio preciso, o JBL QuantumSOUND Signature proporciona uma curva de som envolvente por meio dos drivers de 50 mm certificados Hi-Res alta definição. O microfone removível com foco na voz permite interações claras entre os jogadores, com supressão de ruídos, recursos de silenciamento e um seletor de equilíbrio de áudio entre jogo e bate-papo certificado pelo DISCORD. O design leve e ergonômico mantém você confortável enquanto o JBL QuantumENGINE traz opções de customização e perfis de usuário. O fone de ouvido JBL Quantum ONE apresenta o que há de mais moderno em áudio, a fim de proporcionar a mais profunda sensação de realismo. Obtenha vantagem profissional com o rastreamento de cabeça aprimorado JBL QuantumSPHERE 360. O JBL QuantumSPHERE 360*, com tecnologia JBL QuantumENGINE, proporciona a você um nível profissional de posicionamento de áudio 3D em seu PC. A calibragem personalizada do algoritmo da JBL, com o sensor de movimento e o microfone, é feita exclusivamente para o JBL Quantum ONE, proporcionando aos jogadores de PC um posicionamento de áudio preciso e de última geração, além de um ambiente sonoro fixo e independente que melhora seus instintos naturais. O JBL Quantum ONE é equipado com o áudio DTS-X 2.0. *Disponível apenas em PC com conexão USB via JBL QuantumENGINE.',
    ),

    Produto(
      fabricante: "Apple",
      nome: 'IMac ME086BZ Apple Intel Core i5 Quad Core - 8GB 1TB LED 21,5"',
      preco: 5685.00,
      urlImagem: 'imagens/monitor/iMac_ME086BZ_Apple.png',
      categorias: 'monitor',
      descricao: 'IMAC 21.5 2,7GHz Intel Core i5 quad core, Intel Iris Pro Graphics (Turbo Boost de até 3,2GHz) com 4MB de cache L3 (ME087BZ/A) - Tela de 21,5 polegadas (diagonal), retroiluminada por LED, com tecnologia IPS, resolução de 1920x1080 e suporte para milhões de cores, Disco rígido de 1TB (5400 rpm) Possibilidade de configuração para 1TB Fusion Drive ou para 256GB ou 512GB de armazenamento em flash (SSD). 8GB (dois módulos de 4GB) de memória DDR3 de 1600MHz Possibilidade de configuração para 16GB.',
    ),
    Produto(
      fabricante: "ASUS", 
      nome: 'Teclado ASUS ROG claymore cherry MX red Mechanical gaming',
      preco: 1168.68,
      urlImagem: 'imagens/teclados/TECLADO_ASUS_ROG.png',
      categorias: 'teclado',
      descricao: 'TECLADO ASUS ROG CLAYMORE. RGB SWITCH CHERRY MX RED. O ROG Claymore é o primeiro teclado mecânico RGB para jogos do mundo, com teclado numérico removível que oferece opções de posicionamento enquanto você joga.',
    ),

     Produto(
      fabricante: "Havit",
      nome: 'Headset Gamer Havit, Drivers 53mm, Microfone Plugável',
      preco: 234.99,
      urlImagem: 'imagens/fones/foneHavitVermelho.png',
      categorias: 'fone',
      descricao: 'Headset Gamer Havit H2002D Aparência e textura proporcionais, simples e generosas. Jaqueta de liga leve com frente e superfície de plástico com revestimento de piano. Design Gamer em preto, para combinar com seu setup e além de ter qualidade surpreendente por um preço baixo. Head set Gamer Havit com excelente custo benefício. Desempenho e Compatibilidade com PC, PS4 e XBOX Faixa de cabeça ajustável suspensa única, design ergonômico, confortável de usar, antiviolência e não fácil de danificar. À prova de desgaste, resistente a arranhões e atualizado e adequado para pessoas diferentes, o peso de toda a máquina é moderado, desgastando por muito tempo sem pressão. Microfone plugável de 3,5 mm compatível para PC, PS4 e XBOX e Alto-falante magnético de 53 mm de alta qualidade de som para distinguir o som dos jogos e a frequência fracionária alta e baixa meticulosa ao ouvir música.'
    ),

  Produto(
      fabricante: "Redragon",
      nome: 'Mouse Gamer Redragon Impact RGB, 12400dpi - M908',
      preco: 230.45,
      urlImagem: 'imagens/mouse/Mouse_Gamer_Redragon_Impact.png',
      categorias: 'mouse',
      descricao: 'Mouse Gamer Redragon Impact M908 - Poderoso sensor pixart PMW 3327 de 12400 DPI com 5 modos de DPI (500/1000/2000/3000/6200 DPI) (30G ACC), retroiluminação LED RGB ajustável. Polling rate de 1000hz (Tempo de resposta ajustável via software de 1/2/4/8ms), 12 botões programáveis, compatível com software para configuração de macro/ajuste iluminação RGB/configurações de performance. Memória interna para armazenamento de configurações. Micro-interruptores com durabilidade de até 10 milhões de cliques, ajuste de peso para uma experiência única personalizada.',
    ),

    Produto(
      fabricante: "Lenovo",
      nome: 'Monitor Lenovo Gamer G25-10 24,5 pol.',
      preco: 1232.99,
      urlImagem: 'imagens/monitor/Monitor_Lenovo.png',
      categorias: 'monitor',
      descricao: 'Levando os jogos a um novo patamar, o Monitor Lenovo G25-10 vem equipado com tudo o que você precisa. O monitor de jogos de 24,5 pol. está pronto para E-sports. Resolução de 1.980 x 1.080, tempo de resposta extremamente rápido de 1 ms e taxa de atualização impressionante de 144 Hz garantem a execução suave da maioria dos jogos. A tensão e a tremulação da tela são reduzidas graças à tecnologia de AMD FreeSync™ que otimiza a experiência de jogos. O conforto permanece uma prioridade com a certificação TÜV Eye Comfort, enquanto a inclinação e a base elevada permitem uma implantação flexível. ',
    ),

    Produto(
      fabricante: "Fallen",
      nome: 'Headset Gamer Fallen Eco, RGB, Drivers 50mm, USB, Preto',
      preco: 294.99,
      urlImagem: 'imagens/fones/HEADSET_HAVIT.png',
      categorias: 'fone',
      descricao: 'Headset Gamer Fallen, 7.1 Surround, PC, Xbox One/Series X e PS5. A inspiração no jogo é o que nos motiva e o reconhecimento vem quando a nossa comunidade de fãs brasileiros participam dando o nome do nosso primeiro Headset! O Headset Morcego, vem com alto-falantes de alta qualidade e Surround Virtual 7.1, proporcionando uma experiência única ao jogador. É a imersão ao jogo em um novo patamar. Construído em alumínio industrial, garante durabilidade e leveza. As almofadas do Headset Morcego são removíveis e produzidas em material sintético oferecendo conforto ao jogador, mantendo o som de alta qualidade e sem cansar. O design ergonômico foi projetado para exercer a menor pressão possível ao jogador, tornando mais agradável o uso contínuo do equipamento. Outro grande diferencial é um par de almofadas extras, inclusas de fábrica, para substituição caso queira. O Microfone é removível, possui tecnologia de redução de ruído, colaborando para uma comunicação mais precisa e sem interferência. Desenvolvido para uso em campeonatos, em lan houses ou mesmo em casa, tenha a certeza que você conseguirá passar todas as instruções para a sua equipe de forma rápida e sem ruídos.',
    ),
    
    Produto(
      fabricante: "T-Dagger", 
      nome: 'Mouse gamer com fio T-DAGGER LIEUTENANT ',
      preco: 92.37,
      urlImagem: 'imagens/mouse/MOUSE_GAMER_COM_FIO.png',
      categorias: 'mouse',
      descricao: 'O Mouse Gamer T-Dagger Second Lieutenant combina um design exclusivo com configurações personalizáveis, velocidade, precisão e estilo inigualáveis, com uma iluminação customizável RGB com efeito de onda arco-íris, trazendo um estilo único ao seu setup. O sensor de 8000 dpi, oferece uma excelente acuracidade ao jogador.',
    ),

     Produto(
      fabricante: "Benq", 
      nome: 'Monitor gamer Benq ZOWIE XL2546K Grafite Fosco',
      preco: 2800.00,
      urlImagem: 'imagens/monitor/Monitor_Benq.png',
      categorias: 'monitor',
      descricao: 'Uma nova geração da série XL de monitores gamers para PC, com ajustes aprimorados para maior flexibilidade, conforto e conveniência aos jogadores, permitindo foco e desempenho durante o game. Base Reduzida Mais Espaço para Jogar. Nova base desenvolvida com o objetivo de liberar mais espaço ao jogador, sem perder a estabilidade do monitor. Isso permite espaço para mais movimento durante o jogo e ficar confortável com mais flexibilidade. Ajustes Flexíveis Mais Conforto Durante os Jogos. Entendemos que cada jogador(a) tem suas configurações preferidas. Uma combinação única da altura e do ângulo do monitor. Com ajuste de altura e inclinação livre, os players podem configurar rapidamente de acordo com suas necessidades para um resultado melhor, jogando de uma forma mais confortável. Configurações Compartilhadas do XL-K,compartilhe suas configurações com seu time, seus amigos ou fãs.',
    ),
    
     Produto(
      fabricante: "Redragon",
      nome: 'Mouse Gamer Redragon Impact M913',
      preco: 149.99,
      urlImagem: 'imagens/mouse/Mouse_Gamer_Redragon.png',
      categorias: 'mouse',
      descricao: 'Redragon IMPACT (M913) Especificações: - Poderoso Sensor Pixart PMW 3327 de 12400 DPI com 5 modos de DPI (500/1000/2000/3000/6200 DPI) (30G ACC) - Retroiluminação LED RGB Ajustável. - Polling Rate de 1000hz (Tempo de Resposta Ajustável via Software de 1/2/4/8ms) - Botão para Troca de DPI "On-The-Fly". - 18 Botões Programáveis.',
    ),
    
    Produto(
      fabricante: "TteSPORTS",
      nome: 'Thermaltake - Poseidon ZX Illuminated Blue',
      preco: 199.00,
      urlImagem: 'imagens/teclados/Teclado_Thermaltake.png',
      categorias: 'teclado',
      descricao: 'O POSIDON ZX Illuminated - Blue Switch Edition - é um teclado mecânico econômico no formato tenkeyless. Perfeito para um jogador usar em casa ou lan onde o espaço é mais limitado. O POSIDON ZX possui interruptores mecânicos certificados TteSPORTS, classificados para 50 milhões de pressionamentos de teclas, com a primeira garantia de 5 anos do mundo para teclados mecânicos para jogos.',
    )
  ];
}