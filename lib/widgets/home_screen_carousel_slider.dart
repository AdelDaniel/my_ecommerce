import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_ecommerce/models/models.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreenCarouselSlider extends StatelessWidget {
  final List<Category> categories;
  const HomeScreenCarouselSlider({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // height: MediaQuery.of(context).size.height / 2.6,
        // aspectRatio: 2.0,
        viewportFraction: 0.8,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        initialPage: 0,
        // enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
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
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Stack(
                    children: <Widget>[
                      FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          width: 1000.0,
                          placeholder: kTransparentImage,
                          image: item.imgUrl),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            '${categories.indexOf(item)} ${item.name}',
                            style: TextStyle(
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
