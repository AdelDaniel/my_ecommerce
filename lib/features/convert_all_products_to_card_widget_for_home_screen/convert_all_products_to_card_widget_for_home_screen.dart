import 'package:my_ecommerce/models/models.dart';
import 'package:my_ecommerce/widgets/widgets.dart';

// todo :: this method will help us to make only one card for the singel product
/// if the product card will be appear at many listviews it will get the same product
/// and not create many of it.. so the same one for each list that appear at home screen
///
/// also we need to create another one for wishlist screen so the height is not const
///
/// it will help for hero animation
///
List<CustomProductCardWidget> getAllCards(List<Product> products) {
  final List<CustomProductCardWidget> allProducts = products
      .map<CustomProductCardWidget>(
          (Product product) => CustomProductCardWidget(
                currentProduct: product,
                isCardFixedHeight: true,
                width: 170,
                imageHeight: 100,
              ))
      .toList();

  return allProducts
      .where((element) => element.currentProduct.isAvalible)
      .toList();
}
