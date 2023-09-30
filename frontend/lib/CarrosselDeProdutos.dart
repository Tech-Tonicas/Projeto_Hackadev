import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  ProductImageCarousel({required this.imageUrls});

  @override
  _ProductImageCarouselState createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: widget.imageUrls.map((imageUrl) {
            return Container(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 150, // Altura do carrossel
            aspectRatio: 16 / 9, // Proporção da imagem
            viewportFraction: 1, // Uma imagem por vez
            enableInfiniteScroll: false, // Desabilitar rolagem infinita
            initialPage: 0, // Página inicial
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Atualiza o índice atual
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                if (_currentIndex > 0) {
                  _carouselController.previousPage();
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                (index) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                if (_currentIndex < widget.imageUrls.length - 1) {
                  _carouselController.nextPage();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
