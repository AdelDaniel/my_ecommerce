part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProductEvent extends ProductEvent {
  const LoadProductEvent();

  @override
  List<Object?> get props => [];
}

class UpdateProductsEvent extends ProductEvent {
  const UpdateProductsEvent({required this.products});
  final List<Product> products;

  @override
  List<Object> get props => [products];
}

class AddProductEvent extends ProductEvent {
  const AddProductEvent({required this.product});
  final Product product;

  @override
  List<Object> get props => [product];
}
