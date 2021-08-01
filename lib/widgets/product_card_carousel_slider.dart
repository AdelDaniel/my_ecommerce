// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ProductCardCarouselSlider extends StatefulWidget {
//   final List<String> imgUrls;
//   const ProductCardCarouselSlider({Key? key, required this.imgUrls})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _ProductCardCarouselSlider();
//   }
// }

// class _ProductCardCarouselSlider extends State<ProductCardCarouselSlider> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       CarouselSlider(
//         items: widget.imgUrls
//             .map((item) => Container(
//                 // width: double.infinity,
//                 height: double.infinity,
//                 child: Image.network(
//                   item,
//                   fit: BoxFit.fitWidth,
//                 )))
//             .toList(),
//         carouselController: _controller,
//         options: CarouselOptions(
//             // enlargeStrategy: CenterPageEnlargeStrategy.height,
//             pageSnapping: true,
//             autoPlay: false,
//             enlargeCenterPage: true,
//             enableInfiniteScroll: true,
//             onPageChanged: (index, reason) => setState(() => _current = index)),
//       ),
//       Positioned(
//         bottom: 0.0,
//         left: 0.0,
//         right: 0.0,
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.imgUrls.asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                   width: 10.0,
//                   height: 10.0,
//                   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.grey
//                           .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     ]);
//   }
// }
