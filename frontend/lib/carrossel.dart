import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Carrossel extends StatefulWidget {
  const Carrossel({super.key});
@override
_CarrosselState createState() => _CarrosselState();
}

class _CarrosselState extends State <Carrossel>{
  @override
  Widget build(BuildContext context) {
    return 
 CarouselSlider(
 // options: CarouselOptions(height: 400.0), //
  items: [Image.asset('imagens/carrossel/promoMonitor.jpeg'),
          Image.asset('imagens/carrossel/promoMouse.jpeg'),
          Image.asset('imagens/carrossel/promoTeclado.jpeg'),
          Image.asset('imagens/carrossel/promoTecladoAzul.jpeg')
    
    ],
    options: CarouselOptions(
      height: 150, //altura do carrossel
      aspectRatio: 16/10, //proporção da largura/altura
      viewportFraction: 0.97, //define a largura total da tela visível
      initialPage: 0, //determina qual slide será exibido
      enableInfiniteScroll: true, //exibição infinita dos slides
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3), //intervalo entre a troca de slides
      autoPlayAnimationDuration: Duration(milliseconds: 800), //duração da animação
      autoPlayCurve: Curves.fastOutSlowIn, //animação
      enlargeCenterPage: true, //ampliação do slide central
      enlargeFactor: 0.3, //fator de aumento
      scrollDirection: Axis.horizontal, //rolagem horizontal
      
      /*onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,*/
   )
 );
}
}



    