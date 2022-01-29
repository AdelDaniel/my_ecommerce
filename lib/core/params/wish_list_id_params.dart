import 'package:equatable/equatable.dart';

import '../../models/models.dart';

class WishListParams extends Equatable {
  final Product _product;
  const WishListParams({required Product product}) : _product = product;
  Product get product => _product;

  @override
  List<Object> get props => [_product];
}
