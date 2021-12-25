import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'get_network_image_widget.dart';

class ProductDetailsCarouselSlider extends StatefulWidget {
  final List<String> imgUrls;
  final String productIdHeroAnimation;
  const ProductDetailsCarouselSlider(
      {Key? key, required this.imgUrls, required this.productIdHeroAnimation})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductCardCarouselSlider();
  }
}

class _ProductCardCarouselSlider extends State<ProductDetailsCarouselSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // TODO :: Hero(tag: productIdHeroAnimation,
      CarouselSlider(
        items: widget.imgUrls
            .map((item) => SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: GetNetworkImageWidget(
                    imgUrl: item,
                    fit: BoxFit.contain,
                  ),
                ))
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: widget.imgUrls.length > 1,
            viewportFraction: 0.7,
            onPageChanged: (index, reason) => setState(() => _current = index)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imgUrls.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 40.0,
              height: 40.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.red.withOpacity(_current == entry.key ? 1 : 0),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GetNetworkImageWidget(
                    imgUrl: entry.value, fit: BoxFit.fill),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
