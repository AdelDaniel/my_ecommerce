import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'get_network_image_widget.dart';

class ProductCardCarouselSlider extends StatefulWidget {
  final List<String> imgUrls;
  const ProductCardCarouselSlider({Key? key, required this.imgUrls})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductCardCarouselSlider();
  }
}

class _ProductCardCarouselSlider extends State<ProductCardCarouselSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        items: widget.imgUrls
            .map((item) => SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: GetNetworkImageWidget(
                    imgUrl: item,
                    fit: BoxFit.fill,
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
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 30.0,
                height: 30.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey
                          .withOpacity(_current == entry.key ? 1 : 0.3),
                      width: 3.5),
                ),
                child: GetNetworkImageWidget(
                    imgUrl: entry.value, fit: BoxFit.fill),
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
