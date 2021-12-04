import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants.dart';

import '../../models/models.dart';
import '../../widgets/get_network_image_widget.dart';

class HomeScreenCategoryCarouselSlider extends StatelessWidget {
  final List<Category> categories;
  const HomeScreenCategoryCarouselSlider({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        enlargeCenterPage: true,
      ),
      items: _carouselSliderItems(),
    );
  }

  List<Widget> _carouselSliderItems() {
    return categories
        .map((item) => Container(
              margin: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 10, bottom: 10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Stack(
                    children: <Widget>[
                      GetNetworkImageWidget(
                        imgUrl: item.imgUrl,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: constMarginHerizontal),
                          child: Text(
                            '${categories.indexOf(item)} ${item.name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
  }
}
