import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/category/presentation/bloc/category_bloc.dart';

import '../../core/constants/constants.dart';

import '../../models/models.dart';
import '../../widgets/get_network_image_widget.dart';

class HomeScreenCategoryCarouselSlider extends StatelessWidget {
  const HomeScreenCategoryCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is LoadingCategoryState) {
        return CircularProgressIndicator();
      } else if (state is LoadedCategoryState) {
        return CarouselSlider(
          options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 8),
            enlargeCenterPage: true,
          ),
          items: state.categories
              .map((item) => CarouselSliderItem(category: item))
              .toList(),
        );
      } else if (state is ErrorCategoryState) {
        return Text("Oops! Something went wrong..");
      } else {
        return Text("Oops! Something went wrong..");
      }
    });
  }
}

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10, bottom: 10),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Stack(
            children: <Widget>[
              GetNetworkImageWidget(
                imgUrl: category.imgUrl,
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
                      vertical: 10.0, horizontal: constMarginHerizontal),
                  child: Text(
                    category.name,
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
    );
  }
}
