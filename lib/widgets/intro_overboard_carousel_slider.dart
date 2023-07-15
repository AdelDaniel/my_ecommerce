import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class IntroOverboardCarouselSlider extends StatefulWidget {
  const IntroOverboardCarouselSlider({Key? key}) : super(key: key);

  @override
  State<IntroOverboardCarouselSlider> createState() =>
      _IntroOverboardCarouselSliderState();
}

class _IntroOverboardCarouselSliderState
    extends State<IntroOverboardCarouselSlider> {
  final List<String> images = const [
    'assets/images/overboard1.png',
    'assets/images/overboard2.png',
    'assets/images/overboard3.png'
  ];

  final List<String> titles = const [
    'Sell your products.',
    "Buy the best for you.",
    'Happy shopping.'
  ];

  final List<String> descriptions = const [
    'Sell the products you have and spread your lovely products.',
    'Have a look at new, modern and different products and info about the product you want.',
    'Choose the best best products to buy and show us what you can do.'
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (ctx, index, _) {
            return CarouseItem(
                image: images[index],
                title: titles[index],
                description: descriptions[index]);
          },
          options: CarouselOptions(
            onPageChanged: (index, _) => setState(() => _current = index),
            height: 350,
            viewportFraction: 1.0,
            autoPlay: true,
          ),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: _current,
          decorator: DotsDecorator(
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}

class CarouseItem extends StatelessWidget {
  const CarouseItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ClipRect(child: Image.asset(image)),
        ),
        SizedBox(
          height: 43,
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
        Container(
          height: 68,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            description,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
